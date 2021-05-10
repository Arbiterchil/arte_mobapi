<?php

namespace App\Models;

use App\Models\User;
use App\Models\Upload;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Post extends Model
{
    use HasFactory;
        protected $fillable = [
        'user_author_id',
        'title',
        'subtitile',
        'description',
        'likes',
        'dislikes',
        'hearts',
        'tags'
    ];

    // protected $with = ['uploads'];

    public function uploadImages(){
        return $this->hasMany(Upload::class,'post_com_id','id');
    }



}
