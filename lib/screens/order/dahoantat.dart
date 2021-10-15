import 'package:flutter/material.dart';

import '../detail_order.dart';

class dahoantat extends StatefulWidget {
  const dahoantat({Key? key}) : super(key: key);

  @override
  State<dahoantat> createState() => _dahoantatState();
}

class _dahoantatState extends State<dahoantat> {
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
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      width: 300,
                      padding: EdgeInsets.only(bottom: 2.0),
                      child: Row(
                        children: [
                          Icon(Icons.done),
                          Text(
                            " Đã giao: 3/9/2021",
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
                      "Chi nhánh Cookbook 8",
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
                            "420.000đ",
                            style: TextStyle(),
                          ),
                          Text('(Ví MoMo) - 3 món'),
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
