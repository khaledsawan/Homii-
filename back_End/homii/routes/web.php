<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});


Auth::routes();

Route::get('/', 'Admin\loginController@getLogin')->name('home');

Route::view('/site', 'front.home');

route::get('test','Admin\RegistersController@test');