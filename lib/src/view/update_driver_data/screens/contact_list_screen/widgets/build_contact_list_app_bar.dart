import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/view/common/custom_form/index.dart';

class BuildContactListAppBar extends HookWidget {
  const BuildContactListAppBar({
    Key? key,
    required this.contactList,
    required this.searchController,
    required this.searchedContact,
  }) : super(key: key);

  final List<Contact> contactList;
  final TextEditingController searchController;
  final ValueNotifier<List<Contact>> searchedContact;

  @override
  Widget build(BuildContext context) {
    /// Updates the list of searched contacts based on the entered search character.
    void addSearchedCharacterToList(String searchedCharacter) {
      searchedContact.value = contactList
          .where((contact) => contact.displayName
          .toLowerCase()
          .startsWith(searchedCharacter.toLowerCase()))
          .toList();
      debugPrint(
          'The Data Get From Search Contact Is ${searchedContact.value}');
    }

    return CustomTextFromFieldForSearch(
      textEditingController: searchController,
      onChanged: (String? searchedContact) {
        addSearchedCharacterToList(searchedContact ?? '');
      },
      hintText: context.localization.search_contacts,
    );
  }
}

