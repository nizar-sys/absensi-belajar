<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Siswa extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function kelas()
    {
      return $this->belongsTo(Kelas::class);
    }

    public function presensi()
    {
      return $this->hasMany(Presensi::class);
    }

    public static function getSiswaAktifKelas($kelasId)
    {
      return self::whereHas('user', function ($query) {
          $query->where('is_aktif', true);
      })->where('kelas_id', $kelasId)->get();
    }

    public function ortu()
    {
        return $this->belongsTo(StudentParent::class, 'parent_id')->withDefault();
    }
}
