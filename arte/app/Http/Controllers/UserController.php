<?php

namespace App\Http\Controllers;

use App\Class\Userclass;
use Illuminate\Http\Request;



class UserController extends Controller
{


    public function __contruct()
    {
        $this->middleware('auth:api', ['except' => ['login', 'register']]);
    }
    
    public function login(Request $request){
        $login = new Userclass();
        return $login->signIn($request);
    }

    public function register(Request $request){
        $register = new Userclass();
        return $register->signUp($request);
    }

    public function profile(){
        $profile = new Userclass();
        return $profile->userprofile();
    }

    public function logout(){
        $logout = new Userclass();
        return $logout->signout();
    }

    public function refresh(){
        $refresh = new Userclass();
        return $refresh->refreshToken();
    }


}
