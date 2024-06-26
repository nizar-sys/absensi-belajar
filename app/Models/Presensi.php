<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Presensi extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public function pertemuan()
    {
      return $this->belongsTo(Pertemuan::class);
    }

    public function siswa()
    {
      return $this->belongsTo(Siswa::class);
    }

}
