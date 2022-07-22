import 'package:flutter/material.dart';
import '../user_data_list.dart';

class CommentDetails extends StatefulWidget {
  final int randomUserIndex;
  final List commentList;
  final Function addCommentToList;
  const CommentDetails(
      this.randomUserIndex, this.commentList, this.addCommentToList,
      {Key? key})
      : super(key: key);

  @override
  State<CommentDetails> createState() => _CommentDetailsState();
}

class _CommentDetailsState extends State<CommentDetails> {
  TextEditingController commentText = TextEditingController();
  Widget widgetTextField() {
    return TextField(
      controller: commentText,
      onSubmitted: (value) {
        widget.addCommentToList(value);

        commentText.clear();
      },
      autofocus: false,
      decoration: const InputDecoration(
        labelText: 'write a Comment',
      ),
    );
  }

  Widget userComment() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
            left: 10,
            right: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('vew previous comments',
                  style: Theme.of(context).textTheme.headline6),
              Text('most relevant',
                  style: Theme.of(context).textTheme.headline6),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              // fit: BoxFit.cover,
              backgroundImage: NetworkImage(
                userDataList[widget.randomUserIndex]["image"].toString(),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "${userDataList[widget.randomUserIndex]['first_name']}   ${userDataList[widget.randomUserIndex]['last_name']}",
                  style: Theme.of(context).textTheme.headline1,
                ),

                const SizedBox(
                  height: 20,
                ),
                Text(
                    '${widget.commentList.isNotEmpty ? widget.commentList.last : " "}'),
                //      'something'),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Like'),
                      Text('Reply'),
                      Text('3 d '),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 25,
            ),
            const Icon(Icons.more_vert),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Divider(
            color: Colors.grey,
          ),
          if (widget.commentList.isNotEmpty) userComment(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.account_box_rounded,
                size: 60,
              ),
              Container(
                  //  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: const Color.fromARGB(255, 168, 168, 168),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 200,
                        child: widgetTextField(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Icon(Icons.face),
                          Icon(Icons.camera_alt_outlined),
                          Icon(Icons.face_retouching_natural_outlined),
                          Icon(Icons.gif_box)
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
