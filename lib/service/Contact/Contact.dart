import 'package:contacts_service/contacts_service.dart';

class ContactService {
  Iterable<Contact> _contacts;

  void set(Iterable<Contact> contactList) {
    _contacts = contactList;
  }

  Iterable<Contact> get() {
    return _contacts;
  }
}
