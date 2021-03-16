<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Resources\UserResource;
use App\User;
use App\Http\Requests\UserStore;
use App\Http\Requests\UserUpdate;
use Exception;
use App\Imports\UsersImport;
use Maatwebsite\Excel\Facades\Excel;
use App\Http\Controllers\Controller;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {
            $users = User::orderBy('created_at', 'DESC')->paginate(5);
            return view('user.index', compact('users'));
        } catch (Exception $exception) {
            // 
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        try {
            return view('user.create');
        } catch (Exception $exception) {
            // 
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(UserStore $request)
    {
        try {
            $user = new User();
            $user->name     = $request->name;
            $user->email    = $request->email;
            $user->password = bcrypt($request->password);
            $user->save();

            return redirect()->route('user.index');
        } catch (Exception $exception) {
            return $exception;
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        try {
            $user = User::findOrFail($id);
            return view('user.edit', compact('user'));
        } catch (Exception $exception) {
            return $exception;
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UserUpdate $request, $id)
    {
        try {
            $userModel = User::findOrFail($id);
            $userModel->name = $request->name;
            $userModel->email = $request->email;
            $userModel->save();
            return redirect()->route('user.index');
        } catch (Exception $exception) {
            return $exception;
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            $userModel = User::findOrFail($id);
            $userModel->delete();
            return redirect()->route('user.index');
        } catch (Exception $exception) {
            return $exception;
        }
    }

    public function import(Request $request) 
    {
        try {
            $model = Excel::import(new UsersImport, request()->file('file'));
            return redirect()->route('user.index');
        } catch (Exception $exception) {
            return $exception;
        }
    }
}