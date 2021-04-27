<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('email')->unique();
            $table->string('password');
            $table->string('image_profile');
            $table->timestamps();
        });

         Schema::table('uploads', function (Blueprint $table) {
            $table->foreignId('user_authorId')->constrained('users');
         });

        Schema::table('posts', function (Blueprint $table) {
            $table->foreignId('user_author_id')->constrained('users');
         });

         Schema::table('comments', function (Blueprint $table) {
            $table->foreignId('user_comId')->constrained('users');
         });

         Schema::table('reply_comments', function (Blueprint $table) {
            $table->foreignId('user_comId')->constrained('users');
         });

         Schema::table('actions', function (Blueprint $table) {
            $table->foreignId('user_Id')->constrained('users');
         });

         Schema::table('notifications', function (Blueprint $table) {
            $table->foreignId('user_Id')->constrained('users');
         });


         //Favorite Authors

         Schema::table('favorite_authors', function (Blueprint $table) {
            $table->foreignId('user_author_id')->constrained('users');
         });

         Schema::table('favorite_authors', function (Blueprint $table) {
            $table->foreignId('user_viewer_id')->constrained('users');
         });


    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
