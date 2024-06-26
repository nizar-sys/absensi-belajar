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
    <a class="brand-link">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
            class="bi bi-journal-bookmark" viewBox="0 0 16 16">
            <path fill-rule="evenodd"
                d="M6 8V1h1v6.117L8.743 6.07a.5.5 0 0 1 .514 0L11 7.117V1h1v7a.5.5 0 0 1-.757.429L9 7.083 6.757 8.43A.5.5 0 0 1 6 8" />
            <path
                d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2" />
            <path
                d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1z" />
        </svg>
        <span class="brand-text font-weight-light d-xs-none text-uppercase">{{ auth()->user()->role }}
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
                <li class="nav-item mt-1">
                    <a href="{{ '/' . $user->role . '/datasiswa' }}"
                        class="nav-link {{ Request::is($user->role . '/datasiswa*') ? 'active' : '' }}">
                        <i class="fas fa-circle nav-icon "></i>
                        <p>
                            Data Siswa
                        </p>
                    </a>
                </li>
                <li class="nav-item mt-1">
                    <a href="{{ '/' . $user->role . '/dataguru' }}"
                        class="nav-link {{ Request::is($user->role . '/dataguru*') ? 'active' : '' }}">
                        <i class="fas fa-circle nav-icon "></i>
                        <p>
                            Data Guru
                        </p>
                    </a>
                </li>
                <li class="nav-item mt-1">
                    <a href="{{ '/' . $user->role . '/dataadmin' }}"
                        class="nav-link {{ Request::is($user->role . '/dataadmin*') ? 'active' : '' }}">
                        <i class="fas fa-circle nav-icon "></i>
                        <p>
                            Data Admin
                        </p>
                    </a>
                </li>
                <li class="nav-item mt-1">
                    <a href="{{ '/' . $user->role . '/datakelas' }}"
                        class="nav-link {{ Request::is($user->role . '/datakelas*') ? 'active' : '' }}">
                        <i class="fas fa-circle nav-icon "></i>
                        <p>
                            Data Kelas
                        </p>
                    </a>
                </li>
                <li class="nav-item mt-1">
                    <a href="{{ '/' . $user->role . '/datasekolah' }}"
                        class="nav-link {{ Request::is($user->role . '/datasekolah*') ? 'active' : '' }}">
                        <i class="fas fa-circle nav-icon "></i>
                        <p>
                            Data Sekolah
                        </p>
                    </a>
                </li>
                <li class="nav-item mt-1">
                    <a href="{{ '/' . $user->role . '/datatapel' }}"
                        class="nav-link {{ Request::is($user->role . '/datatapel*') ? 'active' : '' }}">
                        <i class="fas fa-circle nav-icon "></i>
                        <p>
                            Data Tapel
                        </p>
                    </a>
                </li>
                <li class="nav-item mt-1">
                    <a href="{{ '/' . $user->role . '/datamapel' }}"
                        class="nav-link {{ Request::is($user->role . '/datamapel*') ? 'active' : '' }}">
                        <i class="fas fa-circle nav-icon "></i>
                        <p>
                            Data Mapel
                        </p>
                    </a>
                </li>
                <li class="nav-item mt-1">
                    <a href="{{ '/' . $user->role . '/datapembelajaran' }}"
                        class="nav-link {{ Request::is($user->role . '/datapembelajaran*') ? 'active' : '' }}">
                        <i class="fas fa-circle nav-icon "></i>
                        <p>
                            Data Pembelajaran
                        </p>
                    </a>
                </li>
                <li class="av mt-1">
                    <a href="{{ '/' . $user->role . '/presensi' }}"
                        class="nav-link {{ Request::is($user->role . '/presensi*') ? 'active' : '' }}">
                        <i class="fas fa-circle nav-icon "></i>
                        <p>
                            Presensi
                        </p>
                    </a>
                </li>

                <li class="nav-header mt-2 fw-bold">SAYA</li>
                <li class="nav-item mb-3">
                    <a href="{{ '/' . $user->role . '/profil' }}"
                        class="nav-link {{ Request::is($user->role . '/profil*') ? 'active' : '' }}">
                        <i class="nav-icon fas fa-user"></i>
                        <p>Profil</p>
                    </a>
                </li>

            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
