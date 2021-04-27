<?php

namespace App\Class;

use App\Models\User;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class Userclass
{


    public function signIn(Request $request){
        $validator = Validator::make(
            $request->all(),
            [
                'email'     =>  'required|email',
                'password'  =>  'required|string|min:4'
            ]);

        if($validator->fails()){
            return response()-json([
                $validator->errors(),
            ],422);
        }

// try{

//             if (! $token = JWTAuth::attempt($request->all())) {
//                 return response()->json([
//                     'message' => false,
//                     'error' => 'invalid_credentials'], 400);
//             }
//             $user = JWTAuth::user();
//             return response()->json([
//                 'success'=> true,
//                 'user'=> $user,
//                 'token' =>$token
//             ]);
//         }catch (JWTException $e) {
//             return response()->json(['error' => 'could_not_create_token'], 500);
//         }


        if(!$token = auth()->attempt($validator->validated())){
            return response()->json([
                'message'   =>  'Unauthorized',
                'user'     => "none",
            ],401);
        }
        return $this->createToken($token);
    }

    public function signUp(Request $request){
        $validator = Validator::make($request->all(),[
            'name'      => 'required|string|min:3',
            'email'     => 'required|string|email|max:200|unique:users',
            'password'  => 'required|string|min:4',
            'image_profile' => 'required|string',
            'category_id'   =>  'required|integer'
        ]);

        if($validator->fails()){
            return response()->json([
                'Message'  => false,
                'user'     => "none",
                $validator->errors(),
            ],422);
        }

        $user = User::create(
            array_merge(
                $validator->validated(),
                ['password'=> Hash::make($request->password)],
            ),
        );

        return response()->json([
            'Message' => true,
            'user' => $user
        ],201);
    }

    public function userprofile(){
        return response()->json(auth()->user());
    }

    public function signout(){
        auth()->logout();
        return response()->json(
            [
                'message'   =>  'User Sign Out.'
            ]
        );
    }
    public function refreshToken(){
        return $this->createToken($this->auth()->refresh());
    }

    public function createToken($token){
        $this->auth()->factory()->setTTL(96 * 60);
        return response()->json([
            'message'       => 'sucess',
            'access_token'  =>  $token,
            'token_type'    =>  'Bearer',
            'expires_in'    =>  auth()->factory()->getTTL() * 60,
            'user'          =>  auth()->user()
        ]);
    }
    protected function auth(){
        return Auth::guard();
    }
}
