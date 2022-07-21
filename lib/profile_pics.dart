import 'package:flutter/material.dart';
import 'user_data_list.dart';

class MainUserImages extends StatelessWidget {
  final int index;
  final String userBackgroundImage;
  const MainUserImages(this.index, this.userBackgroundImage, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 500,
          alignment: Alignment.topCenter,
          child: Container(
            width: double.infinity,
            height: 300,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.network(
                userBackgroundImage,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            margin: const EdgeInsets.all(25),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(360),
              ),
              // border: Border.all(
              //   width: 5,
              //   color: Colors.green,
              // ),
            ),
            width: double.infinity,
            child: CircleAvatar(
              radius: 360.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(360.0),
                child: SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child:
                        Image.network(userDataList[index]["image"].toString()),
                  ),
                ),
              ),
            ),
            // child: FittedBox(
            //   fit: BoxFit.fill,
            //   child: Image.network(
            //     userDataList[index]["image"].toString(),
            //   ),
            // ),
          ),
        ),
      ],
    );
  }
}
