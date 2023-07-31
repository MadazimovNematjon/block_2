import 'package:block_2/bloc/create_cubit_state.dart';
import 'package:block_2/bloc/create_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../views/create_of_view.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Page"),
      ),
      body: BlocProvider(
        create: (context) => CreatePostCubit(),
        child: BlocBuilder<CreatePostCubit, CreateState>(
            builder: (BuildContext context,CreateState state){
              if(state is CreateLoading){
                return viewOfCreate(true,context,titleController,bodyController);
              }

              if(state is CreateLoaded){
                finish(context);
              }
              if(state is CreateError){

              }
              return viewOfCreate(true,context,titleController,bodyController);
            }
        ),
      ),
    );
  }
  void finish(BuildContext context) {
    Navigator.pop(context, "result");
  }

}
