import 'package:cookbookapp/Views/Pages/user/product_detail.dart';
import 'package:cookbookapp/Views/common/constants.dart';
import 'package:cookbookapp/Views/common/custom_icon_button.dart';
import 'package:cookbookapp/model/dish.dart';
import 'package:cookbookapp/model/ingredient.dart';
import 'package:cookbookapp/model/order.dart';
import 'package:cookbookapp/model/recipeStep.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoreOderDetail extends StatefulWidget {
  @override
  _StoreOderDetailState createState() => _StoreOderDetailState();
  static const routeName = '/orderDetail';
}

class _StoreOderDetailState extends State<StoreOderDetail> {
  TextEditingController customController = new TextEditingController();

//alert
  String dropdownValue = 'Sự cố ngoài ý muốn';
  String dropdownValue2 = 'Gà nướng';
  int testHuy = 2;
  // GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Future<int> ShowInformationDialog(BuildContext context, orderID) async {
    return await showDialog(
        context: context,
        builder: (context) {
          final TextEditingController _textEditingController =
              new TextEditingController();
          bool? isChecked = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Text(
                'Hủy đơn hàng $orderID !',
                style: TextStyle(color: Colors.red),
              ),
              content: Container(
                height: 160,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text('Chọn lí do:')),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>[
                        'Sự cố ngoài ý muốn',
                        'Không đủ nguyên liệu'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    dropdownValue.compareTo('Không đủ nguyên liệu') == 0
                        ? DropdownButton<String>(
                            value: dropdownValue2,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue2 = newValue!;
                              });
                            },
                            items: <String>[
                              'Gà nướng',
                              'Canh Bí Đỏ',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )
                        : Container()
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
                  child: Text('Xác Nhận'),
                  elevation: 5,
                )
              ],
            );
          });
        });
  }

  Order order1 = Order(
    storeId: '1',
    userId: '1',
    orderId: '006',
    time: DateTime.parse("2021-09-23 08:41:21"),
    address: '251 Tân Kỳ Tân Quý',
    price: 470000,
    payment: 'tiền mặt',
    userName: 'Trần Bá Sơn',
    orderStatus: 1,
    listDish: [
      Dish(
          id: '1',
          name: 'Gà Nướng',
          price: 200,
          category: 'Gà',
          image: '',
          des: 'gà nướng ngon mê ly khiến người ăn xuýt xoa tán thưởng.',
          numOfPer: 4,
          nutrient: '1200',
          status: true,
          parentID: '1',
          rating: 5,
          recipe: [
            RecipeStep(
                id: '1',
                picture:
                    'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/uop-ga-cung-gia-vi.jpg',
                desc: 'Trộn ớt, muối lá chanh, tiêu đều với gà'),
            RecipeStep(
                id: '2',
                picture:
                    'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/nuong-ga.jpg',
                desc:
                    'Sau khoảng thời gian ướp, bạn lấy gà ra ngoài, đặt lên vỉ nướng trên bếp than hoa. Mẹo nhỏ trong cách làm gà nướng muối ớt mà không phải ai cũng biết là bạn nên nướng gà với lửa nhỏ, vì lửa lớn rất dễ làm lớp da bên ngoài bị cháy còn thịt bên trong còn sống.'),
            RecipeStep(
                id: '1',
                picture:
                    'https://thuvienamthuc.vn/app_images/news/2020/6/30/cach-lam-ga-nuong-muoi-ot-ngon-800-153822.jpg',
                desc: 'Trình Bày Và Thưởng Thức'),
          ],
          listIng: [
            Ingredient(id: 1, name: 'ớt: 30g', value: 30),
            Ingredient(id: 2, name: 'gà ta: 1500g', value: 1500),
            Ingredient(id: 3, name: 'muối: 30g', value: 200),
            Ingredient(id: 4, name: 'lá chanh: 10g', value: 50),
            Ingredient(id: 4, name: 'tiêu: 10g', value: 30),
            Ingredient(id: 4, name: 'dầu ăn: 50ml', value: 30),
          ]
          //
          ),
      Dish(
          id: '2',
          name: 'Canh bí đỏ',
          price: 170,
          category: 'Canh',
          image: '',
          des:
              'Canh bí đỏ thịt bằm không chỉ là món ngon dễ làm mà còn bổ dưỡng, tốt cho mắt. Cách nấu canh bí đỏ thịt bằm đơn giản có bí chín mềm, bùi bùi, thịt băm béo béo, nước canh bí ngọt thị tự nhiên, rất hấp dẫn.',
          numOfPer: 4,
          nutrient: '1600',
          status: true,
          parentID: '2',
          rating: 4,
          recipe: [
            RecipeStep(
                id: '10',
                picture:
                    'https://image.cooky.vn/recipe/g3/20486/s640/recipe20486-prepare-step1-636352841728994665.jpg',
                desc:
                    'Phi thơm 20gr đầu hành băm nhuyễn cùng với 1 muỗng canh dầu ăn, cho 200gr thịt băm vào, nêm 1 muỗng canh đường, 1 muỗng canh hạt nêm, 1 muỗng canh nước mắm và 1 muỗng cà phê tiêu.'),
            RecipeStep(
                id: '11',
                picture:
                    'https://image.cooky.vn/recipe/g3/20486/s640/recipe20486-prepare-step2-636352841812922812.jpg',
                desc:
                    'Xào cho thịt băm vừa chín thì thêm vào 1 lít nước, khuấy đều. Tiếp theo cho thêm bí đỏ cắt lát, đậy nắp, mở lửa to. Nấu canh bí đỏ thịt bằm trong khoảng 15 phút cho bí chín mềm.'),
            RecipeStep(
                id: '12',
                picture:
                    'https://image.cooky.vn/recipe/g3/20486/s640/recipe20486-prepare-step3-636352841923371006.jpg',
                desc:
                    'au khi canh bí đỏ thịt bằm được hầm mềm, mở nắp nêm 1 muỗng canh hạt nêm, thêm hành cần cắt nhỏ vào khuấy đều, tắt bếp.'),
            RecipeStep(
                id: '13',
                picture:
                    'https://image.cooky.vn/recipe/g3/20486/s640/recipe20486-prepare-step4-636353090726251106.jpg',
                desc:
                    'Cách nấu canh bí đỏ thịt bằm "dễ ợt" đúng không. Canh bí đỏ thịt bằm với hương vị đậm đà, đơn giản, dễ nấu và chứa rất nhiều chất dinh dưỡng tốt cho cơ thể. Đồng thời bí đỏ còn tốt cho trí não nữa đấy, những ngày nào quá bận rộn thì hãy chuẩn bị cho mình một chén canh bí đỏ để tẩm bổ nhé. Cách nấu canh bí đỏ thịt bằm quá đơn giản và nhanh gọn đúng không, cùng mình làm cho gia đình thưởng thức nhé!!'),
          ],
          listIng: [
            Ingredient(id: 10, name: 'Bí đỏ: 400g', value: 500),
            Ingredient(id: 11, name: 'Thịt băm: 150g', value: 200),
            Ingredient(id: 13, name: 'Hành lá: 40g', value: 30),
            Ingredient(id: 14, name: 'Cần tàu: 50g', value: 10),
            Ingredient(id: 15, name: 'Đường trắng: 30g', value: 15),
            Ingredient(id: 16, name: 'Hạt nêm: 30g', value: 30),
            Ingredient(id: 17, name: 'Nước mắm: 20ml', value: 15),
            Ingredient(id: 18, name: 'Tiêu: 5g', value: 5),
            Ingredient(id: 19, name: 'Dầu ăn: 20ml', value: 15),
          ]
          //
          )
    ],
  );

//Done order
// Function clickToDone = (){
//   this.setState(() {

//   });
// };

//hander Button canner order

  @override
  Widget build(BuildContext context) {
    Function handleCannerButton = (int orderStatus) {
      if (orderStatus == 3) {
        return RaisedButton(
          child: Text(
            'ĐƠN ĐÃ HỦY',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {},
          color: Colors.red,
        );
      } else if (orderStatus == 1) {
        return RaisedButton(
            child: Text(
              'ĐÃ XONG',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              setState(() {
                order1.orderStatus = 2;
              });
            },
            color: Colors.green);
      } else if (orderStatus == 2) {
        return RaisedButton(
            child: Text(
              'ĐÃ XONG',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
            color: Colors.green);
      }
      ;
    };
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
              padding: EdgeInsets.only(left: 2, bottom: 16),
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
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      "CHI TIẾT ĐƠN HÀNG",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                  ),
                  //chi tiet don hang
                  Container(
                    width: 400,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.red.withOpacity(0.7), width: 2)),
                    // color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height: 100,
                            width: 375,
                            color: Colors.red.withOpacity(0.8),
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mã Đơn: ${order1.orderId}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    '${order1.time}',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    '${order1.userName}',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    '${order1.address}',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            )),
                        //List dist
                        Container(
                          width: 350,
                          child: buildDish(
                            listDish: order1.listDish,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            child: RaisedButton(
                          color: Colors.yellow,
                          onPressed: () {},
                          child: Text('BẮT ĐẦU NẤU'),
                        )),
                        Container(
                            margin: EdgeInsets.only(right: 10, left: 10),
                            child: (order1.orderStatus != 3 &&
                                    order1.orderStatus != 2)
                                ? RaisedButton(
                                    child: Text(
                                      'BÁO HỦY',
                                      style: TextStyle(color: Colors.yellow),
                                    ),
                                    onPressed: () {
                                      ShowInformationDialog(
                                              context, order1.orderId)
                                          .then((value) {
                                        if (value == 1) {
                                          showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              title: const Text(
                                                'Bạn có chắc chắn muốn hủy đơn hàng này?',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'OK'),
                                                  child: const Text(
                                                    'Không',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      order1.orderStatus = 3;
                                                    });
                                                    Navigator.pop(
                                                        context, 'OK');
                                                  },
                                                  child: const Text(
                                                    'Đồng ý',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                      });
                                    },
                                    color: Colors.red,
                                  )
                                : Text('')),
                        handleCannerButton(order1.orderStatus)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class buildDish extends StatelessWidget {
  final List listDish;
  const buildDish({Key? key, required this.listDish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370,
      width: 400,
      padding: EdgeInsets.only(top: 10),
      child: ListView.builder(
          itemCount: listDish.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              margin: EdgeInsets.only(bottom: 20),

              width: 300,
              // height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${index + 1}. ${listDish[index].name}',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                    ),
                    Text("Số lượng: 1"),
                    Text(
                      "Nguyên liệu:",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    ...listDish[index].listIng.map((a) => Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text('${a.name}'))
                          ],
                        ))
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class Order_item extends StatelessWidget {
  final String name;
  final String address;
  final double price;
  final DateTime time;
  final String orderCode;

  const Order_item(
      {Key? key,
      required this.name,
      required this.address,
      required this.price,
      required this.time,
      required this.orderCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Product_detail_page()),
        );
      },
      child: Container(
        height: 80,
        margin: EdgeInsets.only(bottom: 10, top: 10),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 200,
              height: 60,
              child: Stack(
                children: [
                  Positioned(
                    top: -6,
                    left: 5,
                    child: Text("$name", style: TextStyle(fontSize: 14)),
                  ),
                  Positioned(
                      top: 12,
                      left: 5,
                      child: Text(
                        "$time",
                        style: TextStyle(fontSize: 12),
                      )),
                  Positioned(
                      top: 29,
                      left: 5,
                      child: Text(
                        "$address",
                        style: TextStyle(fontSize: 12),
                      )),
                  Positioned(
                      top: 46,
                      left: 5,
                      child: Text(
                        "Mã đơn hàng: $orderCode",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red.withOpacity(0.5),
              ),
              width: 130,
              height: 70,
              child: Container(
                  padding: EdgeInsets.only(left: 25, top: 20),
                  child: Text(
                    '$priceđ',
                    style: TextStyle(fontSize: 18),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
