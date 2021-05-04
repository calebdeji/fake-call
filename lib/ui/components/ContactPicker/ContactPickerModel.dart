import 'package:contacts_service/contacts_service.dart';
import 'package:fakeCall/app/app.locator.dart';
import 'package:fakeCall/service/Contact/Contact.dart';
import 'package:fakeCall/ui/components/ContactsList/ContactsList.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ContactPickerModel extends FutureViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  ContactService _contactService = locator<ContactService>();

  @override
  Future futureToRun() async {
    if (_contactService.get() != null) {
      return _contactService.get();
    }

    var contactRequestStatus = await Permission.contacts.request().isGranted;
    if (contactRequestStatus) {
      var contacts = await ContactsService.getContacts();
      _contactService.set(contacts);
      return contacts;
    }
    return [];
  }

  void handleSelect(
      HandleSelectContact previousPageHandleSelect, String phone) {
    previousPageHandleSelect(phone.replaceAll(' ', ''));
    _navigationService.back();
  }
}
