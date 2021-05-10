<?php

namespace App\Models;

use App\Models\Post;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Upload extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_authorId',
        'post_com_id',
        'image_link'
    ];

    // protected $with = ['uploads'];

    public function post(){
        return $this->belongsTo(Post::class,'post_com_id','id');
    }

}
