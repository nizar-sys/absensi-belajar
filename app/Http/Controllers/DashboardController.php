<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use App\Models\Guru;
use App\Models\Kelas;
use App\Models\Mapel;
use App\Models\Pembelajaran;
use App\Models\Siswa;
use App\Models\StudentParent;
use App\Models\Tapel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {
        return view('pages.dashboard.index',[
          'siswa' => Siswa::get()->count(),
          'guru' => Guru::get()->count(),
          'admin' => Admin::whereHas('user', function($q){
            $q->where('role', 'admin');
          })->get()->count(),
          'kelas' => Kelas::get()->count(),
          'tapel' => Tapel::get()->count(),
          'mapel' => Mapel::get()->count(),
          'pembelajaran' => Pembelajaran::get()->count(),
          'role' => Auth::user()->role,
          'ortu' => StudentParent::count()
        ]);
    }
}
