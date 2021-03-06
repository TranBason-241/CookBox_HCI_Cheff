import '/screens/account_screen.dart';
import '/screens/home_screen.dart';
import '/screens/notify_screen.dart';
import '/screens/order/order.dart';
import '/screens/order_screen.dart';
import 'package:flutter/material.dart';

class CustomNavbar extends StatelessWidget {
  // bool home;
  // bool order = false;
  // bool notify = false;
  // bool account = false;
  // bool home;
  // bool order = false;
  // bool notify = false;
  // bool account = false;

  // CustomNavbar(
  //     {this.home = false,
  //     this.order = false,
  //     this.notify = false,
  //     this.account = false});

  final bool home;
  final bool order;
  final bool notify;
  final bool account;

  CustomNavbar(
      {this.home = false,
      this.order = false,
      this.notify = false,
      this.account = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: MediaQuery.of(context).size.width,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 65,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          // color: Color(0xFFF2F2F2),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  if (!home) {
                    Navigator.of(context)
                        .pushReplacementNamed(HomeScreen.routeName);
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    home
                        ? const Icon(
                            Icons.home,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.home,
                            color: Color(0xFFB6B7B7),
                          ),
                    home
                        ? const Text(
                            'Trang ch???',
                            style: TextStyle(
                              // color: Colors.red,
                              color: Colors.black,
                            ),
                          )
                        : const Text(
                            'Trang ch???',
                            style: TextStyle(
                              color: Color(0xFFB6B7B7),
                            ),
                          )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (!order) {
                    Navigator.of(context)
                        // .pushReplacementNamed(OrderScreen.routeName);
                        .pushReplacementNamed(Order.routeName);
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(Icons.local_mall_outlined),
                    // Text('????n h??ng'),
                    order
                        ? const Icon(
                            Icons.local_mall_outlined,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.local_mall_outlined,
                            color: Color(0xFFB6B7B7),
                          ),
                    order
                        ? const Text(
                            '????n h??ng',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          )
                        : const Text(
                            '????n h??ng',
                            style: TextStyle(
                              color: Color(0xFFB6B7B7),
                            ),
                          ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(NotifyScreen.routeName);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(Icons.circle_notifications_rounded),
                    // Text('Th??ng b??o'),
                    notify
                        ? const Icon(
                            Icons.circle_notifications_rounded,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.circle_notifications_rounded,
                            color: Color(0xFFB6B7B7),
                          ),
                    notify
                        ? const Text(
                            'Th??ng b??o',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          )
                        : const Text(
                            'Th??ng b??o',
                            style: TextStyle(
                              color: Color(0xFFB6B7B7),
                            ),
                          ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(AccountScreen.routeName);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(Icons.perm_identity_outlined),
                    // Text('T??i kho???n'),
                    account
                        ? const Icon(
                            Icons.perm_identity_outlined,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.perm_identity_outlined,
                            color: Color(0xFFB6B7B7),
                          ),
                    account
                        ? const Text(
                            'T??i kho???n',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          )
                        : const Text(
                            'T??i kho???n',
                            style: TextStyle(
                              color: Color(0xFFB6B7B7),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
