import 'package:flutter/material.dart';

import 'contact.dart';
import 'package:bubble/bubble.dart';

TextStyle chatText = TextStyle(fontSize: 18);

class Chat extends StatefulWidget {
  final Contact contact;
  Chat({this.contact});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    double px = 1 / pixelRatio;

    BubbleStyle styleSomebody = BubbleStyle(
      nip: BubbleNip.leftTop,
      color: Colors.white,
      elevation: 1 * px,
      padding: BubbleEdges.only(top: 15, bottom: 15, left: 10, right: 10),
      margin: BubbleEdges.only(top: 8.0, right: 50.0, left: 15),
      alignment: Alignment.topLeft,
    );

    return Scaffold(
      // color: Colors.amber,
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            CircleAvatar(
              child: Image.asset(widget.contact.profile),
            ),
            SizedBox(width: 15,),
            Text(widget.contact.title)
          ],
        ),
      ),
      body: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit.cover)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Bubble(
                  style: styleSomebody,
                  child: Text(widget.contact.subtitle, style: chatText),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  padding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          IconButton(
                            iconSize: 20,
                            icon: Icon(Icons.insert_emoticon),
                            onPressed: () {},
                          ),
                          Container(
                            width: 160,
                            child: TextField(
                              // controller: _controller,
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 20),
                                  border: InputBorder.none,
                                  hintText: "Type something..."),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.photo_camera),
                            onPressed: () {},
                          ),
                          // IconButton(
                          //   icon: Transform.rotate(
                          //     angle: 45,
                          //     child: Icon(Icons.attach_file),
                          //   ),
                          //   onPressed: () {},
                          // )
                          Transform.rotate(
                              angle: 45,
                              child: IconButton(
                                icon: Icon(Icons.attach_file),
                                onPressed: () {},
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, right: 6),
                  child: FloatingActionButton(
                    backgroundColor: Color(0xFF4CAF50),
                    child: Icon(Icons.mic),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ],
        )
      ]),
    );
  }
}
