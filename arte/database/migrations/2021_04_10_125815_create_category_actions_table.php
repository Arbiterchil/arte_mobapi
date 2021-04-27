<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCategoryActionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('category_actions', function (Blueprint $table) {
            $table->id();
            $table->string('name');
        });


         Schema::table('comments', function (Blueprint $table) {
            $table->foreignId('category_actionId')->constrained('category_actions');
         });

         Schema::table('actions', function (Blueprint $table) {
            $table->foreignId('category_actionId')->constrained('category_actions');
         });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('category_actions');
    }
}
