import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard(
      {super.key,
      required this.isCollapsed,
      required this.collapsedString,
      required this.textBody,
      required this.avatarImage});

  final ValueNotifier<bool> isCollapsed;
  final ValueNotifier<String> collapsedString;
  final String avatarImage, textBody;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {},
        background: Container(
          color: Colors.red,
        ),
        child: Container(
          width: 348,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: Text("5 min ago"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            CachedNetworkImageProvider(avatarImage),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ReadMoreText(
                          textBody,
                          trimLines: 2,
                          colorClickableText: Colors.pink,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Show more',
                          trimExpandedText: 'Show less',
                          lessStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          moreStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // Expanded(
                      //   child: ReadMoreText(
                      //     'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                      //     trimLines: 2,
                      //     callback: (value) {
                      //       isCollapsed.value = value;
                      //     },
                      //     colorClickableText: Colors.pink,
                      //     trimMode: TrimMode.Line,
                      //     trimCollapsedText: 'Show more',
                      //     trimExpandedText: 'Show less',
                      //     lessStyle: TextStyle(
                      //         fontSize: 14, fontWeight: FontWeight.bold),
                      //     moreStyle: TextStyle(
                      //         fontSize: 14, fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
