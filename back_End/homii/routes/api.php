<?php

use GuzzleHttp\Middleware;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use function PHPSTORM_META\map;

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


Route::group(['namespace' => 'User'], function () {
    Route::post('login', 'LoginController@login')->name('login');
    Route::get('logout', 'LoginController@logout')->name('logout');
    Route::post('register', 'registerController@register');
});

Route::group(['namespace' => 'Office','prefix'=>'office'], function () {

    Route::post('Register', 'RegisterController@register');

    Route::group(['middleware' => 'role:office,office','prefix'=>'house'], function () {
            Route::get('index','HousesController@index');
            Route::post('store','HousesController@store');
            Route::get('show/{house_id}','HousesController@show');
            Route::put('update/{house_id}','HousesController@update');
            Route::get('delete/{house_id}','HousesController@destroy');
    });
});

Route::group(['namespace' => 'Donor','prefix'=>'donor'], function () {

    Route::post('Register', 'RegisterController@register');

    Route::group(['middleware' => 'role:donor,donor'], function () {
            Route::post('donation','profileController@donation');
            Route::get('show','profileController@show');
            Route::put('update','profileController@updateProfile');
            Route::get('myDonation','profileController@myDonation');
            // Route::get('delete/{house_id}','HousesController@destroy');
    });
});

Route::group(['prefix'=>'student','namespace'=>'User','middleware'=>'role:student,student'],function(){
    Route::post('addPoints','LoginController@addPoints');

    Route::group(['prefix'=>'house'],function(){
        Route::get('index','HouseRentController@index');
        Route::get('show/{house_id}','HouseRentController@show');
        Route::post('rentHouse/{house_id}','HouseRentController@rentHouse');
        Route::get('cancelRent/{house_id}','HouseRentController@cancelRent');
        Route::get('test/{house_id}','HouseRentController@test');
    });
});

