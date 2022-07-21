import 'package:flutter/material.dart';
import 'user_data_list.dart';

class LikeAndComment extends StatelessWidget {
  final int randomUserIndex;
  const LikeAndComment(this.randomUserIndex, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int noOfUserCommented = 0;
    int noOfUserLiked = 0;
    return Column(
      children: [
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.thumb_up_alt_rounded,
                    color: Colors.white,
                  ),
                ),
                const CircleAvatar(
                  backgroundColor: Colors.pink,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '  ${userDataList[randomUserIndex]["first_name"].toString()} , ',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      "and $noOfUserLiked others",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ],
            ),
            Text(
              '$noOfUserCommented comments',
              style: Theme.of(context).textTheme.headline6,
            ),
          ]),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Divider(
            color: Colors.grey,
          ),
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.thumb_up_alt_outlined,
                    size: 40,
                  ),
                  Text(
                    'Like',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.comment_bank_outlined,
                    size: 40,
                  ),
                  Text(
                    'Comment',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
