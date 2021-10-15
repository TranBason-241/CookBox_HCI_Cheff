import '/providers/orders.dart' show Orders;
import '/widgets/custom_navbar.dart';
import '/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);
  static const routeName = '/orders';

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  // int currentTab = 1;
  // final List<Widget> screens = [
  //   HomeScreen(),
  //   OrderScreen(),
  // ];
  final PageStorageBucket bucket = PageStorageBucket();
  // Widget currentScreen = OrderScreen();
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Orders'),
        ),
        body: Stack(
          children: [
            SafeArea(
              child: ListView.builder(
                itemCount: orderData.orders.length,
                itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                child: CustomNavbar(
                  order: true,
                )),
          ],
        )
        // bottomNavigationBar: BottomAppBar(
        //   child: Container(
        //     height: 60,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         Row(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             MaterialButton(
        //               minWidth: 40,
        //               onPressed: () {
        //                 setState(() {
        //                   currentScreen = const HomeScreen();
        //                   currentTab = 0;
        //                 });
        //                 Navigator.pushReplacementNamed(
        //                     context, HomeScreen.routeName);
        //               },
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   Icon(
        //                     Icons.water_damage_sharp,
        //                     color: currentTab == 0 ? Colors.red : Colors.grey,
        //                   ),
        //                   Text(
        //                     'Trang chủ',
        //                     style: TextStyle(
        //                       color: currentTab == 0 ? Colors.black : Colors.grey,
        //                     ),
        //                   )
        //                 ],
        //               ),
        //             ),
        //             MaterialButton(
        //               minWidth: 40,
        //               onPressed: () {
        //                 setState(() {
        //                   currentScreen = const OrderScreen();
        //                   currentTab = 1;
        //                 });
        //                 // Navigator.pushNamed(context, OrderScreen.routeName);
        //               },
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   Icon(
        //                     Icons.local_mall_outlined,
        //                     color: currentTab == 1 ? Colors.red : Colors.grey,
        //                   ),
        //                   Text(
        //                     'Đơn hàng',
        //                     style: TextStyle(
        //                       color: currentTab == 1 ? Colors.black : Colors.grey,
        //                     ),
        //                   )
        //                 ],
        //               ),
        //             ),
        //             MaterialButton(
        //               minWidth: 40,
        //               onPressed: () {
        //                 setState(() {
        //                   // currentScreen = const Profile();
        //                   // currentTab = 2;
        //                 });
        //               },
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: const [
        //                   Icon(
        //                     Icons.circle_notifications_rounded,
        //                     // color: currentTab == 2 ? Colors.red : Colors.grey,
        //                   ),
        //                   Text(
        //                     'Thông báo',
        //                     style: TextStyle(
        //                         // color: currentTab == 2 ? Colors.black : Colors.grey,
        //                         ),
        //                   )
        //                 ],
        //               ),
        //             ),
        //             MaterialButton(
        //               minWidth: 40,
        //               onPressed: () {
        //                 setState(() {
        //                   // currentScreen = const Setting();
        //                   // currentTab = 3;
        //                 });
        //               },
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: const [
        //                   Icon(
        //                     Icons.perm_identity_outlined,
        //                     // color: currentTab == 3 ? Colors.red : Colors.grey,
        //                   ),
        //                   Text(
        //                     'Tài khoản',
        //                     style: TextStyle(
        //                         // color: currentTab == 3 ? Colors.black : Colors.grey,
        //                         ),
        //                   )
        //                 ],
        //               ),
        //             )
        //           ],
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}
