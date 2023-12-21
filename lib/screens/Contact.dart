import 'package:flutter/material.dart';

class ContactPerson extends StatefulWidget {
  const ContactPerson({super.key});

  @override
  State<ContactPerson> createState() => _ContactPersonState();
}

class _ContactPersonState extends State<ContactPerson> {

  // create contact variable list and assign value to this list
  final List<Contact> _contacts = [
    Contact(
        name: "ថាវរិទ្ធស្មោះស្នេហ៍",
        email: "thavrith@gmail.com",
        photoUrl: "https://i0.wp.com/www.skabash.com/wp-content/uploads/2023/03/243045742_840977113240881_1727903750979743405_n.jpg?resize=940%2C1175&ssl=1"
    ),
    Contact(
        name: "បង លៀង ប្រុសខូច",
        email: "leang@gmail.com",
        photoUrl: "https://thumbs.dreamstime.com/b/close-up-portrait-handsome-man-black-background-attractive-120200195.jpg"
    ),
    Contact(
        name: "បង ធំ",
        email: "bongthom@gmail.com",
        photoUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7K3EMT-0o-gd-BLTNSu-TIU4v1Zl5p33Z8w&usqp=CAU"
    ),
    Contact(
        name: "វីឡាចាយសម្រស់",
        email: "vila@gmail.com",
        photoUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTt5Q75eHWcTkdM0yV4zThXvOJntnu1eoT8Mw&usqp=CAU"
    ),
    Contact(
        name: "បង វីរ៉ា",
        email: "bongvira@gmail.com",
        photoUrl: "https://i.pinimg.com/736x/45/93/f1/4593f1254aff1b80ee0eeb9e718e536d.jpg"
    )
  ];

  final List<Contact> _selectedContacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:  true,
        title: const Text(
          "Contacts Person",
          style:  TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "KantumruyProBold",
            fontSize: 25.0
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "To",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                fontFamily: "KantumruyProBold"
              ),
            ),
          ),
          Wrap(
            spacing: 8.0,
            children: _selectedContacts.map(
                (contact) => InputChip(
                  label: Text(
                    contact.name,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontFamily: "KantumruyProLigh"
                    ),
                  ),
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(contact.photoUrl),
                  ),
                  onDeleted: () {
                    setState(() {
                      _selectedContacts.remove(contact);
                    });
                  },
                )
            ).toList(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount:  _contacts.length,
              itemBuilder: (context, index) {
                final contact = _contacts[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 40.0,
                    backgroundImage: NetworkImage(contact.photoUrl),
                  ),
                  title: Text(
                    contact.name,
                    style: const TextStyle(
                      fontFamily: "KantumruyProLigh",
                      fontSize: 25.0
                    ),
                  ),
                  subtitle: Text(
                    contact.email,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontFamily: "KantumruyProLigh"
                    ),
                  ),
                  trailing: _selectedContacts.contains(contact)
                      ? const Icon(Icons.check_circle_outline)
                      : null,
                  onTap: () {
                    setState(() {
                      if (_selectedContacts.contains(contact)) {
                        _selectedContacts.remove(contact);
                      } else {
                        _selectedContacts.add(contact);
                      }
                    });
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

// create class contact
class Contact {
  final String name;
  final String email;
  final String photoUrl;

  Contact({required this.name, required this.email, required this.photoUrl});
}
