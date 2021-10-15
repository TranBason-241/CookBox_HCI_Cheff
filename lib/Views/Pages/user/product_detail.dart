import 'dart:developer';

// import 'package:cookbookapp/screens/homescreen.dart';

import 'package:cookbookapp/Views/Pages/user/homescreen.dart';

import '../../common/custom_icon_button.dart';
import 'package:flutter/material.dart';

class Product_detail_page extends StatefulWidget {
  const Product_detail_page({Key? key}) : super(key: key);
  static const routeName = '/productDetail';

  @override
  _Product_detail_pageState createState() => _Product_detail_pageState();
}

class _Product_detail_pageState extends State<Product_detail_page> {
  List listRecipe = [
    {
      'image':
          'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/uop-ga-cung-gia-vi.jpg',
      'description':
          "bạn trộn nước xốt ướp gà theo công thức: 2 muỗng canh nước mắm, 1 muỗng cà phê muối, 2 muỗng canh dầu ăn, 2 muỗng cà phê đường, 1 muỗng cà phê bột ngọt, 1/2 muỗng cà phê tiêu, 4 trái ớt giã nhuyễn, khuấy đều."
    },
    {
      'image':
          'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/nuong-ga.jpg',
      'description':
          'Sau khoảng thời gian ướp, bạn lấy gà ra ngoài, đặt lên vỉ nướng trên bếp than hoa. Mẹo nhỏ trong cách làm gà nướng muối ớt mà không phải ai cũng biết là bạn nên nướng gà với lửa nhỏ, vì lửa lớn rất dễ làm lớp da bên ngoài bị cháy còn thịt bên trong còn sống.'
    },
    {
      'image':
          'https://thuvienamthuc.vn/app_images/news/2020/6/30/cach-lam-ga-nuong-muoi-ot-ngon-800-153822.jpg',
      'description': 'Trình Bày Và Thưởng Thức'
    },
  ];

  List listTaste = [
    {'taste': 'Cay'},
  ];
  List listIng = [
    {'name': 'Gà ', 'Luong': 1500},
    {'name': 'Muối', 'Luong': 100},
    {'name': 'tiêu', 'Luong': 50},
    {'name': 'ớt bột', 'Luong': 150}
  ];
  int lv = 3;
  @override
  updateState(String operator) {
    if (operator.compareTo('add') == 0) {
      if (lv < 5) {
        this.setState(() {
          lv += 1;
          listIng[2]['Luong'] = listIng[2]['Luong'] + 10;
          listIng[3]['Luong'] = listIng[2]['Luong'] + 10;
        });
      }
    } else {
      if (lv > 1) {
        this.setState(() {
          lv -= 1;
          listIng[2]['Luong'] = listIng[2]['Luong'] - 10;
          listIng[3]['Luong'] = listIng[2]['Luong'] - 10;
        });
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildImage(),
          buildFoodInfo(),
          buildAppBar(),
        ],
      ),
    );
  }

  Widget buildFoodInfo() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 2 - 20),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Gà nướng",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$200",
                  style: TextStyle(color: Colors.red, fontSize: 25),
                )
              ],
            ),
            // Text("Italiam soup"),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [Text("food Name"), Text("300\%")],
            // ),
            Row(
              children: [
                ...List.generate(
                    5,
                    (index) => Icon(
                          Icons.star,
                          color: Colors.yellow,
                        )),
                Spacer(),
                CustomIconButton(
                  icon: Icon(Icons.remove, size: 16),
                  onPressed: () {},
                  backgroundColor: Colors.black.withOpacity(0.2),
                  margin: EdgeInsets.only(left: 10, right: 10),
                ),
                Text(
                  "1",
                  style: TextStyle(fontSize: 15),
                ),
                CustomIconButton(
                  icon: Icon(
                    Icons.add,
                    size: 16,
                  ),
                  onPressed: () {},
                  margin: EdgeInsets.only(left: 10, right: 10),
                  backgroundColor: Colors.black.withOpacity(0.2),
                )
              ],
            ),
            buildOrderButton(),
            buildNutrients(),
            buildDescription(),
            buildCustomTaste(),
            buildIngredient(),
            buildRecipe(),
          ],
        ),
      ),
    );
  }

  Widget buildNutrients() {
    List list = [
      {'name': 'Calories', 'Luong': 1500 + 200},
    ];
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dinh Dưỡng",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
                child: Column(
              children: [
                ...list.map((v) => Row(
                      children: [
                        Text("${v['name']}"),
                        Text(":   ${v['Luong']}")
                      ],
                    ))
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget buildIngredient() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Thành phần",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
                child: Column(
              children: [
                ...listIng.map((v) => Row(
                      children: [
                        Text("${v['name']}"),
                        Text(":   ${v['Luong']}")
                      ],
                    ))
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget buildOrderButton() {
    return Container(
      padding: EdgeInsets.only(left: 185),
      child: Row(
        children: [
          CustomIconButton(
              icon: Icon(
                Icons.add_shopping_cart,
                color: Colors.red,
                size: 30,
              ),
              onPressed: () {},
              margin: EdgeInsets.all(0)),
          RaisedButton(
            onPressed: () {},
            child: Text("Place an order"),
            color: Colors.green,
          )
        ],
      ),
    );
  }

  Widget buildDescription() {
    return Container(
      margin: EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mô tả",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
              "Món gà nướng muối ớt thơm lừng có lớp da giòn, thịt mềm thấm vị mặn của muối, vị cay nồng của ớt chinh phục cả những người ăn khó tính và trở thành món ăn được rất nhiều người ưa chuộng.")
        ],
      ),
    );
  }

  Widget buildCustomTaste() {
    return Container(
      margin: EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Điều chỉnh theo khẩu vị của bạn",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
          ),
          Text(
            "Điều chỉnh các vị cơ bản của món ăn",
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Column(
            children: [
              ...listTaste.map((taste) => Row(
                    children: [
                      Text(
                        "${taste['taste']}: ",
                        style: TextStyle(color: Colors.red, fontSize: 22),
                      ),
                      CustomIconButton(
                          backgroundColor: Colors.black.withOpacity(0.2),
                          icon: Icon(Icons.remove, size: 16),
                          onPressed: () => updateState('remove'),
                          margin: EdgeInsets.all(0)),
                      Text(
                        "cấp ${lv}",
                        style: TextStyle(fontSize: 18),
                      ),
                      CustomIconButton(
                          backgroundColor: Colors.black.withOpacity(0.2),
                          icon: Icon(
                            Icons.add,
                            size: 16,
                          ),
                          onPressed: () {
                            updateState("add");
                          },
                          margin: EdgeInsets.all(0)),
                      Text("${lv == 3 ? '(nguyên bản)' : ''}")
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget buildRecipe() {
    int counter = 0;
    return Container(
      margin: EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hướng dẫn",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 12,
          ),
          ...listRecipe.map((
            v,
          ) =>
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Bước ${++counter}"),
                    Container(
                      width: 170,
                      child: Material(
                        elevation: 10,
                        child: Image.network('${v['image']}'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "${v['description']}",
                        style: TextStyle(fontSize: 14),
                      ),
                    )
                  ],
                ),
              ))
          // Column(
          //   children: [
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [

          //       ],
          //     )
          //   ],
          // )
        ],
      ),
    );
  }

  Widget buildImage() {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: Image.network(
        'https://thuvienamthuc.vn/app_images/news/2020/6/30/cach-lam-ga-nuong-muoi-ot-ngon-800-153822.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildAppBar() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // MaterialPageRoute(builder: (context) => SecondScreen()),
                //  Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
              },
              margin: EdgeInsets.all(0),
            ),
            CustomIconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              onPressed: () => {},
              margin: EdgeInsets.all(0),
            )
          ],
        ),
      ),
    );
  }
}
