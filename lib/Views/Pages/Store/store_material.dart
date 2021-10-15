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

class StoreManageMaterial extends StatefulWidget {
  @override
  _StoreManageMaterialState createState() => _StoreManageMaterialState();
  static const routeName = '/manageOrder';
}

class _StoreManageMaterialState extends State<StoreManageMaterial> {
  List cate = [
    {'name': 'Tất cả', 'active': true},
    {'name': 'Thịt', 'active': false},
    {'name': 'Rau', 'active': false},
    {'name': 'Gia vị', 'active': false},
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
      MaterialItem(
          id: '007',
          name: 'Rau cải',
          date: 0,
          mass: 7,
          status: 1,
          category: 'Rau'),
    ];
    material = list;
  }

  String selectedCate = 'Tất cả';
  // 0 1 2 3
  void setSelected(String status) {
    // if (status == 'Tất cả') {
    //   setState(() {
    //     selectedCate = 0;
    //   });
    // }
    // if (status == 'Thịt') {
    //  setState(() {
    //     selectedCate = 0;
    //   });
    // }
    // if (status == 0) {
    //   str = 'Rau';
    // }
    // if (status == 0) {
    //   str = 'Gia vị';
    // }
    // print(status);
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
                "Nguyên liệu",
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
                    labelText: "tên nguyên liệu"),
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
              margin: EdgeInsets.only(top: 20),
              // color: Colors.green,
              height: 450,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: material.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return build_material_item(
                      // select: 3,
                      category: material[index].category,
                      name: material[index].name,
                      mass: material[index].mass,
                      date: material[index].date,
                      id: material[index].id,
                      status: material[index].status,
                      selectedCate: selectedCate);
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

class build_material_item extends StatelessWidget {
  final String category;
  final String id;
  final String name;
  final int date;
  final double mass;
  final int status;
  final String selectedCate;
  // final int select;
  //select   dang muon search cai nao
  const build_material_item(
      {Key? key,
      required this.id,
      required this.name,
      required this.date,
      required this.mass,
      required this.status,
      required this.category,
      required this.selectedCate
      // required this.select
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Gui yeu cau Alert
    String dropdownValue = '(g)';
    String dropdownValueEmployee = 'Lê Văn Nguyên';
    Future<int> ShowInformationDialog(
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
                  'Yêu cầu cấp nguyên liệu',
                  style: TextStyle(color: Colors.black),
                ),
                content: Container(
                  height: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text(
                            'Mã yêu cầu 005',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text('Mã nguyên liệu: ${materialID}')),
                      Container(
                          margin: EdgeInsets.only(bottom: 5),
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
                              Container(
                                width: 70,
                                margin: EdgeInsets.only(left: 10),
                                child: DropdownButton<String>(
                                  value: dropdownValue,
                                  icon: const Icon(Icons.arrow_downward),
                                  iconSize: 10,
                                  elevation: 16,
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
                                  // underline: Container(
                                  //   height: 2,
                                  //   color: Colors.deepPurpleAccent,
                                  // ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    '(g)',
                                    '(kg)',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
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
                          dateLabelText: 'Ngày nhận',
                          onChanged: (val) => print(val),
                          validator: (val) {
                            print(val);
                            return null;
                          },
                          onSaved: (val) => print(val),
                        ),
                      ),
                      Container(
                          width: 250,
                          margin: EdgeInsets.only(bottom: 5),
                          child: Row(
                            children: [
                              Text('Người gửi: '),
                              Container(
                                width: 150,
                                margin: EdgeInsets.only(left: 10),
                                child: DropdownButton<String>(
                                  value: dropdownValueEmployee,
                                  icon: const Icon(Icons.arrow_downward),
                                  iconSize: 10,
                                  elevation: 16,
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
                                  // underline: Container(
                                  //   height: 2,
                                  //   color: Colors.deepPurpleAccent,
                                  // ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValueEmployee = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'Lê Văn Nguyên',
                                    'Trần Bích Liên',
                                    'Huỳnh Minh Chí',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          )),
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
                    color: Colors.green,
                    onPressed: () {
                      //  setState((){
                      //   testHuy = 1;
                      // });

                      Navigator.of(context).pop(1);
                    },
                    child: Text('Gửi yêu cầu'),
                    elevation: 5,
                  )
                ],
              );
            });
          });
    }

    //Xoa Alert
    String dropdownValue2 = '(g)';
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
                              Container(
                                width: 70,
                                margin: EdgeInsets.only(left: 10),
                                child: DropdownButton<String>(
                                  value: dropdownValue,
                                  icon: const Icon(Icons.arrow_downward),
                                  iconSize: 10,
                                  elevation: 16,
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
                                  // underline: Container(
                                  //   height: 2,
                                  //   color: Colors.deepPurpleAccent,
                                  // ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    '(g)',
                                    '(kg)',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
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
                      Container(
                          // color: Colors.red,
                          width: 250,
                          margin: EdgeInsets.only(bottom: 5),
                          child: Row(
                            children: [
                              Text('Người hủy: '),
                              Container(
                                width: 150,
                                margin: EdgeInsets.only(left: 10),
                                child: DropdownButton<String>(
                                  value: dropdownValueEmployee,
                                  icon: const Icon(Icons.arrow_downward),
                                  iconSize: 10,
                                  elevation: 16,
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
                                  // underline: Container(
                                  //   height: 2,
                                  //   color: Colors.deepPurpleAccent,
                                  // ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValueEmployee = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'Lê Văn Nguyên',
                                    'Trần Bích Liên',
                                    'Huỳnh Minh Chí',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          )),
                      Container(
                        // margin: EdgeInsets.only(left: 15),

                        height: 40,
                        child: TextField(
                          // keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                              ),
                              focusColor: Colors.red,
                              labelText: "Lí do hủy"),
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

    // 1: con, 2: het, 3: sap het, 4: het
    String text = '';
    var Color = Colors.red;
    if (status == 1) {
      Color = Colors.green;
      text = 'Còn hàng';
    } else if (status == 2) {
      Color = Colors.red;
      text = 'Hết hàng';
    } else if (status == 3) {
      Color = Colors.orange;
      text = 'Sắp hết';
    } else if (status == 4) {
      Color = Colors.purple;
      text = 'Hết hạn';
    }

    if (selectedCate.compareTo('Tất cả') == 0 ||
        category.compareTo(selectedCate) == 0) {
      // print('cate $category  :   $selectedCate');
      return Container(
        height: 70,
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
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              color: Colors.green.withOpacity(0.3),
              width: 100,
              height: 100,
              child: Stack(
                children: [
                  Positioned(
                    top: 2,
                    left: 5,
                    child: Text("Mã: $id", style: TextStyle(fontSize: 14)),
                  ),
                  Positioned(
                      top: 23,
                      left: 4,
                      child: Text(
                        name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                  // Positioned(
                  //     top: 35,
                  //     left: 5,
                  //     child: Text(
                  //       "Ngày 25/9",
                  //       style: TextStyle(fontSize: 12),
                  //     )),
                  Positioned(
                      top: 50,
                      left: 5,
                      child: Text(
                        "HSD: Còn $date ngày",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                // color: Colors.red.withOpacity(0.5),
              ),
              width: 70,
              height: 70,
              child: Container(
                  padding: EdgeInsets.only(left: 5, top: 24),
                  child: Text(
                    '$mass kg',
                    style: TextStyle(fontSize: 16),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                // color: Colors.red.withOpacity(0.5),
              ),
              width: 70,
              height: 70,
              child: Container(
                padding: EdgeInsets.only(left: 5, top: 24),
                child: Text(
                  text,
                  style: TextStyle(fontSize: 16, color: Color),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  // color: Colors.red.withOpacity(0.5),
                ),
                width: 70,
                height: 70,
                child: Column(
                  children: [
                    Container(
                      // color: Colors.red,
                      padding: EdgeInsets.only(left: 5, top: 0),
                      child: CustomIconButton(
                        icon: Icon(
                          Icons.add,
                          size: 18,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          ShowInformationDialog(context, id, name)
                              .then((value) {
                            if (value == 1) {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text(
                                    'Yêu cầu đã được gửi',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text(
                                        'OK',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          });
                        },
                        margin: EdgeInsets.all(0),
                        backgroundColor: Colors.black.withOpacity(0.03),
                      ),
                    ),
                    Container(
                      // color: Colors.red,
                      padding: EdgeInsets.only(left: 5, top: 0),
                      child: CustomIconButton(
                        icon: Icon(
                          Icons.remove,
                          size: 18,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          ShowInformationDialog2(context, id, name)
                              .then((value) {
                            if (value == 1) {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text(
                                    'Bạn có chắc chắn muốn hủy nguyên liệu này?',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text(
                                        'Không',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text(
                                        'Đồng ý',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          });
                        },
                        margin: EdgeInsets.all(0),
                        backgroundColor: Colors.black.withOpacity(0.03),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      );
    }
    return Container();
  }
}
