<?php

namespace App\Http\Controllers;

use App\Class\ActionsUser;
use Illuminate\Http\Request;

class FavoriteAuthorController extends Controller
{
    //

    public function addFavorites(Request $request){
        $fav = new ActionsUser();
        return $fav->addFavAuthor($request);
    }

    public function getFavListAll($id){
        $fav = new ActionsUser();
        return $fav->getFavlist($id);
    }

}
