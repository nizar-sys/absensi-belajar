<?php

namespace Database\Seeders;

use App\Models\Siswa;
use Illuminate\Database\Seeder;

class SiswaSeeder extends Seeder
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
          'user_id' => 7,
          'kelas_id' => 1,
          'name' => 'Yudatama',
          'jk' => 'L',
          'nis' => '0202020222',
          'nisn' => '011111111',
          'alamat' => 'Wonogiri',
          'telepon' => '087736167959',
        ],
        
      ])->each(function($siswa){
        Siswa::create($siswa);
      });

    }
}
