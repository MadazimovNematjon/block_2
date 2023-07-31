import 'package:block_2/bloc/list_post_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/post.dart';
import '../pages/create_page.dart';
import '../service/network.dart';

class ListPostCubit extends Cubit<ListPostState>{
  ListPostCubit() : super(ListPostInit());

  void apiPostList()async{
    // emit(ListPostLoaded());

    final response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      emit(ListPostLoaded(posts: Network.parsePostList(response)));
    } else {
      emit(ListPostError(error: "Couldn't fetch posts"));
    }
  }


  void apiPostDelete(Post post)async{
    emit(ListPostLoaded());
    final response = Network.DEL(Network.API_DELETE+post.id.toString(),Network.paramsEmpty());
    print(response);
    // ignore: unnecessary_null_comparison
    if(response != null){
      apiPostList();
    }else{
      emit(ListPostError(error: "Error"));
    }
  }
  void callCreatePage(BuildContext context)async{
    var result = await Navigator.push(context, MaterialPageRoute(builder: (context)=> const CreatePage()));
    if(result != null){
      BlocProvider.of<ListPostCubit>(context).apiPostList();

    }
  }
}