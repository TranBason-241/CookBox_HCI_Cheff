import 'package:flutter/material.dart';

class DetailOrder extends StatefulWidget {
  const DetailOrder({Key? key}) : super(key: key);
  static const routeName = '/detailorder';
  @override
  _DetailOrderState createState() => _DetailOrderState();
}

class _DetailOrderState extends State<DetailOrder> {
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
        title: const SizedBox(
          height: 37,
          child: Text('CookBook chi nhánh 8'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.local_mall_outlined),
            onPressed: () {
              // Navigator.pushNamed(context, CartScreen.routeName);
            },
          ),
        ],
        centerTitle: false,
      ),
    );
  }
}
