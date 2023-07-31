import 'package:block_2/bloc/create_cubit_state.dart';
import 'package:block_2/model/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget viewOfCreate(bool isLoading, BuildContext context, TextEditingController titleController,TextEditingController bodyController){
  return Container(
    padding: const EdgeInsets.all(30),
    child: Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: titleController,
            decoration: const InputDecoration(
              hintText: "Title",
              hintStyle: TextStyle(color: Colors.grey)
            ),
            ),
            TextField(
              controller: bodyController,
            decoration: const InputDecoration(
              hintText: "Body",
              hintStyle: TextStyle(color: Colors.grey)
            ),
            ),

            ElevatedButton(onPressed: (){
              final String title = titleController.text.toString().trim();
              final String body = bodyController.text.toString().trim();
              Post post = Post(title:  title,body: body,userId: 1);
              BlocProvider.of<CreatePostCubit>(context).apiPostCreate(post);
            }, child: Text("Create"))
          ],
        )
      ],
    ),
  );
}