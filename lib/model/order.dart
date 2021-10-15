import 'package:cookbookapp/model/dish.dart';

class Order {
  String orderId;
  String storeId;
  String userId;
  DateTime time;
  String address;
  double price;
  String payment;
  String userName;
  int orderStatus;
  List listDish;
  Order(
      {required this.orderId,
      required this.time,
      required this.address,
      required this.price,
      required this.payment,
      required this.userName,
      required this.orderStatus,
      required this.listDish,
      required this.userId,
      required this.storeId,
      });

  String get getOrderID => this.orderId;
  
}
