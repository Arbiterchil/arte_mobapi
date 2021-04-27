<?php

namespace App\Class;

use Carbon\Carbon;
use App\Models\Post;
use App\Models\Upload;
use App\Models\Comments;
use Illuminate\Http\Request;
use App\Models\ReplyComments;
use App\Models\CategoryAction;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class CreatePost
{


    public function createpost(Request $request){
        $userAuthor     = $request->input('user_author_id');
        $titleAuthor    = $request->input('title');
        $subtitleAuthor = $request->input('subtitle');
        $desceiptionAuthor = $request->input('description');
        $tagAuthor      = $request->input('tags');
        $uploadAuthor   = $request->input('uploads');

        $uploads = new Post();
        $uploads->user_author_id = $userAuthor;
        $uploads->title = $titleAuthor;
        $uploads->subtitle = $subtitleAuthor;
        $uploads->description = $desceiptionAuthor;
        $uploads->likes = 0;
        $uploads->dislikes = 0;
        $uploads->hearts = 0;
        $uploads->tags = $tagAuthor;

        $uploads->save();

        $postUploadId = $uploads->id;

        for($i = 0; $i < count($uploadAuthor) ;$i++){
            $uploadtoDb = DB::table('uploads')
            ->insert([
                [
                    'post_com_id' => $postUploadId,
                    'user_authorId' => $userAuthor,
                    'image_link'    => $uploadAuthor[$i]['image_link'],
                    'created_at'  => Carbon::now(),
                    'updated_at'  => Carbon::now(),
                ]
            ]);
        }

        return response()->json(
            [
                'message' => 'Post Send on Pulbic',
                'id' => $postUploadId
            ]
        );

    }

    public function CommentOnPost(Request $request){
        $commentuser = $request->input('comment');
        $user_comId =  $request->input('user_comId');
        $categoryId =  $request->input('category_actionId');
        $postId     =  $request->input('post_com_id');

        $categoryAction = CategoryAction::where('id',$categoryId)->get();

        $comments = Comments::create(
            [
            'comment' => $commentuser,
            'user_comId' => $user_comId,
            'category_actionId' => $categoryId,
            'post_com_id' => $postId
            ]
        );



        return response()->json([
            'message' => 'comment sent',
            'status'  => 'success',

        ],201);

    }

    public function PostCommentsUploads($id)
    {
        $post = DB::table('posts')->where('id',$id)->get();
        $upload = DB::table('uploads')->where('post_com_id',$id)->get();
        $comment = DB::table('comments')
        ->join('users','users.id','=','comments.user_comId')
        ->join('category_actions' , 'category_actions.id', '=','comments.category_actionId')
        ->select('comments.id',
                 'users.name',
                 'category_actions.name as action',
                 'comment')
        ->where('post_com_id',$id)
        ->get();

        return response()->json([
            'Post'      => $post,
            'Upload'    => $upload,
            'Comments'  => $comment
        ],201);
    }


    public function getPost(){
        $post = Post::orderByDesc('created_at','desc')->get();
        return response()->json($post);
    }

    public function getUploadbyId($id){
        $uploadImage = Upload::where('post_com_id',$id)->get();
        return response()->json($uploadImage);
    }

    public function getCommentbyIdPost($id){
        $commentary = Comments::where('post_com_id',$id)->get();
        $com = DB::table('comments')
        ->join('users','users.id','=','comments.user_comId')
        ->join('category_actions' , 'category_actions.id', '=','comments.category_actionId')
        ->select('comments.id',
                 'users.name',
                 'category_actions.name as action',
                 'comment')
        ->where('post_com_id',$id)
        ->get();



        return response()->json($com);
    }

    public function getCommentReply($id){
        $reply = DB::table('reply_comments')
        ->join('users','users.id','=','reply_comments.user_comId')
        ->join('comments','comments.id','=','reply_comments.comment_id')
        ->select( 'comments.id as comment_id',
                  'reply_comments.id',
                  'users.name',
                  'reply_comments.comment')
        ->where('comment_id',$id)
        ->get();

        return response()->json($reply);
    }

    public function CommentinsideAsReply(Request $request){
        $commentReply = $request->input('comment_id');
        $userx = $request->input('user_comId');
        $commentsR = $request->input('comment');
        $post_com_id = $request->input('post_com_id');
        $create = ReplyComments::create([
            'comment_id' => $commentReply,
            'user_comId' => $userx,
            'comment' => $commentsR
        ]);

        return response()->json([
            "Status" => "Sucess",
            "data" =>$create],201);

    }

    public function getuploadImagesAuthor($id){

        $getuploadsAuthor = Upload::where('user_authorId',$id)->get();

        return response()->json([
            "message" => "Images",
            "Uploads" => $getuploadsAuthor
        ]);

    }

    public function editCommentAuthorViewer(Request $request){
        $idUser = $request->input('comment_id');
        $commendUser = $request->input('user_comId');
        $idCommnet = $request->input('comment');

        $rawId = Comments::where('id',$idUser)->where('user_comId',$commendUser)->get();

        if($rawId){
            $commentUpdate = Comments::find($idUser);
            $commentUpdate->comment = $idCommnet;
            $commentUpdate->save();

            return response()->json(
                [
                    "message" => "Edit Done.",
                    "info"    => $commentUpdate
                ],201
            );
        }

        return response()->json(
            [
                "meesage" => "unauthorized"
            ],402);

    }

    public function editReplyComment(Request $request){

        $repcomment_id = $request->input('id');
        $commentId = $request->input('comment_id');
        $commentReply = $request->input('user_comId');
        $commentDir = $request->input('comment');

        $updateReply = ReplyComments::where('id',$repcomment_id)
        ->where('comment_id',$commentId)
        ->where('user_comId',  $commentReply)
        ->get();

        if($updateReply){
            $replys = ReplyComments::find($repcomment_id);
            $replys->comment = $commentDir;
            $replys->save();

            return response()->json([
                "message" => "Edit Done",
                "Edited" => $replys
            ],201);
        }

        return response()->json(["message" => "unauthorized"] ,402);


    }

    public function editPostAuthor(Request $request){

        $postIdAuthorPost = $request->input('post_Id');
        $postEditTitle = $request->input('title');
        $postEditSubtitle = $request->input('subtitle');
        $postEditDesctiption = $request->input('description');

        $updatePost = Post::find($postIdAuthorPost);
        $updatePost->title = $postEditTitle;
        $updatePost->subtitle = $postEditSubtitle;
        $updatePost->description = $postEditDesctiption;
        $updatePost->save();

        return response()->json(
            [
                'meesage' => 'Edit Done.',
                'status' => 'Success',
                'Post' => $updatePost
            ],201
        );
    }


    public function deletePostAllconnected($id){
        $deleteUpload = Upload::where('post_com_id',$id)->delete();
        $deleteCommment = Comments::where('post_com_id',$id)->delete();
        $deletePost = Post::where('id',$id)->delete();
        $deketeReplys = ReplyComments::where('post_com_id',$id)->delete();

        return response()->json([
            "message" => "all the post related is deleted."
        ],201);
    }

    public function trial($id){
        $model = DB::table('comments')
        ->where('post_com_id',$id)
        ->select('id')
        ->get();



        // if($model){

        //     $replycom  = ReplyComments::where('comment_id',$model)->get();

        //     return response($replycom);
        // }


    }

}
