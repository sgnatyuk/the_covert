<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCommentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('comments', function (Blueprint $table) {

            $table->bigIncrements('id');
            $table->unsignedBigInteger('thread_id')->index();
            $table->unsignedBigInteger('parent_comment_id')->nullable()->index();
            $table->string('author_name');
            $table->text('text');
            $table->string('path');
            $table->timestamps();

            $table->foreign('thread_id')
                ->references('id')
                ->on('threads')
                ->onDelete('cascade');

            $table->foreign('parent_comment_id')
                ->references('id')
                ->on('comments')
                ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('comments');
    }
}
