// import '/providers/orders.dart' show Orders;
// import '/screens/home_screen.dart';
// import '/widgets/order_item.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class DangDen extends StatelessWidget {
//   const DangDen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final orderData = Provider.of<Orders>(context);
//     // return ListView.builder(
//     //   itemCount: orderData.orders.length,
//     //   itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
//     // );
//     return orderData.orders.length == 0
//         ? container(context)
//         : ListView.builder(
//             itemCount: orderData.orders.length,
//             itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
//           );
//   }

//   Widget container(BuildContext context) {
//     return Align(
//       child: Center(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 100,
//             ),
//             Text('Bạn chưa có đơn hàng nào'),
//             OutlinedButton(
//                 onPressed: () {
//                   Navigator.of(context)
//                       .pushReplacementNamed(HomeScreen.routeName);
//                 },
//                 child: Text('Mua hàng ngay'))
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../detail_order.dart';

class DangDen extends StatefulWidget {
  const DangDen({Key? key}) : super(key: key);

  @override
  State<DangDen> createState() => _DangDenState();
}

class _DangDenState extends State<DangDen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              GestureDetector(
                child: dummyDataOfListView(
                  "https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp",
                  "Women T-Shirt",
                  "Cloths",
                  "500Rs",
                  4,
                ),
                onTap: () {
                  print('aa');
                  Navigator.pushNamed(context, DetailOrder.routeName);
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  // initScreen(BuildContext context) {
  //   return Container(
  //       child: Stack(
  //     children: <Widget>[
  //       ListView(
  //         children: <Widget>[
  //           GestureDetector(
  //             child: dummyDataOfListView(
  //               "https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp",
  //               "Women T-Shirt",
  //               "Cloths",
  //               "500Rs",
  //               4,
  //             ),
  //             onTap: () {
  //               Navigator.pushNamed(context, DetailOrder.routeName);
  //             },
  //           )

  //         ],
  //       ),
  //     ],
  //   ));
  // }

  dummyDataOfListView(String imgSrc, String itemName, String itemCategory,
      String itemPrice, int itemCount) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, DetailOrder.routeName);
        },
        child: Card(
          margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
          color: Color(0xffEEEEEE),
          child: ListTile(
            // on ListItem clicked
            onTap: () {},

            // Image of ListItem
            // leading: Container(
            //   child: Image(
            //     fit: BoxFit.fitHeight,
            //     // image: AssetImage(imgSrc),
            //     image: NetworkImage(imgSrc),
            //   ),
            // ),

            // Lists of titles
            title: Container(
              margin: EdgeInsets.only(top: 10.0),
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      width: 300,
                      padding: EdgeInsets.only(bottom: 2.0),
                      child: Row(
                        children: [
                          // Icon(Icons.done),

                          Text(
                            "6/10/2021",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 2.0),
                    child: Text(
                      "Chi nhánh Cookbook 6",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      padding: EdgeInsets.only(bottom: 3.0),
                      child: Row(
                        children: [
                          Text(
                            "120.000đ",
                            style: TextStyle(),
                          ),
                          Text('(Ví MoMo) - 1 món'),
                        ],
                      )),

                  // Container(
                  //   padding: EdgeInsets.only(bottom: 3.0),
                  //   child: Text(
                  //     "500 RS",
                  //     style: TextStyle(color: Color(0xff374ABE)),
                  //   ),
                  // ),
                ],
              ),
            ),

            trailing: Container(
              height: 90,
              child: Icon(
                Icons.arrow_right,
                size: 30,
                color: Color(0xfff32726),
              ),
            ),
            // child: Column(
            //   children: [
            //     Icon(
            //       Icons.arrow_right,
            //       size: 30,
            //       color: Color(0xff374ABE),
            //     ),
            //     SizedBox(
            //       width: 20,
            //       child: TextButton(
            //         onPressed: () {},
            //         child: Text('Đặt lại'),
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}
