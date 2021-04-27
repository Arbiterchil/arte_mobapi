<?php

namespace App\Http\Controllers;

use App\Class\CreatePost;
use Illuminate\Http\Request;

class UploadController extends Controller
{
    //
    public function getUploadImagesbyIdAuthor($id){
        $uploadAuthorId = new CreatePost();
        return $uploadAuthorId->getuploadImagesAuthor($id);
    }
}
