import 'package:cookbookapp/Views/Pages/Store/store_order_detail.dart';
import 'package:cookbookapp/Views/Pages/user/product_detail.dart';
import 'package:cookbookapp/Views/common/constants.dart';
import 'package:cookbookapp/Views/common/custom_icon_button.dart';
import 'package:cookbookapp/model/dish.dart';
import 'package:cookbookapp/model/ingredient.dart';
import 'package:cookbookapp/model/order.dart';
import 'package:cookbookapp/model/recipeStep.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';

class StoreRequest extends StatefulWidget {
  @override
  _StoreRequestlState createState() => _StoreRequestlState();
  static const routeName = '/manageOrder';
}

class _StoreRequestlState extends State<StoreRequest> {
  // List cate = [
  //   {'name': 'Tất cả', 'active': true},
  //   {'name': 'Đã hoàn thành', 'active': false},
  //   {'name': 'Chưa hoàn thành', 'active': false},
  //   {'name': 'Đã hủy', 'active': false},
  // ];
  List cate = [
    {'name': 'Tất cả', 'active': true},
    {'name': '3 ngày trước', 'active': false},
    {'name': '7 ngày trước', 'active': false},
  ];
  String seletedCate = 'Tất cả';
  List deleteList = [];

  @override
  void initState() {
    deleteList = [
      {
        'deleteID': '101',
        'itemID': '001',
        'itemName': 'Thịt heo',
        'mass': '2kg',
        'employee': 'Huỳnh Minh Chí',
        'date': '25/9/2021',
        'dateGet': '26/9/2021',
        'status': 'Đang xử lí',
      },
      {
        'deleteID': '102',
        'itemID': '002',
        'itemName': 'Bí đỏ',
        'mass': '0.5kg',
        'employee': 'Lê Văn Nguyên',
        'date': '24/9/2021',
        'dateGet': '24/9/2021',
        'status': 'Xác nhận',
      },
      {
        'deleteID': '102',
        'itemID': '002',
        'itemName': 'Bí đỏ',
        'mass': '0.5kg',
        'employee': 'Lê Văn Nguyên',
        'date': '24/9/2021',
        'dateGet': '24/9/2021',
        'status': 'Đã nhận',
      }
    ];
  }

  void setSelected(String name) {
    for (int i = 0; i < cate.length; i++) {
      if (name.compareTo(cate[i]['name']) == 0) {
        setState(() {
          cate[i]['active'] = true;
          seletedCate = cate[i]['name'];
        });
      } else {
        setState(() {
          cate[i]['active'] = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // appBar: new AppBar(
      //     title: new Text('App Name'),
      //     ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.red.withOpacity(1),
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.only(left: 0, right: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomIconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 28,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    margin: EdgeInsets.all(0),
                    backgroundColor: Colors.red,
                  ),
                  Container(
                      height: 59,
                      width: 59,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('assets/images/chefLogo.jpg'),
                        ),
                      ))
                ],
              ),
            ),
            //infor
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 2, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "CookBox chi nhánh 6",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.red),
                  ),
                  Text(
                    "276 Tây Thạnh, Tân Phú, TP Hồ Chí Minh",
                    style: TextStyle(fontSize: 11),
                  )
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 10, left: 85),
              child: Text(
                "Lịch sử yêu cầu",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),

            //Search order
            Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.only(top: 20, left: 10, right: 0),
                height: 70,
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 200,
                      child: DateTimePicker(
                        initialValue: '',
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2022),
                        dateLabelText: 'Tìm kiếm theo ngày',
                        onChanged: (val) => print(val),
                        validator: (val) {
                          print(val);
                          return null;
                        },
                        onSaved: (val) => print(val),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: CustomIconButton(
                        icon: Icon(
                          Icons.search,
                          size: 19,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                        margin: EdgeInsets.all(0),
                        backgroundColor: Colors.red.withOpacity(0.7),
                      ),
                    ),
                  ],
                )),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  ...cate.map((e) {
                    return CategoryTitleItem(
                      title: e['name'],
                      active: e['active'],
                      setActive: setSelected,
                    );
                  })
                  // CategoryTitleItem(
                  //   title: "tất cả",
                  //   active: true,
                  // ),
                  // CategoryTitleItem(
                  //   title: "Chưa hoàn thành",
                  //   active: false,
                  // ),
                  // CategoryTitleItem(
                  //   title: "Đã hoàn thành",
                  //   active: false,
                  // ),
                  // // CategoryTitleItem(
                  // //   title: "Đã giao",
                  // //   active: false,
                  // // ),
                ],
              ),
            ),

            //listOrder    ,

            Container(
              height: 500,
              margin: EdgeInsets.only(top: 10),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: deleteList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return build_delete_item(
                    deleteID: deleteList[index]['deleteID'],
                    itemID: deleteList[index]['itemID'],
                    itemName: deleteList[index]['itemName'],
                    date: deleteList[index]['date'],
                    mass: deleteList[index]['mass'],
                    dateGet: deleteList[index]['dateGet'],
                    status: deleteList[index]['status'],
                    employee: deleteList[index]['employee'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTitleItem extends StatelessWidget {
  final String title;
  final bool active;
  final Function setActive;

  const CategoryTitleItem(
      {Key? key,
      required this.title,
      @required this.active = false,
      required this.setActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (active) {
      return GestureDetector(
        onTap: () {
          setActive(title);
        },
        child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "$title",
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15),

              // style: Theme.of(context).textTheme.button.copyWith(
              //       color: Colors.red;
              //     ),
            )),
      );
    }
    return GestureDetector(
      onTap: () {
        setActive(title);
      },
      child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Text(
            "$title", style: TextStyle(color: Colors.black.withOpacity(.3)),
            // style: Theme.of(context).textTheme.button.copyWith(
            //       color: Colors.red;
            //     ),
          )),
    );
  }
}

class build_delete_item extends StatelessWidget {
  final String deleteID;
  final String itemID;
  final String itemName;
  final String mass;
  final String date;
  final String employee;
  final String dateGet;
  final String status;

  // final int select;
  //select   dang muon search cai nao
  const build_delete_item(
      {Key? key,
      required this.deleteID,
      required this.itemID,
      required this.itemName,
      required this.mass,
      required this.date,
      required this.dateGet,
      required this.employee,
      required this.status
      // required this.select
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
// Lay Mau
    Function getColor = () {
      const Color = Colors.red;
      if (status == 'Đang xử lí') {
        const Color = Colors.orange;
        return Color;
      } else if (status == 'Xác nhận') {
        const Color = Colors.green;
        return Color;
      } else if (status == 'Đã nhận') {
        const Color = Colors.red;
        return Color;
      }
    };
// lay button

    Function handleCannerButton = (int orderStatus) {
      if (status.compareTo('Đang xử lí') == 0) {
        return RaisedButton(
          color: Colors.red.withOpacity(0.8),
          child: Text(
            'Hủy',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {},
        );
      } else if (status.compareTo('Xác nhận') == 0) {
        return Container();
      }
    };

    // 1: con, 2: het, 3: sap het, 4: het
    String text = '';
    var Color = Colors.red;

    // print('cate $category  :   $selectedCate');
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 10),
      // padding:
      //     EdgeInsets.only(left: 2, top: 2, right: 2, bottom: 2),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.03),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green.withOpacity(0.5),
            ),
            padding: EdgeInsets.only(top: 5),
            width: 120,
            height: 120,
            child: Stack(
              children: [
                Positioned(
                  top: 2,
                  left: 5,
                  child: Text("Mã yêu cầu: $deleteID",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ),

                // Positioned(
                //     top: 35,
                //     left: 5,
                //     child: Text(
                //       "Ngày 25/9",
                //       style: TextStyle(fontSize: 12),
                //     )),
                Positioned(
                    top: 24,
                    left: 5,
                    child: Text(
                      "$date",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )),
                Positioned(
                    top: 45,
                    left: 5,
                    child: Text(
                      "$employee",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
          Container(
            // color: Colors.green.withOpacity(0.3),
            padding: EdgeInsets.only(top: 5),
            width: 140,
            height: 100,
            child: Stack(
              children: [
                Positioned(
                  top: 2,
                  left: 5,
                  child: Text("Mã nguyên liệu: $itemID",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ),

                // Positioned(
                //     top: 35,
                //     left: 5,
                //     child: Text(
                //       "Ngày 25/9",
                //       style: TextStyle(fontSize: 12),
                //     )),
                Positioned(
                    top: 20,
                    left: 5,
                    child: Text(
                      "Tên: $itemName",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    )),
                Positioned(
                    top: 36,
                    left: 5,
                    child: Text(
                      "Số lượng: $mass",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    )),
                Positioned(
                    top: 52,
                    left: 5,
                    child: Text(
                      "ngày nhận: $dateGet",
                      style: TextStyle(fontSize: 14),
                    )),
              ],
            ),
          ),
          Container(
            width: 110,
            height: 80,
            // color: Colors.green,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    '$status',
                    style: TextStyle(color: getColor(), fontSize: 16),
                  ),
                ),
                status.compareTo('Đang xử lí') == 0
                    ? RaisedButton(
                        onPressed: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text(
                                'Bạn có chắc chắn muốn hủy yêu cầu này?',
                                style: TextStyle(color: Colors.black),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text(
                                    'Không',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text(
                                    'Đồng ý',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Text(
                          'Hủy',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.red.withOpacity(0.8),
                      )
                    : Container(),
                    status.compareTo('Xác nhận') == 0
                    ? RaisedButton(
                        onPressed: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text(
                                'Bạn đã nhận được nguyên liệu?',
                                style: TextStyle(color: Colors.black),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text(
                                    'Chưa nhận',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text(
                                    'Đã nhận',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Text(
                          'Kí nhận',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.green.withOpacity(0.8),
                      )
                    : Container()
              ],
            ),
          )
        ],
      ),
    );

    return Container();
  }
}
