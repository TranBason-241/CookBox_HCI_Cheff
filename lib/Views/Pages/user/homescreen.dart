import 'package:carousel_pro/carousel_pro.dart';
import 'package:cookbookapp/Views/Pages/user/product_detail.dart';
import 'package:cookbookapp/Views/common/color.dart';
import 'package:cookbookapp/model/photo.dart';
import 'package:cookbookapp/Views/Pages/user/detailitem.dart';
import 'package:cookbookapp/Views/Pages/user/listitembasecat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cookbookapp/network/network_request.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  // static const routeName = "/homescreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> images = [
    'https://cf.shopee.vn/file/b19a4998332c28c3fe1014429f12b2c5',
    'https://cdn.chanhtuoi.com/uploads/2021/07/foodmap.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQD-qQL9OpIzo1logABt9hiMAEz0gpviVf8jA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRvabEVjmLblf-tX64eNpj6ZRtl_IH1weF_A&usqp=CAU',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: TextButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.fmd_good_outlined, color: Colors.white),
                  Text(
                    'TP. HCM',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white),
                ],
              )),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(
              Icons.local_mall_outlined,
            ),
          )
        ],
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
                decoration: InputDecoration(
              hintText: 'T??m ki???m s???n ph???m, c??ng th???c',
              prefixIcon: const Icon(Icons.search),
              // border:InputBorder.none,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.zero,
              filled: true,
              fillColor: Colors.white,
            )),
          ),
        ),
      ),
      body: Stack(
        children: [
          SafeArea(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(2))),
                    child: SizedBox(
                      height: 150.0,
                      width: double.infinity,
                      child: Carousel(
                        dotSpacing: 15.0,
                        dotSize: 6.0,
                        dotIncreasedColor: Colors.red,
                        dotBgColor: Colors.transparent,
                        indicatorBgPadding: 4.0,
                        dotPosition: DotPosition.bottomCenter,
                        dotHorizontalPadding: 5,
                        dotVerticalPadding: 5,
                        images: images
                            .map((e) => Container(
                                  child: Image.network(
                                    e,
                                    fit: BoxFit.cover,
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 13),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Gi???m Gi??',
                        style: TextStyle(
                          fontSize: 18,
                          wordSpacing: 2,
                          color: Colors.black87,
                          fontFamily: "sfuitext",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 10,
                                childAspectRatio: 3.5 / 6),
                        scrollDirection: Axis.vertical,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          ItemGridView(
                            image: Image.asset("assets/images/pack1.jpg"),
                            name: "V???t Kho M??ng T????i (?????p S???n)",
                            shortDes: "600Gr/Ph???n",
                            price: "49.000??",
                          ),
                          ItemGridView(
                            image: Image.asset("assets/images/pack2.jpg"),
                            name: "Ba R???i Heo Kho M???m Ru???c (?????p S???n)",
                            shortDes: "365Gr/Ph???n",
                            price: "65.000??",
                          ),
                          ItemGridView(
                            image: Image.asset("assets/images/pack3.jpg"),
                            name: "S?????n Non Heo Rim T??m Th??? (?????p S???n)",
                            shortDes: "575Gr/Ph???n",
                            price: "135.000??",
                          ),
                          ItemGridView(
                            image: Image.asset("assets/images/pack4.jpg"),
                            name: "????i G?? G??c T?? Kho S??? ???t (?????p S???n)",
                            shortDes: "575Gr/Ph???n",
                            price: "39.000??",
                          ),
                          ItemGridView(
                            image: Image.asset("assets/images/pack5.jpg"),
                            name: "V??? Kho G???ng (?????p S???n)",
                            shortDes: "575Gr/Ph???n",
                            price: "59.000??",
                          ),
                          ItemGridView(
                            image: Image.asset("assets/images/pack6.jpg"),
                            name: "C?? K??o Kho Ti??u (?????p S???n) ",
                            shortDes: "265Gr/Ph???n",
                            price: "49.000??",
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 20),
                        child: Container(
                            width: 400.0,
                            height: 45.0,
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  primary: Colors.blue,
                                  side: const BorderSide(color: Colors.blue),
                                ),
                                child: const Text('Xem th??m'),
                                onPressed: () => {
                                      Navigator.pushReplacementNamed(context,
                                          Product_detail_page.routeName),
                                    },
                                onLongPress: () => {})),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 13),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'M??n ??n B??n Ch???y',
                        style: TextStyle(
                          fontSize: 18,
                          wordSpacing: 2,
                          color: Colors.black87,
                          fontFamily: "sfuitext",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 10,
                                childAspectRatio: 3.5 / 6),
                        scrollDirection: Axis.vertical,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          ItemGridView(
                            image: Image.asset("assets/images/pack1.jpg"),
                            name: "V???t Kho M??ng T????i (?????p S???n)",
                            shortDes: "600Gr/Ph???n",
                            price: "49.000??",
                          ),
                          ItemGridView(
                            image: Image.asset("assets/images/pack2.jpg"),
                            name: "Ba R???i Heo Kho M???m Ru???c (?????p S???n)",
                            shortDes: "365Gr/Ph???n",
                            price: "65.000??",
                          ),
                          ItemGridView(
                            image: Image.asset("assets/images/pack3.jpg"),
                            name: "S?????n Non Heo Rim T??m Th??? (?????p S???n)",
                            shortDes: "575Gr/Ph???n",
                            price: "135.000??",
                          ),
                          ItemGridView(
                            image: Image.asset("assets/images/pack4.jpg"),
                            name: "????i G?? G??c T?? Kho S??? ???t (?????p S???n)",
                            shortDes: "575Gr/Ph???n",
                            price: "39.000??",
                          ),
                          ItemGridView(
                            image: Image.asset("assets/images/pack5.jpg"),
                            name: "V??? Kho G???ng (?????p S???n)",
                            shortDes: "575Gr/Ph???n",
                            price: "59.000??",
                          ),
                          ItemGridView(
                            image: Image.asset("assets/images/pack6.jpg"),
                            name: "C?? K??o Kho Ti??u (?????p S???n) ",
                            shortDes: "265Gr/Ph???n",
                            price: "49.000??",
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 20),
                        child: Container(
                            width: 400.0,
                            height: 45.0,
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  primary: Colors.blue,
                                  side: const BorderSide(color: Colors.blue),
                                ),
                                child: const Text('Xem th??m'),
                                onPressed: () => {
                                      Navigator.pushReplacementNamed(context,
                                          Product_detail_page.routeName),
                                    },
                                onLongPress: () => {})),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'M??n ??n D??? N???u',
                        style: TextStyle(
                          fontSize: 18,
                          wordSpacing: 2,
                          color: Colors.black87,
                          fontFamily: "sfuitext",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 10,
                                childAspectRatio: 3.5 / 6),
                        scrollDirection: Axis.vertical,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          ItemGridView(
                            image: Image.asset("assets/images/vit1.jpg"),
                            name: "V???t Kho M??ng T????i (?????p S???n)",
                            shortDes: "600Gr/Ph???n",
                            price: "49.000??",
                          ),
                          ItemGridView(
                            image: Image.asset("assets/images/vit2.jpg"),
                            name: "Th???t V???t Xi??m (Ch???t S???n)",
                            shortDes: "500Gr/Ph???n",
                            price: "49.000??",
                          ),
                          ItemGridView(
                            image: Image.asset("assets/images/vit3.jpg"),
                            name: "????i G?? G??c T?? Kho S??? ???t (?????p S???n)",
                            shortDes: "575Gr/Ph???n",
                            price: "39.000??",
                          ),
                          ItemGridView(
                            image: Image.asset("assets/images/vit4.jpg"),
                            name: "C??nh G?? Nh???p Kh???u",
                            shortDes: "500-600Gr/Ph???n",
                            price: "39.000??",
                          ),
                          ItemGridView(
                            image: Image.asset("assets/images/vit5.jpg"),
                            name: "L??ng G?? L??m S???ch",
                            shortDes: "200Gr/Ph???n",
                            price: "9.000??",
                          ),
                          ItemGridView(
                            image: Image.asset("assets/images/vit6.jpg"),
                            name: "???c G?? Nh???p Kh???u ",
                            shortDes: "400Gr/Ph???n",
                            price: "39.000??",
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 20),
                        child: Container(
                            width: 400.0,
                            height: 45.0,
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  primary: Colors.blue,
                                  side: const BorderSide(color: Colors.blue),
                                ),
                                child: const Text('Xem th??m'),
                                onPressed: () => {
                                      Navigator.pushReplacementNamed(context,
                                          Product_detail_page.routeName),
                                    },
                                onLongPress: () => {})),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Th???t B?? & D??',
                        style: TextStyle(
                          fontSize: 18,
                          wordSpacing: 2,
                          color: Colors.black87,
                          fontFamily: "sfuitext",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 10,
                                childAspectRatio: 3.5 / 6),
                        scrollDirection: Axis.vertical,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          ItemGridView(
                            image: Image.asset("assets/images/bo1.jpg"),
                            name: "Ch??? B?? G??n ???t Chanh",
                            shortDes: "600Gr/Ph???n",
                            price: "159.000??",
                          ),
                          ItemGridView(
                            image: Image.asset("assets/images/bo2.jpg"),
                            name: "Phi L?? B?? T?? C??? Chi",
                            shortDes: "600Gr/Ph???n",
                            price: "199.000??",
                          ),
                          ItemGridView(
                            image: Image.asset("assets/images/bo3.jpg"),
                            name: "????i G?? G??c T?? Kho S??? ???t (?????p S???n)",
                            shortDes: "575Gr/Ph???n",
                            price: "39.000??",
                          ),
                          ItemGridView(
                            image: Image.asset("assets/images/bo4.jpg"),
                            name: "N???m B?? ??c Nh???p Kh???u",
                            shortDes: "200Gr/Ph???n",
                            price: "64.000??",
                          ),
                          ItemGridView(
                            image: Image.asset("assets/images/bo5.jpg"),
                            name: "Th??n B?? ??c C???t L??c L???c",
                            shortDes: "200Gr/Ph???n",
                            price: "151.000??",
                          ),
                          ItemGridView(
                            image: Image.asset("assets/images/bo6.jpg"),
                            name: "B???p B?? T?? C??? Chi",
                            shortDes: "500Gr/Ph???n",
                            price: "189.000??",
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 20),
                        child: Container(
                            width: 400.0,
                            height: 45.0,
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  primary: Colors.blue,
                                  side: const BorderSide(color: Colors.blue),
                                ),
                                child: const Text('Xem th??m'),
                                onPressed: () => {
                                      Navigator.pushReplacementNamed(context,
                                          Product_detail_page.routeName),
                                    },
                                onLongPress: () => {})),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.water_damage_sharp,
                          // color: currentTab == 0 ? Colors.red : Colors.grey,
                        ),
                        Text(
                          'Trang ch???',
                          style: TextStyle(
                              // color: currentTab == 0 ? Colors.black : Colors.grey,
                              ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      // setState(() {
                      //   currentScreen = const Chat();
                      //   currentTab = 1;
                      // });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.local_mall_outlined,
                          // color: currentTab == 1 ? Colors.red : Colors.grey,
                        ),
                        Text(
                          '????n h??ng',
                          style: TextStyle(
                              // color: currentTab == 1 ? Colors.black : Colors.grey,
                              ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.circle_notifications_rounded,
                          // color: currentTab == 2 ? Colors.red : Colors.grey,
                        ),
                        Text(
                          'Th??ng b??o',
                          style: TextStyle(
                              // color: currentTab == 2 ? Colors.black : Colors.grey,
                              ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      // setState(() {
                      //   currentScreen = const Setting();
                      //   currentTab = 3;
                      // });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.perm_identity_outlined,
                          // color: currentTab == 3 ? Colors.red : Colors.grey,
                        ),
                        Text(
                          'T??i kho???n',
                          style: TextStyle(
                              // color: currentTab == 3 ? Colors.black : Colors.grey,
                              ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemGridView extends StatelessWidget {
  const ItemGridView({
    Image? image,
    String? name,
    String? shortDes,
    String? price,
    Key? key,
  })  : imgae = image,
        name = name,
        shortDes = shortDes,
        price = price,
        super(key: key);

  final Image? imgae;
  final String? name;
  final String? shortDes;
  final String? price;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 450,
        width: double.infinity,
        child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.popAndPushNamed(
                      context, Product_detail_page.routeName);
                },
                // child: Image.network(
                //   'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
                // ),
                child: imgae),
            const SizedBox(
              height: 5,
            ),
            Flexible(
                child: RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    text: TextSpan(
                      text: name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        wordSpacing: 0.2,
                        letterSpacing: 0.3,
                        // fontWeight: FontWeight.w450,
                      ),
                    ))),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  // '500-550Gr/Ph???n',
                  shortDes!,
                  style: TextStyle(
                    color: AppColor.placeholder,
                    fontSize: 10,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$price',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    wordSpacing: 0.2,
                    letterSpacing: 0.3,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(Icons.add_circle_outlined, size: 25, color: AppColor.redd),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//mon an dc dat nhieu nhat
//mon an de dang che bien nhat
//