<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\UserResource;
use App\User;
use App\Http\Requests\UserStore;
use Exception;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\GuzzleException;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name'              => 'required|string|max:255',
            'email'             => 'required|string|email|max:255|unique:users',
            'password'          => 'required|string|min:8|confirmed',
        ]);
        if ($validator->fails()) {
            $jsonError=response()->json($validator->errors()->all(), 400);
            return \Response::json($jsonError);
        }

        try {
            $input = $request->all();
            $user = new User();

            $input['name' ]    = $input['name'];
            $input['email']    = $input['email'];
            $input['password'] = Hash::make($input['password']);
            $user = User::create($input);

            // $user = User::create([
            //     'name'      => request()->only('name'),//$data['name'],
            //     'email'     => request()->only('email'),//$$data['email'],
            //     'password'  => bcrypt($request->password),
            //     //Hash::make($request->password),//bcrypt($request->password),//request()->only('password')),//$data['password']),
            // ]);
    
            // And created user until here
            // $clients = new Client();
            // $client = $clients->where('password_client', 1)->first();

            // $request->request->add([
            //     'grant_type'    => 'password',
            //     'client_id'     => $client->id,
            //     'client_secret' => $client->secret,
            //     'username'      => $data['email'],
            //     'password'      => $data['password'],
            //     'scope'         => null,
            // ]);

            // Fire off the internal request. 
            // $token = Request::create(
            //     'oauth/token',
            //     'POST'
            // );
            // return \Route::dispatch($token);
            return new UserResource($user);
        } catch (Exception $exception) {
            return response()->json(['http_code' =>  400,'message'=> 'Internal server error','status'=> false], 400);
        }
    }

    public function getAll()
    {
        try {
            $user = User::get();
            return UserResource::collection($user);
        } catch  (Exception $exception) {
            return response()->json(['http_code' =>  400,'message'=> 'Internal server error','status'=> false], 400);
        }
    }

    public function getById($id)
    {
        try {
            $user = User::findOrFail($id);
            return new UserResource($user);
        } catch  (Exception $exception) {
            return response()->json(['http_code' =>  400,'message'=> 'Internal server error','status'=> false], 400);
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
        User::create($request);
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
        // 
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        // 
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
            return response()->json(['data'      =>  $userModel,'http_code' =>  200,'message'   =>  'Success deleted user','status'    => true]);
        } catch (Exception $exception) {
            return response()->json(['http_code' =>  400,'message'=> 'Internal server error','status'=> false], 400);
        }
    }
}
