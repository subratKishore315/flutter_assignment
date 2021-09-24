import 'package:flutter/material.dart';
import 'package:flutter_task/customewidget/menuItem.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
          child: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(196, 9, 1, 1),
                    borderRadius: BorderRadius.circular(140),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 1))
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Image.asset(
                          "assets/icons/menuNew.png",
                          color: Colors.white,
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Home",
                            style: new TextStyle(
                              fontFamily: "Asap",
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontWeight: FontWeight.w600,
                              fontSize: screenHeight / 40,
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, right: 5),
                          child: Container(
                            width: 50,
                            // height: 40,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                shape: BoxShape.circle),
                            child: Image.asset(
                              "assets/icons/username.png",
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                child: Image.asset("assets/icons/homeBanner@2x.png"),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
              child: GridView(
                // physics: ScrollPhysics(),

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    crossAxisCount: 2),
                children: [
                  CustomeMenu(
                    img: Image.asset("assets/icons/callNew.png"),
                    color: Color.fromRGBO(218, 222, 224, 1),
                    title: "Call",
                  ),
                  CustomeMenu(
                    img: Image.asset("assets/icons/chat.png"),
                    color: Color.fromRGBO(211, 234, 253, 1),
                    title: "Chat",
                  ),
                  CustomeMenu(
                    img: Image.asset("assets/icons/topup.png"),
                    color: Color.fromRGBO(250, 220, 231, 1),
                    title: "Mobile Topup",
                  ),
                  CustomeMenu(
                    img: Image.asset("assets/icons/wallet.png"),
                    color: Color.fromRGBO(255, 242, 216, 1),
                    title: "Wallet",
                  ),
                  CustomeMenu(
                    img: Image.asset("assets/icons/call rates.png"),
                    color: Color.fromRGBO(253, 241, 218, 1),
                    title: "Call Rates",
                  ),
                  CustomeMenu(
                    img: Image.asset("assets/icons/SUPPORTNew.png"),
                    color: Color.fromRGBO(222, 237, 248, 1),
                    title: "Help",
                  )
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}
