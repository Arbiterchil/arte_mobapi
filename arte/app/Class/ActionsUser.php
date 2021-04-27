<?php

namespace App\Class;

use Carbon\Carbon;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ActionsUser
{

    public function longComplexProcess( Request $request)
    {
        $postId = $request->input('post_com_id');
        $categId = $request->input('category_actionId');
        $userId  = $request->input('user_Id');

        $findifexist = DB::table('actions')
        ->where('post_com_id',$postId)
        ->where('user_Id',$userId)->first();


        if($findifexist){

            DB::table('actions')
            ->where('post_com_id',$postId)
            ->where('user_Id',$userId)
            ->delete();

            if($categId == 1){
                $postlike = Post::find($postId);
                $postlike->likes = DB::raw('likes-1');
                $postlike->save();
            }
            if($categId == 2){
                $postlike = Post::find($postId);
                $postlike->dislikes = DB::raw('dislikes-1');
                $postlike->save();
            }
            if($categId == 3){
                $postlike = Post::find($postId);
                $postlike->hearts = DB::raw('hearts-1');
                $postlike->save();
            }

            return response()->json(
                [
                    'Action' => 'Undone',
                    'status' => 'Success',
                ],201
            );

        }else{

            $tableAction = DB::table('actions')->insert(
                [
                    'action'               => 1,
                    'post_com_id'          => $postId,
                    'category_actionId'    => $categId,
                    'user_Id'              => $userId,
                    'created_at'           => Carbon::now(),
                    'updated_at'           => Carbon::now(),
                ]
            );

            if($categId == 1){
                $postlike = Post::find($postId);
                $postlike->likes = DB::raw('likes+1');
                $postlike->save();
            }
            if($categId == 2){
                $postlike = Post::find($postId);
                $postlike->dislikes = DB::raw('dislikes+1');
                $postlike->save();
            }
            if($categId == 3){
                $postlike = Post::find($postId);
                $postlike->hearts = DB::raw('hearts+1');
                $postlike->save();
            }

            return response()->json(
                [
                    'Action' => 'Send',
                    'status' => 'Success'
                ],201
            );

        }



    }


    public function addFavAuthor(Request $request){

        $userAuthorID = $request->input('user_author_id');
        $userViewerID = $request->input('user_viewer_id');


        $ifAlreaadyExits = DB::table('favorite_authors')
        ->where('user_author_id',$userAuthorID)
        ->where('user_viewer_id',$userViewerID)
        ->first();

        if($ifAlreaadyExits){

            return response()->json([
                "message" => "Already Added to Favorites"
            ]);


        }

        $crate = DB::table('favorite_authors')
        ->insert(
            [
                'user_author_id' => $userAuthorID,
                'user_viewer_id' => $userViewerID
            ]
        );

        return  response()->json([
            "message" => "Success Add Favorite Author"
        ],201,);



    }

    public function getFavlist($id){
        $get_view = DB::table('favorite_authors')
        ->join('users','users.id','=','favorite_authors.user_author_id')
        ->select('users.name')
        ->where('user_viewer_id',$id)
        ->first();

        return response()->json($get_view);
    }

    public function searchwithpage(Request $request){

        $term = $request->input("s");
        $Postpublic = Post::where('tags','LIKE','%'.$term.'%')
        ->orWhere('title','LIKE','%'.$term.'%')
        ->orWhere('description','LIKE','%'.$term.'%')
        ->orderByDesc('created_at','desc')
        ->paginate(10);

        return response()->json($Postpublic);
        //Custom Pagination

        // $queryString = Post::query();

        // if($s = $request->input('s')){
        //     $queryString->orderByDesc('created_at','desc')
        //     ->whereRaw("tags LIKE '%" .$s. "%'")
        //     ->orWhereRaw("title LIKE '%" .$s. "%'");
        // }
        // $perpages = 10;
        // $page = $request->input('page',1);

        // $total = $queryString->count();

        // $result = $queryString->offset(($page - 1) * $perpages)
        // ->limit($perpages)->get();

        // return response()->json([
        //     "result" => $result,
        //     "total"  => $total,
        //     "page"   => $page,
        //     "last_page" => ceil($total / $perpages)
        // ]);

    }


}
