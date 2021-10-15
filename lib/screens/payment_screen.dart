import 'package:cookbookapp/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);
  static const routeName = '/payment';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff32726),
        titleSpacing: 0,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Thanh toán'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    dummyDataOfListView(
                        'assets/images/pack1.jpg',
                        "Vịt Kho Măng",
                        '[Vịt kho măng tươi 375g, Măng Hữu Cơ 200g, Hành lá ớt đỏ 25g]',
                        '130,000đ',
                        1,
                        180),
                    dummyDataOfListView(
                        'assets/images/gaNuong.jpg',
                        "Gà Nướng Muối Ớt",
                        '[Gà 1500g, Muối Ớt Đỏ 100g, Tiêu Bột 50,Ớt Bột 150gr ]',
                        '150,000đ',
                        2,
                        180),
                    dummyDataOfListView(
                        'assets/images/pack3.jpg',
                        "Tôm Thẻ Ram Mặn",
                        '[Hành lá,Ớt Chỉ Thiên Đỏ 25, Tôm Thẻ Rim Mặn 265g]',
                        '120,000đ',
                        2,
                        180),
                    // Divider(
                    //   color: Color(0xffcccccb),
                    // ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 20.0),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              "Tổng: 3 sản phẩm",
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          Text(
                            "400,000đ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0xffcccccb),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 10),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              "Phí vận chuyển(11 km)",
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          Text(
                            "99,000đ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0xffcccccb),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 30),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              "Tổng cộng",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "499,000đ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color(0xffcccccb),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: 55,
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  color: Color(0xfff32726),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: GestureDetector(
                      onTap: () {
                         Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                      },
                      child: const Text(
                        'Đặt hàng',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  dummyDataOfListView(String imgSrc, String itemName, String itemDes,
      String itemPrice, int itemCount, double height) {
    return Container(
      child: Card(
        elevation: 2,
        // margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 5.0),
        // color: Color(0xffFFFFFF),
        child: ListTile(
            // on ListItem clicked
            onTap: () {},

            // Image of ListItem
            leading: Container(
              child: Image(
                fit: BoxFit.fitHeight,
                // image: NetworkImage(imgSrc),
                image: AssetImage(imgSrc),
                width: 70,
                height: 100,
              ),
            ),

            // Lists of titles
            title: Container(
              margin: EdgeInsets.only(top: 10.0),
              height: height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 2.0),
                    child: Text(
                      '${itemName}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 3.0),
                    child: Text(
                      "${itemDes}",
                      style: TextStyle(),
                    ),
                  ),
                ],
              ),
            ),
            trailing: Container(
              width: 140,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.amber),
                    child: Text('${itemCount}'),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text('${itemPrice}'),
                ],
              ),
            )),
      ),
    );
  }
}
