<?php

namespace App\Classes;

use Validator;
use App\Models\Record;

class RecordFilter {
    public function issetRecord($id) {
        $record = Record::find($id);
        if ( is_null($record)) {
            return response()->json([
                'error' => true,
                'message' => 'Not found'
            ], 404);
        }
        return $record;
    }

    public function isAuth($request) {
        $user = $request->only(['email', 'password']);
        if (!$token = \JWTAuth::attempt($user)) {
            return response()->json(['error' => true, 'message' => 'Incorrect Login/Password'], 401);
        }
    }

    public function validation($request, $rules) {
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }
    }
}

?>