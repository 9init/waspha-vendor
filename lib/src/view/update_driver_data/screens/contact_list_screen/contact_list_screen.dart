import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/view/update_driver_data/providers/get_driver_contact_data_provider/get_driver_contact_data_provider.dart';
import 'package:vendor/src/view/update_driver_data/screens/contact_list_screen/widgets/index.dart';

class ContactListScreen extends HookWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = useTextEditingController();
    final ValueNotifier<bool> isSearching = useState(false);
    final ValueNotifier<List<Contact>> _contacts = useState([]);
    final ValueNotifier<bool> _permissionDenied = useState(false);
    final ValueNotifier<List<Contact>> searchedContact = useState([]);

    Future _fetchContacts() async {
      if (!await FlutterContacts.requestPermission(readonly: true)) {
        _permissionDenied.value = true;
      } else {
        final contacts = await FlutterContacts.getContacts(
          withProperties: true,
          withPhoto: true,
          withGroups: true,
          withAccounts: true,
        );
        _contacts.value = contacts;
      }
    }

    useEffect(() {
      _fetchContacts();
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          BuildAppBarActions(
            searchController: searchController,
            isSearching: isSearching,
          ),
        ],
        leading: isSearching.value ? Container() : BackButton(),
        title: isSearching.value
            ? BuildContactListAppBar(
                contactList: _contacts.value,
                searchController: searchController,
                searchedContact: searchedContact,
              )
            : Text(
                context.localization.choose_contact,
                style: Theme.of(context).textTheme.titleSmall,
              ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          return ListView.builder(
            itemCount: isSearching.value
                ? searchedContact.value.length
                : _contacts.value.length,
            itemBuilder: (context, index) {
              return FutureBuilder(
                future: FlutterContacts.getContact(isSearching.value
                    ? searchedContact.value[index].id
                    : _contacts.value[index].id),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    var userMobileNumber=ref.read(getDriverContactDataProvider.notifier);
                    return ListTile(
                      onTap: () {
                        userMobileNumber.setDriverContact(snapShot.data!.displayName, snapShot.data!.phones.first.number);
                        context.pop();
                      },
                      title: Text(snapShot.data!.displayName),
                      subtitle: Text(
                          '${snapShot.data!.phones.isNotEmpty ? snapShot.data!.phones.first.number : '(none)'}'),
                      leading: const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                    );
                  } else {
                    Text(context.localization.permission_denied);
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
