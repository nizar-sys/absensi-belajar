<?php

use App\Http\Controllers\presensiController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\DataAdminController;
use App\Http\Controllers\DataGuruController;
use App\Http\Controllers\DataKelasController;
use App\Http\Controllers\DataMapelController;
use App\Http\Controllers\DataPembelajaranController;
use App\Http\Controllers\DataSekolahController;
use App\Http\Controllers\DataSiswaController;
use App\Http\Controllers\DataTapelController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\LogoutController;
use App\Http\Controllers\NotifikasiController;
use App\Http\Controllers\ProfilController;
use App\Http\Controllers\RekappresensiController;
use App\Http\Controllers\ScanPresensiController;
use App\Http\Controllers\StudentParentController;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function (User $role) {
  if (Auth::check()) {
      $role = Auth::user()->role;
      return redirect($role . '/dashboard');
  } else {
      return redirect('/login');
  }
})->name('home');

Route::get('/login', [LoginController::class, 'index'])->name('login')->middleware('guest');
Route::post('/login', [LoginController::class, 'cekLogin'])->name('login')->middleware('guest');

Route::group(['middleware' => ['auth']], function(){
  Route::post('/logout', LogoutController::class)->name('logout');

  Route::get('/{role}/dashboard', DashboardController::class)->name('dashboard.index');

  Route::resource('/{role}/datasiswa', DataSiswaController::class);
  Route::post('/siswa/import', [DataSiswaController::class, 'import'])->name('datasiswa.import');

  Route::resource('/{role}/dataortu', StudentParentController::class);
  Route::resource('/{role}/dataguru', DataGuruController::class);
  Route::resource('/{role}/dataadmin', DataAdminController::class);
  Route::resource('/{role}/datakelas', DataKelasController::class);
  Route::resource('/admin/datasekolah', DataSekolahController::class);
  Route::put('/admin/datasekolah/logoupdate/{id}', [DataSekolahController::class,'updateLogo'])->name('logosekolah.update');
  Route::resource('/admin/datatapel', DataTapelController::class);
  Route::resource('/admin/datamapel', DataMapelController::class);
  Route::resource('/{role}/datapembelajaran', DataPembelajaranController::class);
  Route::resource('/{role}/presensi', presensiController::class);
  Route::resource('/{role}/scan-presensi', ScanPresensiController::class);
  Route::get('/{role}/presensi/kelolapresensi/{id}', [presensiController::class, 'editpresensi'])->name('kelolapresensi.edit');
  Route::put('/{role}/presensi/kelolapresensi/{id}', [presensiController::class, 'updatepresensi'])->name('kelolapresensi.update');
  Route::resource('/{role}/rekappresensi', RekappresensiController::class);
  Route::get('/{role}/rekappresensi/print/{id}', [RekappresensiController::class, 'printRekapitulasi'])->name('rekappresensi.print');

  Route::resource('/{role}/notifikasi', NotifikasiController::class);

  Route::get('/{role}/profil', [ProfilController::class, 'index'])->name('profil.index');
  Route::put('/updateprofil/{id}', [ProfilController::class, 'update'])->name('profil.update');
  Route::put('/updatefoto/{id}', [ProfilController::class, 'updatePhoto'])->name('foto.update');
  Route::put('/updateakun/{id}', [ProfilController::class, 'updateAkun'])->name('akunsaya.update');

});
