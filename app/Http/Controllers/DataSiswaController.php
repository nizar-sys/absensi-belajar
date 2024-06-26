<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreSiswaRequest;
use App\Http\Requests\UpdateSiswaRequest;
use App\Models\Kelas;
use App\Models\Siswa;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use App\Imports\SiswaImport;
use App\Models\StudentParent;
use Maatwebsite\Excel\Facades\Excel;

class DataSiswaController extends Controller
{
  /**
   * Display a listing of the resource.
   *
   * @return \Illuminate\Http\Response
   */
  public function index()
  {
      if(auth()->user()->role === 'siswa'){
        abort('403');
      } else{
        return view('pages.datasiswa.index', [
          'siswa' => Siswa::orderBy('name', 'ASC')->get(),
          'role' => Auth::user()->role,
        ]);
      }
  }

  /**
   * Show the form for creating a new resource.
   *
   * @return \Illuminate\Http\Response
   */
  public function create()
  {
      return view('pages.datasiswa.create', [
        'kelas' => Kelas::orderBy('tingkat', 'ASC')->orderBy('name', 'ASC')->get(),
        'role' => Auth::user()->role,
        'ortu' => StudentParent::orderBy('name', 'ASC')->get(),
      ]);
  }

  /**
   * Store a newly created resource in storage.
   *
   * @param  \Illuminate\Http\Request  $request
   * @return \Illuminate\Http\Response
   */
  public function store(StoreSiswaRequest $request)
  {
    // dd($request->all());
    $inputUser = User::create([
      'username' => $request->username,
      'password' => bcrypt($request->password),
      'role' => 'siswa',
    ]);
    $inputUser;

    $request['user_id'] = $inputUser->id;

    $inputSiswa = $request->except([
      '_token',
      '_method',
      'username',
      'password'
    ]);

    Siswa::create($inputSiswa);

    $role = Auth::user()->role;

    return redirect(route('datasiswa.index', $role))->withSuccess('Data siswa berhasil ditambahkan!');

  }

  /**
   * Display the specified resource.
   *
   * @param  int  $id
   * @return \Illuminate\Http\Response
   */
  public function show($id)
  {
      //
  }

  /**
   * Show the form for editing the specified resource.
   *
   * @param  int  $id
   * @return \Illuminate\Http\Response
   */
  public function edit($role, $id)
  {
      return view('pages.datasiswa.edit', [
        'siswa' => Siswa::find($id),
        'kelas' => Kelas::get(),
        'role' => Auth::user()->role,
        'ortu' => StudentParent::orderBy('name', 'ASC')->get(),
      ]);
  }

  /**
   * Update the specified resource in storage.
   *
   * @param  \Illuminate\Http\Request  $request
   * @param  int  $id
   * @return \Illuminate\Http\Response
   */
  public function update(UpdateSiswaRequest $request, $role, $id)
  {
    $request->validate([
      'username' => 'required|unique:users,username,' . $request->user_id,
    ]);

      $dataSiswa = [
        'name' => $request->name,
        'kelas_id' => $request->kelas_id,
        'jk' => $request->jk,
        'nis' => $request->nis,
        'nisn' => $request->nisn,
        'alamat' => $request->alamat,
        'telepon' => $request->telepon,
        'parent_id' => $request->parent_id,
      ];

      if($request->filled('password')){
        $dataUser = [
          'username' => $request->username,
          'is_aktif' => $request->is_aktif,
          'password' => bcrypt($request->password),
        ];
      } else {
        $dataUser = [
          'username' => $request->username,
          'is_aktif' => $request->is_aktif,
        ];
      }
      // dd($request->all());
      Siswa::find($id)->update($dataSiswa);
      User::where('id', $request->user_id)->update($dataUser);
      return redirect(route('datasiswa.index',['datasiswa' => $id, 'role' => $role]))->withSuccess('Data Siswa: <b>' . Str::before($request->name, ' ') . '</b> berhasil diperbarui!');
  }

  /**
   * Remove the specified resource from storage.
   *
   * @param  int  $id
   * @return \Illuminate\Http\Response
   */
  public function destroy(Request $request, $role, $id)
  {
    $siswa = Siswa::find($id);
    User::where('id', $siswa->user_id)->delete();
    return redirect(route('datasiswa.index', ['datasiswa' => $id, 'role' => $role]))->withSuccess('Data Siswa: <b>' . Str::before($siswa->name, ' ') . '</b> berhasil dihapus!');
  }

  public function import(Request $request)
  {
    $request->validate([
      'file' => ['required', 'file', 'distinct']
    ]);

    $file = $request->file('file');
    if ($file->getClientOriginalExtension() != 'xlsx') {
        return back()->withFailed('Import Gagal! File yang anda masukkan tidak sesuai ketentuan!');
    }

    Excel::import(new SiswaImport, request()->file('file'));
    return back()->with('success', 'Data siswa berhasil diimport!');

  }
}
