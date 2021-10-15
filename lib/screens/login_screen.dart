import 'package:cookbookapp/Views/Pages/Store/store_home_page.dart';

import '/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
//        // Login Back Button Section
          // Container(
          //     margin: EdgeInsets.only(left: 30.0, top: 50.0),
          //     child: GestureDetector(
          //       onTap: () {
          //         Navigator.of(context).pop();
          //       },
          //       child: Icon(
          //         Icons.keyboard_backspace,
          //         color: Color(0xffc5ccd6),
          //         size: 30.0,
          //       ),
          //     )),

          // Login Text Section
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 30.0),
            child: Text(
              "Đăng nhập",
              style: TextStyle(fontSize: 30.0),
            ),
          ),

          // Email Edit text
          Container(
            margin: EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Tài khoản",
                  border: OutlineInputBorder()),
              minLines: 1,
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
            ),
          ),

          // Password Edit text
          Container(
            margin: EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Mật khẩu", // Set text upper animation
                border: OutlineInputBorder(),
              ),
              minLines: 1,
              autofocus: false,
              keyboardType: TextInputType.text,
              obscureText: true, // Hiding words
            ),
          ),

          // Login Button
          Center(
              child: Container(
                  margin: EdgeInsets.only(top: 50.0),
                  child: RaisedButton(
                    onPressed: () {
                      // Route route = MaterialPageRoute(builder: (context) => HomeScreen());
                      // Navigator.push(context, route);
                      Navigator.of(context)
                          .pushReplacementNamed(StoreHomePage.routerName);
                    }, // When Click on Button goto Login Screen

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: const EdgeInsets.all(0.0),
                    child: Ink(
                      // decoration: BoxDecoration(
                      //     gradient: LinearGradient(
                      //         colors: [
                      //            Color(0xff374ABE),
                      //            Color(0xff64B6FF)
                      //         ],
                      //         begin: Alignment.centerLeft,
                      //         end: Alignment.centerRight),
                      //     borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Container(
                        constraints: const BoxConstraints(
                            maxWidth: 300.0,
                            minHeight: 40.0), // min sizes for Material buttons
                        alignment: Alignment.center,
                        child: const Text(
                          'Đăng nhập',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ))),

          // Center(
          //     child: Container(
          //         margin: EdgeInsets.only(top: 50.0),
          //         child: RaisedButton(
          //           onPressed: () {
          //             // Route route = MaterialPageRoute(builder: (context) => HomeScreen());

          //             // Navigator.push(context, route);
          //           }, // When Click on Button goto Login Screen

          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(80.0)),
          //           padding: const EdgeInsets.all(0.0),
          //           child: Ink(
          //             decoration: const BoxDecoration(
          //               color: Colors.red,
          //               borderRadius: BorderRadius.all(Radius.circular(5)),
          //             ),
          //             child: Container(
          //                 constraints: const BoxConstraints(
          //                     maxWidth: 300.0,
          //                     minHeight:
          //                         40.0), // min sizes for Material buttons
          //                 alignment: Alignment.center,
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     Image.asset(
          //                       "assets/images/google.png",
          //                       fit: BoxFit.cover,
          //                     ),
          //                     const Text(
          //                       ' Đăng nhập bằng Google',
          //                       textAlign: TextAlign.center,
          //                       style: TextStyle(color: Colors.white),
          //                     ),
          //                   ],
          //                 )),
          //           ),
          //         ))),

          // Center(
          //     child: Container(
          //         padding: EdgeInsets.only(bottom: 30.0),
          //         margin: EdgeInsets.only(top: 20.0),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: <Widget>[
          //             Text("Chưa có tài khoản ? "),
          //             GestureDetector(
          //               child: Text(
          //                 "  Đăng ký",
          //                 style: TextStyle(
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //               onTap: () {
          //                 Navigator.of(context).push(MaterialPageRoute(
          //                     builder: (context) => SignUpScreen()));
          //               },
          //             )
          //           ],
          //         )))
        ],
      )),
    );
  }
}
