<?php

/*
  |--------------------------------------------------------------------------
  | Application Routes
  |--------------------------------------------------------------------------
  |
  | Static Pages. Redirecting admin so admin cannot access these pages.
  |
 */

Route::group(['middleware' => ['redirectAdmin']], function() {
    Route::get('/', ['as' => 'home', 'uses' => 'PagesController@getHome']);
});

#Registration || Create a new user
Route::group(['middleware'=>'guest'],function(){
    Route::get('register','RegistrationController@create');
    Route::post('register',['as'=>'registration.store','uses'=>'RegistrationController@store']);
    
});
#Upload Image
Route::group(['middleware'=>['auth']],function(){
    Route::get('upload','UploadController@index');
    Route::post('upload','UploadController@upload');
    Route::get('profiles/{user_id}',['as'=>'profiles.show','uses'=>'ProfileController@show']);
    Route::post('profiles/update/{user_id}',['as'=>'profiles.update','uses'=>'ProfileController@update']);
});
#Authentication
Route::get('login',['as'=>'login','middleware'=>'guest','uses'=>'SessionsController@create']);
Route::get('logout',['as'=>'logout','uses'=>'SessionsController@destroy']);
Route::resource('sessions','SessionsController',['only'=>['create','store','destroy']]);

#Forgotten Password
Route::group(['middleware'=>['auth','guest']],function(){
    Route::get('forgot_password','Auth\PasswordController@getEmail');
    Route::post('forgot_password','Auth\PasswordController@postEmail');
    Route::get('reset_password/{token}','Auth\PasswordController@getReset');
    Route::post('reset_password/{token}','Auth\PasswordController@postReset');
});

#Standard User Routes
Route::group(['middleware'=>['auth','standardUser']],function(){
    Route::get('user',['as'=>'user_dashboard','uses'=>'StandardUser\StandardUserController@getHome']);
});

#Admin Routes
App::bind('App\Repositories\UserRepositoryInterface',  'App\Repositories\DbUserRepository');
Route::group(['middleware'=>['auth','admin']],function(){
    Route::get('admin',['as'=>'admin_dashboard','uses'=>'Admin\AdminController@getHome']);
    //Manage users
    Route::resource('admin/list_users','Admin\AdminUsersController',['only'=>['index']]);
    Route::post('create', ['as' => 'user.create', 'uses' => 'Admin\AdminUsersController@create']);
    Route::post('admin/list_users/user-update/{user_id}', 'Admin\AdminUsersController@update');
    Route::post('admin/list_users/user-delete/{user_id}', 'Admin\AdminUsersController@delete');
});