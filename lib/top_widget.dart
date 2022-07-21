import 'package:flutter/material.dart';
import 'user_data_list.dart';

class TopListTileWidget extends StatelessWidget {
  int index;
  TopListTileWidget(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        child: CircleAvatar(
          // fit: BoxFit.cover,
          backgroundImage: NetworkImage(
            userDataList[index]["image"].toString(),
          ),
        ),
      ),
      subtitle: Row(children: [
        Text(
            '${userDataList[index]["date"]} at ${userDataList[index]["time"]}'),
      ]),
      title: Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${userDataList[index]["first_name"]} ${userDataList[index]["last_name"]} ',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: Text(
              'updated his profile picture',
              //  overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ],
      ),
      trailing: Icon(Icons.more_vert),
    );
  }
}
