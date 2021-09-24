import 'package:flutter/material.dart';
import 'package:flutter_task/Screens/dashboard.dart';
import 'package:flutter_task/services/postLogin.dart';
import 'package:http/http.dart' as http;
import '../validation/formValidator.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  @override
//! Variable
  // ignore: override_on_non_overriding_member
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  // FormValidator _fValidator;

  loginApi loginapi;

  String _email;
  String _password;
  bool visible;

  @override
  void initState() {
    super.initState();
    visible = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _submit() {
    final form = formKey.currentState;
    print("Login");

    if (form.validate()) {
      form.save();

      login();
    }
  }

  void login() {
    loginAutthnticate(_email, _password);
  }

  //! post api form

  Future loginAutthnticate(String eml, String pwd) async {
    Uri postURL =
        Uri.parse("http://test.topblogwriter.com/doster/api/user_login.php");
    loginApi logoinResponse;

    final response = await http.post(postURL, headers: {
      'Accept': 'form-data',
    }, body: {
      'email': eml,
      'password': pwd,
      'fcm_id': "qwerty"
    });

    logoinResponse = loginApiFromJson(response.body);

    if (response.statusCode == 200 && logoinResponse.success == 1) {
      // print(response.body.length);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Dashboard()));
    } else {
      if (logoinResponse.success == 0) {
        scaffoldKey.currentState
            .showSnackBar(SnackBar(content: Text("Login details not found")));
        // Fluttertoast.showToast(
        //     msg: "Login details not found",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.black.withOpacity(0.8),
        //     textColor: Colors.white);

        // ShowToast("Login details not found");

      }
    }
  }

  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;

    return Scaffold(
      key: scaffoldKey,
      // backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: screenHeight - 30,
            width: screenWidth,
            child: Stack(children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 25),
                    child: Container(
                      height: screenHeight / 18.35,
                      width: screenWidth / 8.47,
                      // alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(235, 235, 235, 1),
                        // color: Colors.amber,
                        borderRadius:
                            BorderRadius.circular(screenHeight / 36.7),
                        // image: DecorationImage(
                        //     image: AssetImage("assets/icons/BackArrow.png"))
                      ),
                      child: Image.asset(
                        "assets/icons/BackArrow.png",

                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      "Welcome Back",
                      style: new TextStyle(
                        fontFamily: "Asap",
                        color: Color.fromRGBO(55, 55, 55, 1),
                        fontWeight: FontWeight.w600,
                        fontSize: screenHeight / 25,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      "Enter your credentials to continue",
                      style: new TextStyle(
                        fontFamily: "Asap",
                        color: Color.fromRGBO(220, 220, 220, 1),
                        fontWeight: FontWeight.w600,
                        fontSize: screenHeight / 50,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 120,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Form(
                        key: formKey,
                        // autovalidateMode: AutovalidateMode.always,
                        child: Column(
                          // mainAxisSize: MainAxisSize.max
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              color: Colors.transparent,
                              // height: 60,
                              // height: screenHeight / 05.48,
                              // color: Colors.cyan,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Username / Phone Number",
                                    style: new TextStyle(
                                      fontFamily: "Asap",
                                      color: Color.fromRGBO(220, 220, 220, 1),
                                      fontWeight: FontWeight.w600,
                                      fontSize: screenHeight / 50,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "assets/icons/username.png",
                                        color: Color.fromRGBO(120, 120, 120, 1),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        // flex: 1,
                                        child: TextFormField(
                                          style: new TextStyle(
                                            fontFamily: "Asap",
                                            color:
                                                Color.fromRGBO(55, 55, 55, 1),
                                            fontWeight: FontWeight.w600,
                                            fontSize: screenHeight / 40,
                                          ),
                                          cursorColor:
                                              Color.fromRGBO(220, 220, 220, 1),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none),
                                          validator: (value) =>
                                              // value.contains("@gmail.com")
                                              //     ? null
                                              //     : "invalid mail"

                                              value.isEmpty
                                                  ? "Username  can not be empty"
                                                  : (value.contains(
                                                          "@gmail.com"))
                                                      ? null
                                                      : "invalid mail",
                                          onSaved: (val) => _email = val,
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    // margin: EdgeInsets.only(top: ),
                                    height: 1,
                                    color: Color.fromRGBO(220, 220, 220, 1),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              // height: screenHeight / 05.48,
                              // color: Colors.cyan,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Password",
                                    style: new TextStyle(
                                      fontFamily: "Asap",
                                      color: Color.fromRGBO(220, 220, 220, 1),
                                      fontWeight: FontWeight.w600,
                                      fontSize: screenHeight / 50,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.asset(
                                        "assets/icons/password.png",
                                        color: Color.fromRGBO(120, 120, 120, 1),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        // flex: ,
                                        child: TextFormField(
                                          style: new TextStyle(
                                            fontFamily: "Asap",
                                            color:
                                                Color.fromRGBO(55, 55, 55, 1),
                                            fontWeight: FontWeight.w600,
                                            fontSize: screenHeight / 40,
                                          ),
                                          cursorColor:
                                              Color.fromRGBO(220, 220, 220, 1),
                                          obscureText: !visible,
                                          keyboardType: TextInputType.number,
                                          // maxLength: 8,
                                          decoration: InputDecoration(
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none),
                                          validator: (value) => value.isEmpty
                                              ? "Password  can not be empty"
                                              : (value.length == 6)
                                                  ? null
                                                  : "password must be 6 characters",

                                          onSaved: (val) => _password = val,
                                        ),
                                      ),
                                      InkWell(
                                        child: Image.asset(
                                          "assets/icons/show password.png",
                                          color: Color.fromRGBO(50, 50, 50, 1),
                                        ),
                                        onTap: () {
                                          print("Show Password");
                                          setState(() {
                                            print("Subrat");
                                            visible = !visible;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  Container(
                                    // margin: EdgeInsets.only(top: ),
                                    height: 1,
                                    color: Color.fromRGBO(220, 220, 220, 1),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Remember me next time",
                                  style: new TextStyle(
                                    fontFamily: "Asap",
                                    color: Color.fromRGBO(174, 174, 174, 1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: screenHeight / 50,
                                  ),
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Image.asset(
                                  "assets/icons/show password.png",
                                  color: Color.fromRGBO(50, 50, 50, 1),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              height: screenHeight / 15.29,
                              width: screenWidth,
                              child: ElevatedButton(
                                child: Text(
                                  "LOGIN",
                                  style: new TextStyle(
                                    fontFamily: "Asap",
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: screenHeight / 40,
                                  ),
                                ),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromRGBO(196, 9, 1, 1)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)))),
                                onPressed: _submit,
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
              Positioned(
                bottom: 30,
                left: 25,
                right: 25,
                child: Container(
                  height: screenHeight / 15.29,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(220, 220, 220, 1),
                    ),
                    borderRadius: BorderRadius.circular(30),
                    // color: Colors.amber,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: new TextStyle(
                          fontFamily: "Asap",
                          color: Color.fromRGBO(220, 220, 220, 1),
                          fontWeight: FontWeight.w600,
                          fontSize: screenHeight / 50,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "SIGNUP",
                          style: new TextStyle(
                            fontFamily: "Asap",
                            color: Color.fromRGBO(196, 9, 1, 1),
                            fontWeight: FontWeight.w600,
                            fontSize: screenHeight / 50,
                          ),
                        ),
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent)),
                      )
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
