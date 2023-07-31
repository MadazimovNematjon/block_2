import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/list_post_cubit.dart';
import '../bloc/list_post_state.dart';
import '../model/post.dart';
import '../views/item_of_post_view.dart';

class HomePage extends StatefulWidget {
  static String get id => "home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
List<Post> items = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     BlocProvider.of<ListPostCubit>(context).apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocBuilder<ListPostCubit,ListPostState>(
        builder: (BuildContext context,ListPostState state){
          if(state is ListPostError){
            return viewOfHome(items,false);
          }

          if(state is ListPostLoaded){
             items = state.posts!;
            return viewOfHome(items,false);
          }
          return viewOfHome(items,true );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          BlocProvider.of<ListPostCubit>(context).callCreatePage(context);
        },
      ),
    );
  }


Widget viewOfHome(List<Post> items, bool isLoading) {
  List<Post> currentItems = List.of(items); // Create a copy of the list.

  return Stack(
    children: [
      ListView.builder(
        itemCount: currentItems.length, // Use the copied list's length.
        itemBuilder: (context, index) {
          Post post = currentItems[index]; // Use the copied list.
          return itemPost(context, post);
        },
      ),
      isLoading ? Center(child: CircularProgressIndicator()) : SizedBox.shrink(),
    ],
  );
}




}
