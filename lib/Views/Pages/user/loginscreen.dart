import 'package:cookbookapp/Views/Pages/Store/store_home_page.dart';
import 'package:cookbookapp/Views/common/color.dart';
import 'package:cookbookapp/Views/common/custominput.dart';
import 'package:cookbookapp/Views/Pages/user/detailitem.dart';
import 'package:cookbookapp/uitls/Helper.dart';
import 'package:flutter/material.dart';

import 'homescreen.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/loginscreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final id = TextEditingController();

  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),
        child: SafeArea(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          child: Column(
            children: [
              const Text(
                "Đăng nhập",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              const Spacer(),
              const SizedBox(
                height: 10,
              ),
              CustomTextInput(
                hintText: "Nhập email của bạn",
                idpass: id,
              ),
              const SizedBox(
                height: 20,
              ),
              const Spacer(),
              CustomTextInput(
                hintText: "Mật khẩu",
                idpass: pass,
              ),
              const Spacer(),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text("Đăng nhập"),
                  onPressed: () {
                    // Navigator.of(context)
                    //     .pushReplacementNamed(HomeScreen.routeName);
                    login();
                  },
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: const Text("Quên mật khẩu?",
                    style: TextStyle(color: AppColor.placeholder)),
              ),
              const Spacer(
                flex: 3,
              ),
              const Text('or', style: TextStyle(color: AppColor.placeholder)),
              const Spacer(),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF367FC0))),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/fb.png"),
                        const SizedBox(
                          width: 30,
                        ),
                        const Text("Đăng nhập với Facebook")
                      ],
                    )),
              ),
              const Spacer(),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFFDD4839))),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            // Helper.getAssetName('google.png', "virtual"),
                            "assets/images/google.png"),
                        const SizedBox(
                          width: 30,
                        ),
                        const Text("Đăng nhập với Google     ")
                      ],
                    )),
              ),
              const Spacer(
                flex: 4,
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Chưa có tài khoản?",
                      style: TextStyle(color: AppColor.primary),
                    ),
                    Text(
                      " Đăng ký",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  Future<void> login() async {
    if (id.text.isNotEmpty && pass.text.isNotEmpty) {
      var client = http.Client();
      var response = await client.post(Uri.parse("https://reqres.in/api/login"),
          body: ({
            "email": id.text,
            "password": pass.text,
          }));
      print(response.statusCode);
      print(id.text);
      print(pass.text);
      if (id.text.contains('user')) {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
        // Navigator.of(context)
        // .pushReplacementNamed(HomeScreen.routeName);
      } else if (id.text.contains('admin')) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StoreHomePage()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Blank value")));
      }
    }
    //https://www.youtube.com/watch?v=ui-TJ96rT4c
  }
}
