import 'package:flutter/material.dart';
import 'dart:math';
import 'like_comment_widgets/like_and_comments.dart';
import 'Image_Widgets/profile_pics.dart';
import 'Image_Widgets/top_widget.dart';
import 'user_data_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          headline3: TextStyle(
            //    color: Colors.black87,
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
          headline6: TextStyle(
            //  color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Random User Profiles '),
          ),
        ),
        body: Container(
          color: const Color.fromRGBO(0, 0, 0, 0.1),
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListView.builder(
            itemCount: userDataList.length,
            itemBuilder: (context, int index) {
              int randomUserIndex = Random().nextInt(29);
              String bgImage = "https://picsum.photos/200/300?random=$index";

              return Card(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      TopListTileWidget(index),
                      MainUserImages(randomUserIndex, bgImage),
                      const Divider(
                        color: Colors.grey,
                      ),
                      LikeAndComment(
                        randomUserIndex,
                      ),
                    ],
                    // userDataList[index]
                    //     .entries
                    //     .map((e) => Text('something'))
                    //     .toList()),
                  ));
            },
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
