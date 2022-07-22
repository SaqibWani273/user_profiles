import 'package:flutter/material.dart';
import '../user_data_list.dart';

class TopListTileWidget extends StatelessWidget {
  final int index;
  const TopListTileWidget(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          userDataList[index]["image"].toString(),
        ),
      ),
      title: Row(
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
      subtitle: Text(
          '${userDataList[index]["date"]} at ${userDataList[index]["time"]}'),
      trailing: const Icon(Icons.more_vert),
    );
  }
}
