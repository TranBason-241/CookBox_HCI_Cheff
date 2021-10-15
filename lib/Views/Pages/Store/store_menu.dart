import 'package:cookbookapp/Views/Pages/Store/store_order_detail.dart';
import 'package:cookbookapp/Views/Pages/user/product_detail.dart';
import 'package:cookbookapp/Views/common/constants.dart';
import 'package:cookbookapp/Views/common/custom_icon_button.dart';
import 'package:cookbookapp/model/dish.dart';
import 'package:cookbookapp/model/ingredient.dart';
import 'package:cookbookapp/model/material.dart';
import 'package:cookbookapp/model/order.dart';
import 'package:cookbookapp/model/recipeStep.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:date_time_picker/date_time_picker.dart';

class StoreMenu extends StatefulWidget {
  @override
  _StoreMenuState createState() => _StoreMenuState();
  static const routeName = '/manageOrder';
}

class _StoreMenuState extends State<StoreMenu> {
  Future<int> ShowInformationDialog2(
      BuildContext context, materialID, name) async {
    return await showDialog(
        context: context,
        builder: (context) {
          // final TextEditingController _textEditingController =
          //     new TextEditingController();
          // bool? isChecked = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Text(
                'Hủy bỏ nguyên liệu',
                style: TextStyle(color: Colors.red),
              ),
              content: Container(
                height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 0),
                        child: Text(
                          'Mã hủy 005',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Container(
                        margin: EdgeInsets.only(bottom: 0),
                        child: Text('Mã nguyên liệu: ${materialID}')),
                    Container(
                        margin: EdgeInsets.only(bottom: 0),
                        child: Text('Tên: ${name}')),
                    Container(
                        width: 250,
                        margin: EdgeInsets.only(bottom: 0),
                        child: Row(
                          children: [
                            Text('khối lượng: '),
                            Container(
                              // margin: EdgeInsets.only(left: 15),
                              width: 85,
                              height: 40,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2.0),
                                    ),
                                    focusColor: Colors.red,
                                    labelText: "Số"),
                              ),
                            ),
                          ],
                        )),
                    Container(
                      height: 50,
                      width: 300,
                      child: DateTimePicker(
                        initialValue: '',
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2022),
                        dateLabelText: 'Ngày hủy',
                        onChanged: (val) => print(val),
                        validator: (val) {
                          print(val);
                          return null;
                        },
                        onSaved: (val) => print(val),
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop(2);
                  },
                  child: Text('Thoát'),
                  elevation: 5,
                ),
                MaterialButton(
                  color: Colors.red,
                  onPressed: () {
                    //  setState((){
                    //   testHuy = 1;
                    // });

                    Navigator.of(context).pop(1);
                  },
                  child: Text('HỦY'),
                  elevation: 5,
                )
              ],
            );
          });
        });
  }

  List cate = [
    {'name': 'tất cả', 'active': true},
    {'name': 'ngưng phục vụ', 'active': false},
    {'name': 'đang phục vụ', 'active': false},
    {'name': 'chay', 'active': false},
    {'name': 'lẩu', 'active': false},
    {'name': 'nướng', 'active': false},
  ];

  @override
  List material = [];
  void initState() {
    List<MaterialItem> list = [
      MaterialItem(
          id: '001',
          name: 'Thịt heo',
          date: 7,
          mass: 15,
          status: 3,
          category: 'Thịt'),
      MaterialItem(
          id: '002',
          name: 'Bí đỏ',
          date: 5,
          mass: 7,
          status: 3,
          category: 'Rau'),
      MaterialItem(
          id: '003',
          name: 'Thịt bò',
          date: 5,
          mass: 12,
          status: 3,
          category: 'Thịt'),
      MaterialItem(
          id: '004',
          name: 'Cải thảo',
          date: 3,
          mass: 6,
          status: 3,
          category: 'Rau'),
      MaterialItem(
          id: '005',
          name: 'Thịt gà',
          date: 0,
          mass: 0,
          status: 2,
          category: 'Thịt'),
      MaterialItem(
          id: '006',
          name: 'Thịt vịt',
          date: 0,
          mass: 0,
          status: 2,
          category: 'Thịt'),
      MaterialItem(
          id: '007',
          name: 'Ớt chuông',
          date: 0,
          mass: 0,
          status: 2,
          category: 'Rau'),
    ];
    material = list;
  }

  String selectedCate = 'Tất cả';
  // 0 1 2 3
  void setSelected(String status) {
    for (int i = 0; i < cate.length; i++) {
      if (status.compareTo(cate[i]['name']) == 0) {
        setState(() {
          cate[i]['active'] = true;
          selectedCate = cate[i]['name'];
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
              margin: EdgeInsets.only(top: 10, left: 110),
              child: Text(
                "Thực đơn",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),

            //Search order
            Container(
              padding: EdgeInsets.only(top: 20, left: 0, right: 0),
              height: 70,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(10)),
                    ),
                    focusColor: Colors.red,
                    labelText: "tên món ăn"),
              ),
            ),
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
                ],
              ),
            ),

            // list dish
            Container(
              margin: EdgeInsets.only(top: 20),
              // color: Colors.green,
              height: 450,
              // color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 150,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green.withOpacity(0.6),
                      ),
                      child: Row(
                        children: [
                          Container(
                              child: Image.asset('assets/images/vit4.jpg')),
                          Container(
                            padding: EdgeInsets.only(left: 20, top: 10),
                            // color: Colors.red,
                            width: 220,
                            height: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Vịt nướng',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Giá: 120.000 đồng',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Đang phục vụ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Container(
                                  padding: EdgeInsets.only(left: 155),
                                  child: CustomIconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      size: 22,
                                      color: Colors.black,
                                    ),
                                    onPressed: () { showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title: const Text(
                                            'Ngưng phục vụ món này',
                                            style:
                                                TextStyle(color: Colors.red),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, 'OK'),
                                              child: const Text(
                                                'Quay lại',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, 'OK'),
                                              child: const Text(
                                                'Lưu',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ],
                                        ));},
                                    margin: EdgeInsets.all(0),
                                    backgroundColor:
                                        Colors.black.withOpacity(0.1),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 150,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green.withOpacity(0.6),
                      ),
                      child: Row(
                        children: [
                          Container(
                              child: Image.asset('assets/images/pack4.jpg')),
                          Container(
                            padding: EdgeInsets.only(left: 20, top: 10),
                            // color: Colors.red,
                            width: 220,
                            height: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Thịt kho',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Giá: 120.000 đồng',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Ngưng phục vụ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    )),
                                Container(
                                  padding: EdgeInsets.only(left: 155),
                                  child: CustomIconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      size: 22,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title: const Text(
                                            'Tiếp tục phục vụ món này.',
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, 'OK'),
                                              child: const Text(
                                                'Quay lại',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, 'OK'),
                                              child: const Text(
                                                'Lưu',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    margin: EdgeInsets.all(0),
                                    backgroundColor:
                                        Colors.black.withOpacity(0.1),
                                  ),
                                ),
                                // Container(
                                //   padding: EdgeInsets.only(left: 155),
                                //   child: CustomIconButton(
                                //     icon: Icon(
                                //       Icons.edit,
                                //       size: 22,
                                //       color: Colors.black,
                                //     ),
                                //     onPressed: () {},
                                //     margin: EdgeInsets.all(0),
                                //     backgroundColor:
                                //         Colors.black.withOpacity(0.1),
                                //   ),
                                // )
                              ],
                            ),
                          )
                        ],
                      ))
                ],
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
