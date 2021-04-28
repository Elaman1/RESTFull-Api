<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Api\Controller;

use App\Models\User;
use App\Models\Record;

// Чтобы уменьшить повторяющийся функции создал класс RecordFilter 
use App\Classes\RecordFilter;
use Auth;

class RecordController extends Controller
{
    public function add(Request $request) {
        // Проверка на Авторизацию
        (new RecordFilter())->isAuth($request);


        // Валидация
        $rules = [
            'heading' => 'required|min:2|max:255',
            'text' => 'required|min:6'
        ];
        (new RecordFilter())->validation($request, $rules);

        // Создание
        $record = Record::create([
            'heading' => $request->heading,
            'text' => $request->text,
            'user_id' => Auth::id(),
        ]);


        // Отправка
        return response()->json([
            'heading' => $record->heading,
            'text' => $record->text,
            'created_at' => $record->created_at,
        ], 201);


    }

    public function view($id) {
        // Проверка на существование
        (new RecordFilter())->issetRecord($id);

        //Отправка
        $record = Record::find($id);
        $user = User::find($record->user_id);
        return response()->json([
            'heading' => $record->heading,
            'text' => $record->text,
            'created_at' => $record->created_at,
            'user' => $user->email,
        ], 200);
    }

    public function edit(Request $request, $id) {
        // Проверка на Авторизацию
        (new RecordFilter())->isAuth($request);

        // Валидация
        $rules = [
            'heading' => 'min:2|max:255',
            'text' => 'min:6'
        ];
        (new RecordFilter())->validation($request, $rules);

        // Существование
        (new RecordFilter())->issetRecord($id);
        if (is_null($request->heading) && is_null($request->text) {
            return response()->json("Do not change", 400);
        }
        
            

        // Отправка
        $record = Record::find($id);
        $record->update($request->all());
        $arr = [];

        if (!is_null($request->heading)) {
            $arr['heading'] = $request->heading;
        }

        if (!is_null($request->text)) {
            $arr['text'] = $request->text;
        }
        
        $arr['updated_at'] = $record->updated_at;
        return response()->json($arr, 201);
    }

    public function delete(Request $request, $id) {
        (new RecordFilter())->isAuth($request);

        (new RecordFilter())->issetRecord($id);

        $record = Record::find($id);
        $record->delete();

        return response()->json('Deleted', 204);
    }
}
