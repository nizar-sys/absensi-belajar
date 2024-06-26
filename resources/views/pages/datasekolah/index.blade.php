@extends('layouts.main')

@section('content')
    @php
        use Carbon\Carbon;
    @endphp

    <div class="content-header">
        <div class="container-fluid">

            <div class="row mb-0">
                <div class="col-sm-6">
                    <h4 class="fw-bold poppins m-0">Data Sekolah</h4>
                </div>
                <div class="col-sm-6">
                    @if (session()->has('success'))
                        <div class="alert alert-success alert-dismissible fade show mb-0" role="alert">
                            @include('_success')
                            {!! session('success') !!}
                        </div>
                    @endif
                </div>
            </div>

        </div>
    </div>

    <section class="content">
        <div class="container-fluid">
            <div class="row">
                @if (!$sekolah)
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                Tambah Data Sekolah
                            </div>
                            <div class="card-body">
                                <form action="{{ route('datasekolah.store') }}" method="POST">
                                    @csrf

                                    @include('pages.datasekolah._addform')

                                    {{-- <input type="hidden" name="user_id" id="" value="1"> --}}
                                </form>
                            </div>
                        </div>
                    </div>
                @else
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                Edit Data Sekolah
                            </div>
                            <div class="card-body">
                                <form action="{{ route('datasekolah.update', $sekolah->id) }}" method="POST">
                                    @csrf
                                    @method('PUT')

                                    @include('pages.datasekolah._editform')

                                    {{-- <input type="hidden" name="user_id" id="" value="1"> --}}
                                </form>
                            </div>
                        </div>
                    </div>
                @endif

            </div>

        </div>
    </section>

    <script>
        function previewImage() {
            const image = document.querySelector('#gambar');
            const imgPreview = document.querySelector('.img-preview');

            imgPreview.style.display = 'block';

            const oFReader = new FileReader();
            oFReader.readAsDataURL(gambar.files[0]);


            oFReader.onload = function(oFREvent) {
                imgPreview.src = oFREvent.target.result;
            }
        }
    </script>
@endsection
