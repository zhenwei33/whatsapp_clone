import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_clone/slideTransition.dart';

import 'chat.dart';
import 'contact.dart';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList>
    with AutomaticKeepAliveClientMixin<ContactList> {
  
  var contacts = const [];

  var images = const [
    'assets/images/boy-1.png',
    'assets/images/boy.png',
    'assets/images/girl-1.png',
    'assets/images/girl.png',
    'assets/images/man-1.png',
    'assets/images/man-2.png',
    'assets/images/man-3.png',
    'assets/images/man-4.png',
    'assets/images/man.png'
  ];

  Future _loadContactsJSON() async {
    String content = await rootBundle.loadString('assets/json/sample.json');
    List collection = json.decode(content);
    List<Contact> _contacts =
        collection.map((json) => Contact.fromJson(json)).toList();
    for (var i=0; i<_contacts.length; i++) {
      _contacts[i].setProfile(images[getRandomNumber(images.length)]);
    }
    setState(() {
      contacts = _contacts;
    });
    // print(contacts[0].title);
  }

  getRandomNumber(var max) {
    var rng = new Random();
    return rng.nextInt(max);
  }

  Widget unreadMessage(var max) {
    if (max == 0) {
      max = max + 1;
    }
    return CircleAvatar(
      radius: 10,
      backgroundColor: Color(0xFF4CAF50),
      child: Text(max.toString()),
    );
  }

  void initState() {
    _loadContactsJSON();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        Contact contact = contacts[index];
        return ListTile(
            enabled: true,
            onTap: () {
              Navigator.push(
                  context, SlideRightRoute(page: Chat(contact: contact,)));
            },
            contentPadding: EdgeInsets.all(15),
            leading: CircleAvatar(
              radius: 30,
              child: Image.asset(contact.profile),
            ),
            title: Text(
              contact.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: Text(
              contact.subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("30m"),
                getRandomNumber(5) > 0
                    ? unreadMessage(getRandomNumber(15))
                    : Container(
                        height: 12,
                        width: 12,
                      )
              ],
            ));
      },
    );
  }
  @override
  bool get wantKeepAlive => true;
}
