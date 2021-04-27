<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePostsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('posts', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('subtitle');
            $table->string('description');
            $table->integer('likes');
            $table->integer('dislikes');
            $table->integer('hearts');
            $table->string('tags');
            $table->timestamps();
        });


         Schema::table('comments', function (Blueprint $table) {
            $table->foreignId('post_com_id')->constrained('posts');
         });

         Schema::table('reply_comments', function (Blueprint $table) {
            $table->foreignId('post_com_id')->constrained('posts');
         });

         Schema::table('uploads', function (Blueprint $table) {
            $table->foreignId('post_com_id')->constrained('posts');
         });

         Schema::table('actions', function (Blueprint $table) {
            $table->foreignId('post_com_id')->constrained('posts');
         });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('posts');
    }
}
