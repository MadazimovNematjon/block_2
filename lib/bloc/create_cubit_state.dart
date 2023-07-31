import 'package:block_2/bloc/create_state.dart';
import 'package:block_2/model/post.dart';
import 'package:block_2/service/network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePostCubit extends Cubit<CreateState>{
  CreatePostCubit() : super(CreateInit());
  
  void apiPostCreate(Post post)async{
    emit(CreateLoading()); 
    final response = await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
    if(response != null){
      emit(CreateLoaded(isCreated: true));
    }else{
      emit(CreateError(error: "cloud not created post"));
    }
  }
}