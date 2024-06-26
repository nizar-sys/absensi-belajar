<?php

namespace App\Http\Controllers;

use App\Models\Presensi;
use Illuminate\Http\Request;

class ScanPresensiController extends Controller
{
    public function __construct()
    {
        if (auth()->check() && auth()->user()->role != 'siswa') abort(404);
    }

    public function index()
    {
        return view('pages.presensi.scan_presensi');
    }

    public function store(Request $request)
    {
        $request->validate([
            'pertemuan_id' => 'required|exists:pertemuans,id',
            'siswa_id' => 'required|exists:siswas,id',
        ]);

        $presensi = Presensi::where('pertemuan_id', $request->pertemuan_id)
            ->where('siswa_id', $request->siswa_id)
            ->first();

        if ($presensi) {
            return response()->json([
                'status' => 'error',
                'message' => 'Presensi sudah dilakukan',
            ]);
        }

        Presensi::create([
            'pertemuan_id' => $request->pertemuan_id,
            'siswa_id' => $request->siswa_id,
            'keterangan' => "H"
        ]);

        return response()->json([
            'status' => 'success',
            'message' => 'Berhasil melakukan presensi',
        ]);
    }
}
