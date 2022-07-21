import 'package:flutter/material.dart';
import 'top_widget.dart';
import 'user_data_list.dart';

class UserProfileWidget extends StatelessWidget {
  final BuildContext contxt;
  DateTime userUploadDate = DateTime.now();
  UserProfileWidget(this.contxt, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
        itemCount: userDataList.length,
        itemBuilder: (context, int index) {
          //  DateTime userUploadDate = DateTime.parse(userDataList[index]["date"].toString(),).

          return Card(
              child: Column(
            children: [
              TopListTileWidget(index),
            ],
            // userDataList[index]
            //     .entries
            //     .map((e) => Text('something'))
            //     .toList()),
          ));
        },
      ),
    );
  }
}
