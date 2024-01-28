import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor/src/view/common/colors/colors.dart';

class BuildAppBarActions extends HookWidget {
  const BuildAppBarActions({
    Key? key,
    required this.searchController,
    required this.isSearching,
  }) : super(key: key);

  final TextEditingController searchController;
  final ValueNotifier<bool> isSearching;

  @override
  Widget build(BuildContext context) {
    /// Clears the search text field.
    void _clearSearch() {
      searchController.clear();
    }

    /// Stops the search and clears the search text field.
    void _stopSearching() {
      _clearSearch();
      isSearching.value = false;
    }

    /// Initiates the search and adds a local history entry for proper navigation.
    void _startSearch() {
      ModalRoute.of(context)!
          .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
      isSearching.value = true;
    }

    return IconButton(
      onPressed: () {
        if (isSearching.value) {
          _clearSearch();
          context.pop();
        } else {
          _startSearch();
        }
      },
      icon: Icon(
        isSearching.value ? Icons.clear : Icons.search,
        color: WasphaColors.blackColor,
      ),
    );
  }
}
