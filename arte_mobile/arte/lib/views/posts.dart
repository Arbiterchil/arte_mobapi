import 'package:arte/constants/color.dart';
import 'package:arte/controllers/postController.dart';
import 'package:arte/widgets/cards/cardsPost.dart';
import 'package:arte/widgets/cards/load.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class PostViews extends StatelessWidget {

    final PostController postController = Get.put(PostController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: decent_white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,top:15),
          child: Obx(() {
              if(postController.isLoad.value){
                return LoadData();
              }
              return ListView.builder(
                  itemCount: postController.posts.length,
                  itemBuilder: (context,index){
                    // final fin = postController.posts[index].uploadImages.length;
                    return CardPostPublic(
                      author: postController.posts[index].name,
                      email: postController.posts[index].email,
                      img: postController.posts[index].imageProfile,
                      subtitle: postController.posts[index].subtitle,
                      description: postController.posts[index].description,
                      // xample: Center(),
                      xample: Obx(() {
                        // for(int x= 0 ; x < fin ; x++){
                         if(postController.isLoad.value){
                                 return LoadData();
                                }
                        
                      // print( postController.posts[index].uploadImages[x].imageLink);
                      
                      
                        return Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: new StaggeredGridView.countBuilder(
                          crossAxisCount: 2,
                          itemCount:3,
                          itemBuilder: (cont , ind) =>new Container(
                              decoration: BoxDecoration(
                                color: darkish_color,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: new NetworkImage(
                                     postController.posts[index].uploadImages[ind].imageLink)
                                )
                              ),
                              
                              ), 
                          staggeredTileBuilder: (int index) =>
                          
                              new StaggeredTile.count(1, index.isEven ? 1 : 2),
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                          // new StaggeredTile.fit(2)
                          ),
                      );
                      //}
                      })
                    );
                  });

            }),
        ),
      ),
    );
  }
}