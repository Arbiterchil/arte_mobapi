<?php

namespace App\Http\Controllers;

use App\Class\CreatePost;
use Illuminate\Http\Request;


class PostController extends Controller
{

    public function createPostingPublic(Request $request){
        $postcreate = new CreatePost();
        return $postcreate->createpost($request);
    }

    public function getPostAndComments(){
        $getpostcreate = new CreatePost();
        return $getpostcreate->getPost();
    }

    public function getUploadImageById($id){
        $getUpload = new CreatePost();
        return $getUpload->getUploadbyId($id);
    }

    public function getCommentPostById($id){
        $getUpload = new CreatePost();
        return $getUpload->getCommentbyIdPost($id);
    }

    public function CommenttoPostPublic(Request $request){
        $comment = new CreatePost();
        return $comment->CommentOnPost($request);
    }

    public function getAllPostData($id){
        $getAll = new CreatePost();
        return $getAll->PostCommentsUploads($id);
    }

    public function editPost(Request $request){
        $edit = new CreatePost();
        return $edit->editPostAuthor($request);
    }


    public function deletePost($id){
        $delete = new CreatePost();
        return $delete->deletePostAllconnected($id);
    }

    public function triad($id){
        $trial = new CreatePost();
        return $trial->trial($id);
    }

}
