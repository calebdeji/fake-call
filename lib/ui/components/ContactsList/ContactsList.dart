import 'package:fakeCall/constants/colors.dart';
import 'package:fakeCall/ui/components/Heading/Heading.dart';
import 'package:fakeCall/ui/components/Paragraph/Paragraph.dart';
import 'package:fakeCall/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

typedef HandleSelectContact(String value);

class ContactsList extends StatelessWidget {
  ContactsList(
      {@required this.contacts, @required this.handleSelect, this.value});

  final Iterable<Contact> contacts;
  final HandleSelectContact handleSelect;
  final String value;

  @override
  Widget build(BuildContext context) {
    return contacts.isEmpty
        ? Container(
            child: Paragraph(
              text: 'contact not found',
              color: red100,
            ),
            alignment: Alignment.topCenter,
          )
        : ListView(
            children: List.of(contacts).map((contact) {
              return ContactItem(
                contact: contact,
                handleSelectContact: handleSelect,
              );
            }).toList(),
          );
  }
}

class ContactItem extends StatelessWidget {
  ContactItem({this.contact, this.handleSelectContact});

  final Contact contact;
  final HandleSelectContact handleSelectContact;

  @override
  Widget build(BuildContext context) {
    final List phoneNumbers = contact.phones.toList();
    final phoneNumber = phoneNumbers.length > 0 ? phoneNumbers[0].value : null;
    return phoneNumber == null
        ? SizedBox()
        : GestureDetector(
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              title: Paragraph(
                text: contact.displayName,
              ),
              subtitle: Paragraph(
                text: phoneNumber,
              ),
              leading: CircleAvatar(
                foregroundColor: white100,
                backgroundColor:
                    generateRandomColorBasedOnString(contact.displayName),
                child: (contact.avatar == null || contact.avatar.isEmpty)
                    ? Heading(
                        text: getNamePrefixs(contact.displayName),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: MemoryImage(contact.avatar),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(100)),
                      ),
              ),
            ),
            onTap: () {
              handleSelectContact(phoneNumber);
            },
          );
  }
}
