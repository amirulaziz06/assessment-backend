<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

// Route::get('/user', 'UserController@index')->name('user.index');
// Route::get('/user/edit/{id}', 'UserController@edit')->name('user.edit');
// Route::put('/user/update/{id}', 'UserController@update')->name('user.update');
// Route::delete('/user/delete/{id}', 'UserController@delete')->name('user.destroy');

Route::resource('/user', 'UserController');