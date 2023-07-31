import 'package:block_2/bloc/create_state.dart';
import 'package:block_2/bloc/update_post.dart';
import 'package:block_2/model/post.dart';
import 'package:block_2/service/network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateCubit extends Cubit<UpdatePostState>{
  UpdateCubit() : super(UpdatePostInit());

  void apiUpdate(Post post)async{
    emit(UpdatePostLoading());
    final response = await Network.PUT(Network.API_CREATE+post.id.toString(), Network.paramsCreate(post));
    if(response != null){
      emit(UpdatePostLoaded(isCreated: true));
    }else{
      emit(UpdatePostError(error: "cloud not created post"));
    }
  }
}