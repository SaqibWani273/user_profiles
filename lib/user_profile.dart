import 'package:flutter/material.dart';
import 'dart:math';
import 'like_and_comments.dart';
import 'top_widget.dart';
import 'user_data_list.dart';
import 'profile_pics.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
        itemCount: userDataList.length,
        itemBuilder: (context, int index) {
          int randomUserIndex = Random().nextInt(29);
          String bgImage =
              "https://source.unsplash.com/random/1500×2500/?${randomWords[index]}";

          return Card(
              margin: const EdgeInsets.symmetric(vertical: 15),
              elevation: 5,
              shadowColor: Colors.lime,
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('vew previous comments',
                                style: Theme.of(context).textTheme.headline6),
                            Text('most relevant',
                                style: Theme.of(context).textTheme.headline6),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              // fit: BoxFit.cover,
                              backgroundImage: NetworkImage(
                                userDataList[randomUserIndex]["image"]
                                    .toString(),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text('Saqib Wani'),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text('Awesome'),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Text('Like'),
                                    Text('Reply'),
                                    Text('3 d '),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Icon(Icons.more_vert),
                          ],
                        ),
                      ],
                    ),
                  ),
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
