<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Api\Controller;

use App\Models\User;
use Hash;
use Auth;
use Validator;

class LoginController extends Controller
{
    public function login(Request $request) {
        // Авторизация
        $user = $request->only(['email', 'password']);
        if (!$token = \JWTAuth::attempt($user)) {
            return response()->json([
                'error' => true, 
                'message' => 'Incorrect Login/Password'
            ], 401);
        }

        return response()->json(['token' => $token ], 200);
    }

    public function register(Request $request) {
        // Валидация
        $rules = [
            'email' => 'required|min:5|max:255|unique:users',
            'password' => 'required|min:6|max:255'
        ];

        $validator = Validator::make($request->all(), $rules);
        
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }
        

        // Создание
        User::create([
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        return response()->json('Access', 201);
    }
}