<?php

namespace App\Http\Controllers;

use App\Http\Requests\SekolahRequest;
use App\Models\Sekolah;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class DataSekolahController extends Controller
{
    public function index(Request $request)
    {
        if (auth()->user()->role !== 'admin') {
            abort('403');
        }

        $sekolah = Sekolah::first();
        return view('pages.datasekolah.index', compact('sekolah'));
    }

    public function store(SekolahRequest $request)
    {
        DB::beginTransaction();
        try {
            Sekolah::create($request->all());

            $user = $this->createOrUpdateUser($request);

            $this->createOrUpdateAdmin($user, $request);

            DB::commit();
            return redirect(route('datasekolah.index'))->withSuccess('Data Sekolah berhasil dibuat!');
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()->withErrors('Terjadi kesalahan: ' . $e->getMessage());
        }
    }

    public function update(SekolahRequest $request, $id)
    {
        DB::beginTransaction();
        try {
            $sekolah = Sekolah::findOrFail($id);
            $sekolah->update($request->all());

            $user = $this->createOrUpdateUser($request);

            $this->createOrUpdateAdmin($user, $request);

            DB::commit();
            return redirect(route('datasekolah.index'))->withSuccess('Data Sekolah berhasil diperbarui!');
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()->withErrors('Terjadi kesalahan: ' . $e->getMessage());
        }
    }

    private function createOrUpdateUser(SekolahRequest $request)
    {
        $user = User::where('role', 'kepala-sekolah')->first();

        $payload = $this->createUserPayload($request);

        if ($user) {
            $user->update($payload);
        } else {
            $user = User::create($payload);
        }

        return $user;
    }

    private function createOrUpdateAdmin(User $user, SekolahRequest $request)
    {
        $adminData = [
            'name' => $request->kepsek,
            'nip' => str_replace(' ', '', $request->nipkepsek),
            'jk' => 'L',
            'telepon' => $request->telepon,
            'alamat' => $request->alamat
        ];

        if ($user->admin) {
            $user->admin->update($adminData);
        } else {
            $user->admin()->create($adminData);
        }
    }

    private function createUserPayload(SekolahRequest $request)
    {
        return [
            'username' => explode('@', $request->email)[0],
            'email' => $request->email,
            'email_verified_at' => now(),
            'role' => 'kepala-sekolah',
            'foto' => 'profile.jpg',
            'is_aktif' => 1,
            'password' => Hash::make($request->password ?? 'password')
        ];
    }
}
