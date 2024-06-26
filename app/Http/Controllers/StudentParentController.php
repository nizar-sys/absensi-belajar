<?php

namespace App\Http\Controllers;

use App\Models\StudentParent;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\URL;

class StudentParentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (auth()->user()->role !== 'admin') {
            abort('403');
        } else {
            return view('pages.dataortu.index', [
                'ortu' => StudentParent::orderBy('name', 'ASC')->get(),
                'role' => Auth::user()->role,
            ]);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $role = auth()->user()->role;
        return view('pages.dataortu.create', compact('role'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name'      => 'required',
            'jk'        => 'required',
            'username'   => 'required|unique:users',
            'password'   => 'required',
        ]);

        $inputUser = User::create([
            'username' => $request->username,
            'password' => bcrypt($request->password),
            'role' => 'orangtua',
        ]);
        $inputUser; // Create User

        $request['user_id'] = $inputUser->id;
        $inputOrtu = $request->except(['_token', '_method', 'username', 'password']);
        StudentParent::create($inputOrtu);
        return redirect(route('dataortu.index', auth()->user()->role))->with([
            'success' => 'Data Orangtua: <b>' . $request->name . '</b> berhasil ditambahkan!',
            'role' => auth()->user()->role,
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\StudentParent  $studentParent
     * @return \Illuminate\Http\Response
     */
    public function show(StudentParent $studentParent)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\StudentParent  $studentParent
     * @return \Illuminate\Http\Response
     */
    public function edit($role, $id)
    {
        $ortu = StudentParent::find($id);
        $role = auth()->user()->role;
        $urlSebelumnya = URL::previous();
        return view('pages.dataortu.edit', compact('ortu', 'role', 'urlSebelumnya'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\StudentParent  $studentParent
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $role, $id)
    {
        $ortu = StudentParent::find($id);
        $request->validate([
            'name'      => 'required',
            'jk'        => 'required',
            'is_aktif'   => 'required',
            'username'   => 'required|unique:users,username,' . $ortu->user_id,
        ]);

        if ($request->filled('password')) {
            $ortu->update($request->except('is_aktif', 'username', 'password'));
            User::where('id', $ortu->user_id)->update([
                'is_aktif' => $request->is_aktif,
                'username' => $request->username,
                'password' => bcrypt($request->password),
            ]);
        } else {
            $ortu->update($request->except('is_aktif', 'username', 'password'));
            User::where('id', $ortu->user_id)->update([
                'is_aktif' => $request->is_aktif,
                'username' => $request->username,
            ]);
        }

        return redirect(route('dataortu.index', auth()->user()->role))->with([
            'success' => 'Data Orangtua: <b>' . $request->name . '</b> berhasil diperbarui!',
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\StudentParent  $studentParent
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, $id)
    {
        User::where('id', $request->user_id)->delete();
        return redirect(route('dataortu.index', auth()->user()->role))->withSuccess('Data Orangtua: <b>' . $request->name . '</b> berhasil dihapus!');
    }
}
