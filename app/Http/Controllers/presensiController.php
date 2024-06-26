<?php

namespace App\Http\Controllers;

use App\Models\Presensi;
use App\Models\Pembelajaran;
use App\Models\Pertemuan;
use App\Models\Siswa;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redis;
use Illuminate\Validation\ValidationException;

class presensiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (auth()->user()->role === 'admin' || auth()->user()->role === 'kepala-sekolah') {
            $pembelajaran = Pembelajaran::orderBy('mapel_id', 'ASC')->get();
        } elseif (auth()->user()->role === 'guru') {
            $pembelajaran = Pembelajaran::where('guru_id', auth()->user()->guru->id)->orderBy('mapel_id', 'ASC')->get();
        }

        $user = auth()->user();
        $role = $user->role;

        if ($role === 'siswa') {
            $kelasId = $user->siswa->kelas_id;
        } elseif ($role === 'orangtua') {
            $kelasId = Siswa::where('parent_id', $user->ortu->id)->pluck('kelas_id')->toArray();
        }

        if (isset($kelasId)) {
            $pembelajaran = Pembelajaran::whereIn('kelas_id', (array) $kelasId)
                ->orderBy('mapel_id', 'ASC')
                ->get();
        }


        $role = auth()->user()->role;
        $pertemuan = Pertemuan::get();
        return view('pages.presensi.index', compact('pembelajaran', 'role', 'pertemuan'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        // return view('pages.presensi.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $pertemuan = Pertemuan::where('pembelajaran_id', $request->pembelajaran_id)->get()->pluck('pertemuan_ke');
        $reqPertemuanKe = intval($request->pertemuan_ke);

        $valid = $request->validate([
            'pembelajaran_id' => 'required',
            'pertemuan_ke' => 'required',
            'tanggal' => 'required|date',
            'dari_pukul' => 'required',
            'sampai_pukul' => 'required',
        ]);

        if ($pertemuan->contains($reqPertemuanKe)) {
            return back()->with([
                'failed' => 'Pertemuan ke ' . $reqPertemuanKe .  ' pada kelas ini sudah ada!',
            ]);
        }

        if (!$valid) {
            return back()->with([
                'failed' => 'Permintaan gagal diproses, silahkan cek formulir kembali!',
            ]);
        } else {
            $pert = Pertemuan::create($request->all());
            return redirect(route('kelolapresensi.edit', ['role' => auth()->user()->role, 'id' => $pert->id]))
                ->withSuccess('Pertemuan ke-' . $reqPertemuanKe . ' berhasil ditambahkan!');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($role, $id)
    {
        $pembelajaran = Pembelajaran::find($id);
        $user = auth()->user();

        if ($role == 'siswa' && $user->siswa->kelas_id != $pembelajaran->kelas_id) {
            abort('403');
        } elseif ($role == 'guru' && $user->guru->id != $pembelajaran->guru_id) {
            abort('403');
        } else {
            if ($role == 'siswa') {
                $siswa = Siswa::where('user_id', auth()->user()->id)
                    ->whereHas('user', function ($q) {
                        $q->where('is_aktif', true);
                    })->get();
            } else if ($role == 'orangtua') {
                $siswa = Siswa::where('parent_id', auth()->user()->ortu->id)
                    ->whereHas('user', function ($q) {
                        $q->where('is_aktif', true);
                    })
                    ->where('kelas_id', $pembelajaran->kelas_id)
                    ->get();
            } else {
                $siswa = Siswa::getSiswaAktifKelas($pembelajaran->kelas_id);
            }
            return view('pages.presensi.show', [
                'pembelajaran' => $pembelajaran,
                'siswa' => $siswa,
                'pertemuan' => Pertemuan::where('pembelajaran_id', $id)->orderBy('pertemuan_ke', 'ASC')->get(),
                'presensi' => Presensi::get(),
                'role' => auth()->user()->role,
            ]);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $role, $id)
    {
        $lastPertemuanKe = Pertemuan::whereId($id)->get()->pluck('pertemuan_ke');
        $pertemuan = Pertemuan::where('pembelajaran_id', $request->pembelajaran_id)->where('pertemuan_ke', '!=', $lastPertemuanKe)->get()->pluck('pertemuan_ke');
        $reqPertemuanKe = intval($request->pertemuan_ke);

        $valid = $request->validate([
            'pembelajaran_id' => 'required',
            'pertemuan_ke' => 'required',
            'tanggal' => 'required|date',
            'dari_pukul' => 'required',
            'sampai_pukul' => 'required',
        ]);

        if ($pertemuan->contains($reqPertemuanKe)) {
            return back()->with([
                'failed' => 'Pertemuan ke ' . $reqPertemuanKe .  ' pada kelas ini sudah ada!',
            ]);
        }

        if (!$valid) {
            return back()->with([
                'failed' => 'Permintaan gagal diproses, silahkan cek formulir kembali!',
            ]);
        } else {
            Pertemuan::whereId($id)->update($request->except(['_token', '_method']));
            return back()
                ->withSuccess('Pertemuan ke-' . $reqPertemuanKe . ' berhasil diperbarui!');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, $role, $id)
    {
        Pertemuan::find($id)->delete();
        return back()->withSuccess('Pertemuan ke-' . $request->pertemuan_ke . ' berhasil dihapus!');
    }

    public function editpresensi($role, $id)
    {

        $pertemuan = Pertemuan::find($id);
        $user = auth()->user();

        if ($role == 'guru' && $user->guru->id != $pertemuan->pembelajaran->guru_id) {
            abort('403');
        }

        return view('pages.presensi.edit', [
            'pembelajaran' => $pertemuan->pembelajaran,
            'siswa' => Siswa::where('kelas_id', $pertemuan->pembelajaran->kelas_id)
                ->whereHas('user', function ($q) {
                    $q->where('is_aktif', true);
                })
                ->when($role == 'siswa', function ($q) use ($user) {
                    $q->where('user_id', $user->id);
                })
                ->get(),
            'pertemuan' => $pertemuan,
            'presensi' => Presensi::where('pertemuan_id', $id)->get(),
            'role' => auth()->user()->role,
        ]);
    }

    public function updatepresensi(Request $request, $role, $id)
    {
        $pertemuan = Pertemuan::find($id);
        $siswas = $request->siswa_id;
        $siswas = Siswa::whereIn('id', $siswas)->get()->pluck('id');

        foreach ($siswas as $i => $siswa) {

            $presensi = Presensi::whereIn('siswa_id', $siswas)->where('pertemuan_id', $pertemuan->id)->get();
            $presensi = $presensi->where('siswa_id', $siswa)->first();
            if ($presensi) {
                if (!$request->keterangan[$i]) {
                    $presensi->delete();
                } else {
                    $presensi->update([
                        'keterangan' => $request->keterangan[$i]
                    ]);
                }
            } else {
                if ($request->keterangan[$i]) {
                    Presensi::create([
                        'siswa_id' => $siswa,
                        'pertemuan_id' => $pertemuan->id,
                        'keterangan' => $request->keterangan[$i]
                    ]);
                }
            }
        }
        return redirect(route('presensi.show', ['role' => auth()->user()->role, 'presensi' => $pertemuan->pembelajaran_id]))
            ->withSuccess('Data berhasil diperbarui!');
    }
}
