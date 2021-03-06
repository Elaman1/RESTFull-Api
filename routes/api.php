<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('register', 'Api\LoginController@register');
Route::post('login', 'Api\LoginController@login');

Route::post('add-record', 'Api\RecordController@add');
Route::post('edit-record/{id}', 'Api\RecordController@edit');
Route::post('delete-record/{id}', 'Api\RecordController@delete');

Route::get('record/{id}', 'Api\RecordController@view');
