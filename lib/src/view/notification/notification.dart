import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../common/customCloseBtn/close_btn.dart';
import '../common/notificationCard/notification_card.dart';

class Notifications extends HookWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    final isCollapsed = useState(true);
    final collapsedString = useState<String>("..More");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: CustomCloseButton(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Notifications",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return NotificationCard(
                      isCollapsed: isCollapsed,
                      textBody: "asd",
                      avatarImage: "",
                      collapsedString: collapsedString,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
