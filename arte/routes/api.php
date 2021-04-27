<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

//All Starts in Here.
Route::group([
    'middleware' => 'api',
    'namespace' => 'App\Http\Controllers',
    'prefix' => 'arte'
],function($router){
    Route::post('signIn','UserController@login');
    // Params
    // email
    // password
    Route::post('signUp','UserController@register');
    // Params
    // name
    // email
    // password
    // image_profile
    // category_id
    Route::post('signOut','UserController@logout');
    // Token from login
    Route::post('refresh','UserController@refresh');
    // refresh token for another 4 days
    Route::get('profile','UserController@profile');
    // Get user using token from log in
});

//Separate API for Author
Route::group([
    'middleware' => 'api',
    'namespace' => 'App\Http\Controllers',
    'prefix' => 'author'
],function($routeAuthor){
    Route::post('post','PostController@createPostingPublic');
    Route::post('edit','PostController@editPost');
    Route::get('uploads/{id}','UploadController@getUploadImagesbyIdAuthor');
    Route::delete('posts/{id}','PostController@deletePost');
    Route::get('trial/{id}','PostController@triad');
});

//Separate Api for Viewer or User
Route::group([
    'middleware' => 'api',
    'namespace' => 'App\Http\Controllers',
    'prefix' => 'viewer'
],function($routeAuthor){
    Route::get('postview','PostController@getPostAndComments');
    Route::get('viewimage/{id}','PostController@getUploadImageById');
    Route::get('getComments/{id}','PostController@getCommentPostById');
    Route::get('getreply/{id}','CommentsController@getReply');
    Route::get('getPost/{id}','PostController@getAllPostData');
    Route::get('search','ActionsController@search');
    Route::get('getfav/{id}','FavoriteAuthorController@getFavListAll');
    Route::post('comment','PostController@CommenttoPostPublic');
    Route::post('reply','CommentsController@replyCommentEd');
    Route::post('addfavorite','FavoriteAuthorController@addFavorites');
});


//I Separate the action for api for like, dislike and heart/love
Route::group([
    'middleware' => 'api',
    'namespace' => 'App\Http\Controllers',
    'prefix' => 'action'
],function($routeAuthor){
    Route::post('actions','ActionsController@longComplexity');
    Route::post('edit','CommentsController@editComment');
    Route::post('replyedit','CommentsController@editReply');
});





