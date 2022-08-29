<?php


use Illuminate\Support\Facades\Route;


Route::get('login', 'loginController@getLogin')->name('get.admin.login');
Route::post('login', 'loginController@login')->name('admin.login');
Route::get('logout','loginController@logout')->name('admin.logout');




Route::group(['middleware'=>'auth:admin'],function(){

Route::get('dashboard','loginController@dashboard')->name('admin.dashboard');
Route::get('changePassword','loginController@changePassword')->name('admin.changePassword');
Route::post('updatePassword','loginController@updatePassword')->name('admin.updatePassword');


############# Registration_request
Route::group(['prefix' =>'Registration_req'],function(){
    Route::get('/','RegistersController@index')->name('registers');
    Route::get('show/{register_id}','RegistersController@show')->name('register.show');
    Route::get('accept/{register_id}','RegistersController@acceptRegister')->name('register.accept');
    Route::get('delete/{register_id}','RegistersController@rejectRequest')->name('register.delete');
});


############ Student
Route::group(['prefix' =>'student'],function(){
    Route::get('/','StudentController@index')->name('students');
    Route::get('create','StudentController@create')->name('student.create');
    Route::post('store','StudentController@store')->name('student.store');
    Route::get('show/{student_id}','StudentController@show')->name('student.show');
    Route::get('edit/{student_id}','StudentController@edit')->name('student.edit');
    Route::post('update/{student_id}','StudentController@update')->name('student.update');
    Route::get('delete/{student_id}','StudentController@delete')->name('student.delete');
});

############# office register
Route::group(['prefix' =>'office_req'],function(){
    Route::get('/','officeRegisterController@index')->name('office.registers');
    Route::get('show/{register_id}','officeRegisterController@show')->name('office.register.show');
    Route::get('accept/{register_id}','officeRegisterController@accept')->name('office.register.accept');
    Route::get('delete/{register_id}','officeRegisterController@delete')->name('office.register.delete');
});



############ office
Route::group(['prefix' =>'office'],function(){
    Route::get('/','OfficeController@index')->name('offices');
    Route::get('create','OfficeController@create')->name('office.create');
    Route::post('store','OfficeController@store')->name('office.store');
    Route::get('show/{office_id}','OfficeController@show')->name('office.show');
    Route::get('edit/{office_id}','OfficeController@edit')->name('office.edit');
    Route::post('update/{office_id}','OfficeController@update')->name('office.update');
    Route::get('delete/{office_id}','OfficeController@delete')->name('office.delete');
});

############# donor register
Route::group(['prefix' =>'donor_reg'],function(){
    Route::get('/','DonorRegisterController@index')->name('donor.registers');
    Route::get('show/{donor_id}','DonorRegisterController@show')->name('donor.register.show');
    Route::get('accept/{donor_id}','DonorRegisterController@accept')->name('donor.register.accept');
    Route::get('delete/{donor_id}','DonorRegisterController@delete')->name('donor.register.delete');
});

############# donor 
Route::group(['prefix' =>'donor'],function(){
    Route::get('/','DonorController@index')->name('donors');
    Route::get('show/{donor_id}','DonorController@show')->name('donor.show');
    Route::get('create','DonorController@create')->name('donor.create');
    Route::post('store','DonorController@store')->name('donor.store');
    Route::get('edit/{donor_id}','DonorController@edit')->name('donor.edit');
    Route::post('update/{donor_id}','DonorController@update')->name('donor.update');
    Route::get('delete/{donor_id}','DonorController@delete')->name('donor.delete');
    Route::get('viewDonations/{donor_id}','DonorController@viewDonations')->name('donor.viewDonations');
    Route::get('total','DonorController@totalDonation')->name('donor.totalDonations');
    Route::get('requestDonation','DonorController@requestDonations')->name('donor.requestDonations');
    Route::get('accept/{id}','DonorController@accept')->name('donor.donation.accept');
    Route::get('reject/{id}','DonorController@reject')->name('donor.donation.reject');
});

############################# House
Route::group(['prefix' =>'house'],function(){
    Route::get('/','HouseController@index')->name('houses');
    Route::get('create','HouseController@create')->name('house.create');
    Route::post('store','HouseController@store')->name('house.store');
    Route::get('show/{house_id}','HouseController@show')->name('house.show');
    Route::get('edit/{house_id}','HouseController@edit')->name('house.edit');
    Route::post('update/{house_id}','HouseController@update')->name('house.update');
    Route::get('delete/{house_id}','HouseController@delete')->name('house.delete');
});

############################ Order Register
Route::group(['prefix' =>'houseOrder'],function(){
    Route::get('/','HouseOrderController@index')->name('order.index');
    Route::get('show/{house_id}','HouseOrderController@show')->name('order.show');
    Route::get('showStudents/{house_id}','HouseOrderController@showStudents')->name('order.showStudents');
    Route::get('showOffice/{office_id}','HouseOrderController@showOffice')->name('order.showOffice');
    Route::get('accept/{house_id}','HouseOrderController@acceptOrderHouse')->name('order.accept');
    Route::post('reject/{house_id}','HouseOrderController@rejectOrderHouse')->name('order.reject');

    Route::get('deleteOrderStudent/{student_id}','HouseOrderController@deleteOrderStudent')->name('order.deleteStudent');
});
});
route::get('test','RegistersController@test')->name('test');

route::get('chart','DonorController@chart');










