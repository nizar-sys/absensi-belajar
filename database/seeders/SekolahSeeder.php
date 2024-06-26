<?php

namespace Database\Seeders;

use App\Models\Sekolah;
use Illuminate\Database\Seeder;

class SekolahSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
      collect([
        [
          'name' => 'SMK Pancasila 3 Baturetno',
          'npsn' => '20338523',
          // 'nss' => '',
          'telepon' => '( 0273 ) 461081',
          'email' => 'smkpancasila3@yahoo.com',
          'alamat' => ' Jl. Raya Baturetno Km. 1, Desa Baturetno, Kecamatan Baturetno, Kabupaten Wonogiri, Propinsi Jawa Tengah, Baturetno, Wonogiri, Jawa Tengah 57673',
          'kodepos' => '57673',
          'website' => 'smkpancasila3.sch.id',
          'kepsek' => 'Luthfiyyatun Nuur Jannah, S.Pd., M.Pd',
          'nipkepsek' => '19800202 200604 1 008',
        ],
      ])->each(function($sekolah){
        Sekolah::create($sekolah);
      });
    }
}
