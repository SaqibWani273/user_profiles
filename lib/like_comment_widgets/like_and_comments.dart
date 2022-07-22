import 'package:flutter/material.dart';
import '../user_data_list.dart';
import 'comment_section.dart';

class PresentUserDetails {
  int noOfLikes = 0;
  int noOfComments = 0;
  List<String> commentsList = [];
}

class LikeAndComment extends StatefulWidget {
  final int randomUserIndex;

  const LikeAndComment(this.randomUserIndex, {Key? key}) : super(key: key);

  @override
  State<LikeAndComment> createState() => _LikeAndCommentState();
}

class _LikeAndCommentState extends State<LikeAndComment> {
  PresentUserDetails user = PresentUserDetails();

  void addUserComment(cmnt) {
    setState(() {
      user.commentsList.add(cmnt);
    });
  }

  Widget likeAndCommentIcons() {
    return Column(
      children: [
        Container(
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
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
                    size: 25,
                  ),
                ),
                Wrap(
                  children: [
                    Text(
                      '  ${userDataList[widget.randomUserIndex]["first_name"].toString()} , ',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      " ${user.noOfLikes == 1 ? 'you' : ''} and others",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                )
              ],
            ),
            Text(
              '${user.commentsList.length} comments',
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
              InkWell(
                onTap: () {
                  setState(() {
                    user.noOfLikes = user.noOfLikes == 0 ? 1 : 0;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    user.noOfLikes == 1
                        ? const Icon(
                            Icons.thumb_up_alt_sharp,
                            color: Colors.blue,
                            size: 50,
                          )
                        : const Icon(
                            Icons.thumb_up_alt_outlined,
                            size: 40,
                          ),
                    const Text(
                      'Like',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(
                      Icons.comment_bank_outlined,
                      size: 40,
                    ),
                    Text(
                      'Comment',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        likeAndCommentIcons(),
        CommentDetails(
            widget.randomUserIndex, user.commentsList, addUserComment)
      ],
    );
  }
}
