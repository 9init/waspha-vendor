import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../home/presentation/home.dart';

final pageIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class Navigation extends ConsumerWidget {
  Navigation({super.key});
  final List<Widget> _pages = [const HomeScreen()];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int currentIndex = ref.watch(pageIndexProvider);
    return Scaffold(
        body: PageView(
          children: _pages,
          onPageChanged: (index) {
            ref.read(pageIndexProvider.notifier).update((state) => index);
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            ref.read(pageIndexProvider.notifier).update((state) => index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
          ],
        ));
  }
}
