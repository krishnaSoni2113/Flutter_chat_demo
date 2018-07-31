import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';

double screenWidth = window.physicalSize.width / window.devicePixelRatio;
double screenHeight = window.physicalSize.height / window.devicePixelRatio;

//final double height = MediaQuery.of(context).size.height;

class ChatViewController extends StatefulWidget {
  @override
  ChatViewState createState() {
    return ChatViewState();
  }
}

class ChatViewState extends State<ChatViewController>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Container container = Container(
        height: screenHeight,
        width: screenWidth,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("Images/bg.png"))),
        child: chatListView()
        /*Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[



            new Padding(padding: EdgeInsets.all(0.0),

            child: Container(
              width: screenWidth,
              height: screenHeight,
              child: chatListView(),
            ),
            ),

//            messageTypingSection()

          ],
        )*/
        );

    return Scaffold(
        body: container,
        appBar: AppBar(
          title: new Text("Chat"),
          backgroundColor: Color.fromRGBO(90, 81, 164, 1.0),
        ));
  }

  TextFormField txtSend = TextFormField(
    textAlign: TextAlign.left,
    keyboardType: TextInputType.text,
    style: TextStyle(fontSize: 13.0, height: 1.0, color: Colors.white),
    decoration: InputDecoration(
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      hintText: "Password",
    ),
  );

  Widget messageTypingSection() {
    return Container(
      height: 60.0,
      width: screenWidth,
      color: Color.fromRGBO(90, 81, 164, 1.0),
      child: Row(
        children: <Widget>[
          new Container(
            width: screenWidth - 60,
            height: 60.0,
            child: new Padding(
              padding: EdgeInsets.only(
                  right: 10.0, top: 10.0, bottom: 10.0, left: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(81, 72, 150, 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    border: Border.all(
                      color: Color.fromRGBO(59, 45, 118, 1.0),
                    )),
                child: Row(
                  children: <Widget>[
//                  TextFormField(
//                    decoration: InputDecoration(
//                        labelText: 'Enter your message here...'
//                    ),
//                  ),
                  ],
                ),
              ),
            ),
          ),
          new GestureDetector(
            onTap: () {
              print("Send clk ====== ");
            },
            child: new Container(
              width: 60.0,
              height: 60.0,
              child: new Center(
                child: Text(
                  "Send",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget chatListView() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 10,
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            {
              return senderCell();
            }
            break;
          case 1:
            {
              return receiverCell();
            }
            break;

          case 2:
            {
              return senderImageCell();
            }
            break;

          case 3:
            {
              return receiverImageCell();
            }
            break;

          default:
            {
              return index % 2 == 0 ? receiverCell() : senderCell();
            }
            break;
        }
      },
    );
  }

  Widget receiverCell() {
    return Container(
        width: screenWidth,
        color: Colors.transparent,
        child: new Padding(
          padding: EdgeInsets.all(0.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(left: 20.0, top: 20.0),
                child: Container(
                  height: 50.0,
                  width: 35.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      border: Border.all(color: Colors.white, width: 3.0),
                      image: DecorationImage(
                          image: AssetImage("Images/1.jpg"), fit: BoxFit.fill)),
                ),
              ),
              new Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                  child: Container(
                    width: screenWidth - 75,
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Padding(
                            padding: EdgeInsets.only(left: 0.0, top: 10.0),
                            child: Text("Krishna Soni",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center)),
                        new Padding(
                            padding: EdgeInsets.only(
                                left: 0.0, top: 5.0, right: 10.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(90, 81, 164, 1.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    border: Border.all(
                                        color: Color.fromRGBO(55, 46, 122, 1.0),
                                        width: 3.0)),
                                child: new Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: new Text(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                      style: TextStyle(color: Colors.white)),
                                ))),
                        new Padding(
                            padding: EdgeInsets.only(
                                left: 0.0, top: 3.0, bottom: 10.0),
                            child: Text("11 min ago",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center))
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }

  Widget receiverImageCell() {
    return Container(
        width: screenWidth,
        color: Colors.transparent,
        child: new Padding(
          padding: EdgeInsets.all(0.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(left: 20.0, top: 20.0),
                child: Container(
                  height: 50.0,
                  width: 35.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      border: Border.all(color: Colors.white, width: 3.0),
                      image: DecorationImage(
                          image: AssetImage("Images/1.jpg"), fit: BoxFit.fill)),
                ),
              ),
              new Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                  child: Container(
                    width: screenWidth - 75,
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Padding(
                            padding: EdgeInsets.only(left: 0.0, top: 10.0),
                            child: Text("Krishna Soni",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center)),
                        new Padding(
                            padding: EdgeInsets.only(
                                left: 0.0, top: 5.0, right: 10.0),
                            child: Container(
                              height: 200.0,
                              width: 200.0,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(90, 81, 164, 1.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  border: Border.all(
                                      color: Color.fromRGBO(55, 46, 122, 1.0),
                                      width: 3.0),
                                  image: DecorationImage(
                                      image: AssetImage("Images/1.jpg"))),
                            )),
                        new Padding(
                            padding: EdgeInsets.only(
                                left: 0.0, top: 3.0, bottom: 10.0),
                            child: Text("11 min ago",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center))
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }

  Widget senderCell() {
    return Container(
//      height: 200.0,
        width: screenWidth,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(
                padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                child: Container(
                  width: screenWidth - 75,
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      new Padding(
                          padding: EdgeInsets.only(left: 0.0, top: 10.0),
                          child: Text("Krishna Soni",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center)),
                      new Padding(
                          padding:
                              EdgeInsets.only(left: 10.0, top: 5.0, right: 0.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(46, 179, 154, 1.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  border: Border.all(
                                      color: Color.fromRGBO(38, 156, 132, 1.0),
                                      width: 3.0)),
                              child: new Padding(
                                padding: EdgeInsets.all(10.0),
                                child: new Text(
                                    "Lorem Ipsum is simply dummy text ",
                                    style: TextStyle(color: Colors.white)),
                              ))),
                      new Padding(
                          padding: EdgeInsets.only(
                              right: 0.0, top: 3.0, bottom: 10.0),
                          child: Text("11 min ago",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center))
                    ],
                  ),
                )),
            new Padding(
              padding: EdgeInsets.only(right: 20.0, top: 20.0),
              child: Container(
                height: 50.0,
                width: 35.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    border: Border.all(color: Colors.white, width: 3.0),
                    image: DecorationImage(
                        image: AssetImage("Images/1.jpg"), fit: BoxFit.fill)),
              ),
            ),
          ],
        ));
  }

  Widget senderImageCell() {
    return Container(
//      height: 200.0,
        width: screenWidth,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(
                padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                child: Container(
                  width: screenWidth - 75,
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      new Padding(
                          padding: EdgeInsets.only(left: 0.0, top: 10.0),
                          child: Text("Krishna Soni",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center)),
                      new Padding(
                          padding:
                              EdgeInsets.only(left: 10.0, top: 5.0, right: 0.0),
                          child: Container(
                            height: 200.0,
                            width: 200.0,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(46, 179, 154, 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                border: Border.all(
                                    color: Color.fromRGBO(38, 156, 132, 1.0),
                                    width: 3.0),
                                image: DecorationImage(
                                    image: AssetImage("Images/2.jpg"))),
                          )),
                      new Padding(
                          padding: EdgeInsets.only(
                              right: 0.0, top: 3.0, bottom: 10.0),
                          child: Text("11 min ago",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center))
                    ],
                  ),
                )),
            new Padding(
              padding: EdgeInsets.only(right: 20.0, top: 20.0),
              child: Container(
                height: 50.0,
                width: 35.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    border: Border.all(color: Colors.white, width: 3.0),
                    image: DecorationImage(
                        image: AssetImage("Images/1.jpg"), fit: BoxFit.fill)),
              ),
            ),
          ],
        ));
  }
}
