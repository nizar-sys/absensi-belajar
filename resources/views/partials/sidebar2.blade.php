<!-- Main Sidebar Container -->
@php
    use App\Models\Ekstrakurikuler;

    $user = Auth::user();

    $admin = Auth::user()->admin;
    $guru = Auth::user()->guru;
    $siswa = Auth::user()->siswa;

@endphp

<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a class="brand-link pl-4">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
            class="bi bi-journal-bookmark" viewBox="0 0 16 16">
            <path fill-rule="evenodd"
                d="M6 8V1h1v6.117L8.743 6.07a.5.5 0 0 1 .514 0L11 7.117V1h1v7a.5.5 0 0 1-.757.429L9 7.083 6.757 8.43A.5.5 0 0 1 6 8" />
            <path
                d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2" />
            <path
                d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1z" />
        </svg>
        <span class="brand-text font-weight-light d-xs-none pl-4 text-uppercase">{{ auth()->user()->role }}
        </span>
        <span class="brand-text font-weight-light d-sm-none">Presensi - <span
                style="text-transform: capitalize">{{ auth()->user()->role }}</span>
        </span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                data-accordion="false">

                <li class="nav-item mt-1">
                    <a href="{{ '/' . $user->role . '/dashboard' }}"
                        class="nav-link {{ Request::is($user->role . '/dashboard*') ? 'active' : '' }}">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Dashboard
                        </p>
                    </a>
                </li>

                @if (in_array(auth()->user()->role, ['admin', 'guru']))
                    <li class="nav-header fw-bold mt-2">MASTER DATA</li>

                    <li
                        class="nav-item
                {{ Request::is($user->role . '/datasiswa*') |
                Request::is($user->role . '/dataadmin*') |
                Request::is($user->role . '/dataortu*') |
                Request::is($user->role . '/dataguru*')
                    ? 'menu-open'
                    : '' }}">

                        <a href="#"
                            class="nav-link
                  {{ Request::is($user->role . '/datasiswa*') |
                  Request::is($user->role . '/dataadmin*') |
                  Request::is($user->role . '/dataortu*') |
                  Request::is($user->role . '/dataguru*')
                      ? 'active'
                      : '' }}">

                            <i class="nav-icon fas fa-copy"></i>
                            <p>
                                BIODATA
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            @can('admin')
                                <li class="nav-item">
                                    <a href="{{ '/' . $user->role . '/dataortu' }}"
                                        class="nav-link {{ Request::is($user->role . '/dataortu*') ? 'active' : '' }}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Data Orangtua</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="{{ '/' . $user->role . '/datasiswa' }}"
                                        class="nav-link {{ Request::is($user->role . '/datasiswa*') ? 'active' : '' }}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Data Siswa</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="{{ '/' . $user->role . '/dataguru' }}"
                                        class="nav-link {{ Request::is($user->role . '/dataguru*') ? 'active' : '' }}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Data Guru</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="{{ '/' . $user->role . '/dataadmin' }}"
                                        class="nav-link {{ Request::is($user->role . '/dataadmin*') ? 'active' : '' }}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Data Admin</p>
                                    </a>
                                </li>
                            @endcan

                            @can('guru')
                                <li class="nav-item">
                                    <a href="{{ '/' . $user->role . '/datasiswa' }}"
                                        class="nav-link {{ Request::is($user->role . '/datasiswa*') ? 'active' : '' }}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Data Siswa</p>
                                    </a>
                                </li>
                            @endcan

                        </ul>
                    </li>


                    @can('admin')
                        <li
                            class="nav-item
                    {{ Request::is($user->role . '/datasekolah*') |
                    Request::is($user->role . '/datakelas*') |
                    Request::is($user->role . '/datamapel*') |
                    Request::is($user->role . '/datapembelajaran*') |
                    Request::is($user->role . '/datatapel*')
                        ? 'menu-open'
                        : '' }}
              ">
                            <a href="#"
                                class="nav-link
                      {{ Request::is($user->role . '/datasekolah*') |
                      Request::is($user->role . '/datakelas*') |
                      Request::is($user->role . '/datamapel*') |
                      Request::is($user->role . '/datapembelajaran*') |
                      Request::is($user->role . '/datatapel*')
                          ? 'active'
                          : '' }}
                  ">
                                <i class="nav-icon fas fa-table"></i>
                                <p>
                                    ADMINISTRASI
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="{{ '/' . $user->role . '/datasekolah' }}"
                                        class="nav-link {{ Request::is($user->role . '/datasekolah*') ? 'active' : '' }}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Data Sekolah</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="{{ '/' . $user->role . '/datatapel' }}"
                                        class="nav-link {{ Request::is($user->role . '/datatapel*') ? 'active' : '' }}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Data Tahun Pelajaran</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="{{ '/' . $user->role . '/datakelas' }}"
                                        class="nav-link {{ Request::is($user->role . '/datakelas*') ? 'active' : '' }}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Data Kelas</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="{{ '/' . $user->role . '/datamapel' }}"
                                        class="nav-link {{ Request::is($user->role . '/datamapel*') ? 'active' : '' }}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Data Mata Pelajaran</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="{{ '/' . $user->role . '/datapembelajaran' }}"
                                        class="nav-link {{ Request::is($user->role . '/datapembelajaran*') ? 'active' : '' }}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Data Pembelajaran</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    @endcan
                @endif

                @if (Auth::user()->role == 'kepala-sekolah')
                    <li class="nav-header mt-2 fw-bold">Master Data</li>

                    <li class="nav-item">
                        <a href="{{ '/kepala-sekolah/datakelas' }}"
                            class="nav-link {{ Request::is('kepala-sekolah/datakelas*') ? 'active' : '' }}">
                            <i class="nav-icon fas fa-building"></i>
                            <p>Data Kelas</p>
                        </a>
                    </li>
                @endif


                {{-- WALI KELAS --}}
                @if (Auth::user()->role == 'guru')
                    @if ($guru->kelas)
                        <li
                            class="nav-item
                {{ Request::is($user->role . '/datakelas*') ? 'menu-open' : '' }}
                ">
                            <a href="#"
                                class="nav-link
                    {{ Request::is($user->role . '/datakelas*') ? 'active' : '' }}
                    ">
                                <i class="nav-icon fas fa-edit"></i>
                                <p>
                                    WALI KELAS
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="{{ '/' . $user->role . '/datakelas' }}"
                                        class="nav-link {{ Request::is($user->role . '/datakelas*') ? 'active' : '' }}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Data Kelas</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    @endif
                @endif
                {{-- END WALI KELAS --}}

                {{-- GURU MAPEL --}}
                @if (Auth::user()->role == 'guru')
                    @if (count($guru->pembelajaran) > 0)
                        <li class="nav-header mt-2 fw-bold">Presensi</li>

                        <li class="nav-item">
                            <a href="{{ '/guru/presensi' }}"
                                class="nav-link {{ Request::is('guru/presensi*') ? 'active' : '' }}">
                                <i class="nav-icon fas fa-book"></i>
                                <p>Kelola Presensi</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ '/guru/rekappresensi' }}"
                                class="nav-link {{ Request::is('guru/rekappresensi*') ? 'active' : '' }}">
                                <i class="nav-icon fas fa-file"></i>
                                <p>Rekap Presensi</p>
                            </a>
                        </li>
                    @endif
                @endif
                {{-- END GURU MAPEL --}}

                @if (Auth::user()->role == 'guru' && is_null(Auth::user()->guru->kelas))
                @else
                    @if (auth()->user()->role != 'guru')
                        <li class="nav-header mt-2 fw-bold">Presensi</li>
                        <li class="nav-item">
                            <a href="{{ '/' . $user->role . '/presensi' }}"
                                class="nav-link {{ Request::is($user->role . '/presensi*') ? 'active' : '' }}">
                                <i class="nav-icon fas fa-book"></i>
                                <p>
                                    Presensi
                                </p>
                            </a>
                        </li>
                        @if (auth()->user()->role == 'siswa')
                            <li class="nav-item">
                                <a href="{{ '/' . $user->role . '/scan-presensi' }}"
                                    class="nav-link {{ Request::is($user->role . '/scan-presensi*') ? 'active' : '' }}">
                                    <i class="nav-icon fas fa-camera"></i>
                                    <p>
                                        Scan Presensi
                                    </p>
                                </a>
                            </li>
                        @endif
                        @can('admin')
                            <li class="nav-item">
                                <a href="{{ '/admin/rekappresensi' }}"
                                    class="nav-link {{ Request::is('admin/rekappresensi*') ? 'active' : '' }}">
                                    <i class="nav-icon fas fa-file"></i>
                                    <p>
                                        Rekap Presensi
                                    </p>
                                </a>
                            </li>
                        @endcan
                    @endif

                @endif

                <li class="nav-header mt-2 fw-bold">NOTIFIKASI</li>
                <li class="nav-item">
                    <a href="{{ '/' . $user->role . '/notifikasi' }}"
                        class="nav-link {{ Request::is($user->role . '/notifikasi*') ? 'active' : '' }}">
                        <i class="nav-icon fas fa-bell"></i>
                        <p>
                            Notifikasi
                            @if ($notifBelumDibaca->count() >= 1)
                                <span class="badge badge-warning px-2 right">
                                    {{ count($notifBelumDibaca) }}
                                </span>
                            @endif
                        </p>
                    </a>
                </li>

                <li class="nav-header mt-2 fw-bold">SAYA</li>
                <li class="nav-item">
                    <a href="{{ '/' . $user->role . '/profil' }}"
                        class="nav-link {{ Request::is($user->role . '/profil*') ? 'active' : '' }}">
                        <i class="nav-icon fas fa-user"></i>
                        <p>Profil</p>
                    </a>
                </li>
                <li class="nav-item mb-3">
                    <a href="#" data-bs-toggle="modal" data-bs-target="#modal-logout" class="nav-link">
                        <i class="nav-icon ion ion-log-out"></i>
                        <p>Logout</p>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
