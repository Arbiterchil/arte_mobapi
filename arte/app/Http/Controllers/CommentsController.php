<?php

namespace App\Http\Controllers;

use App\Class\CreatePost;
use Illuminate\Http\Request;

class CommentsController extends Controller
{
    //
    public function replyCommentEd(Request $request){
        $reply = new CreatePost();
        return $reply->CommentinsideAsReply($request);
    }

    public function getReply($id){
        $reply = new CreatePost();
        return $reply->getCommentReply($id);
    }

    public function editComment(Request $request){
        $editreply = new CreatePost();
        return $editreply->editCommentAuthorViewer($request);
    }

    public function editReply(Request $request){
        $editreplycomment = new CreatePost();
        return $editreplycomment->editReplyComment($request);
    }

}
