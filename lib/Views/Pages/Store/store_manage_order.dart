import 'package:cookbookapp/Views/Pages/Store/store_order_detail.dart';
import 'package:cookbookapp/Views/Pages/user/product_detail.dart';
import 'package:cookbookapp/Views/common/constants.dart';
import 'package:cookbookapp/Views/common/custom_icon_button.dart';
import 'package:cookbookapp/model/dish.dart';
import 'package:cookbookapp/model/ingredient.dart';
import 'package:cookbookapp/model/order.dart';
import 'package:cookbookapp/model/recipeStep.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';

class StoreManageOrder extends StatefulWidget {
  @override
  _StoreManageOrderState createState() => _StoreManageOrderState();
  static const routeName = '/manageOrder';
}

class _StoreManageOrderState extends State<StoreManageOrder> {
  List cate = [
    {'name': 'Tất cả', 'active': true},
    {'name': 'Đã hoàn thành', 'active': false},
    {'name': 'Chưa hoàn thành', 'active': false},
    {'name': 'Đã hủy', 'active': false},
  ];
  String seletedCate = 'Tất cả';
  List orderList1 = [];

  @override
  void initState() {
    List<Ingredient> listIng = [
      Ingredient(id: 1, name: 'ớt', value: 30),
      Ingredient(id: 2, name: 'gà', value: 1500),
      Ingredient(id: 3, name: 'muối', value: 200),
      Ingredient(id: 4, name: 'lá chanh', value: 50),
      Ingredient(id: 4, name: 'lá tiêu', value: 30),
    ];
    List<RecipeStep> recipe = [
      RecipeStep(
          id: '1',
          picture:
              'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/uop-ga-cung-gia-vi.jpg',
          desc:
              'bạn trộn nước xốt ướp gà theo công thức: 2 muỗng canh nước mắm, 1 muỗng cà phê muối, 2 muỗng canh dầu ăn, 2 muỗng cà phê đường, 1 muỗng cà phê bột ngọt, 1/2 muỗng cà phê tiêu, 4 trái ớt giã nhuyễn, khuấy đều.'),
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
    ];
    Dish dish = Dish(
        id: '1',
        name: 'Gà Nướng',
        price: 200,
        category: 'Gà',
        image: '',
        des: 'ngon lam',
        numOfPer: 4,
        nutrient: 'sss',
        status: true,
        parentID: 'id',
        rating: 5,
        recipe: [
          RecipeStep(
              id: '1',
              picture:
                  'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/uop-ga-cung-gia-vi.jpg',
              desc:
                  'bạn trộn nước xốt ướp gà theo công thức: 2 muỗng canh nước mắm, 1 muỗng cà phê muối, 2 muỗng canh dầu ăn, 2 muỗng cà phê đường, 1 muỗng cà phê bột ngọt, 1/2 muỗng cà phê tiêu, 4 trái ớt giã nhuyễn, khuấy đều.'),
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
          Ingredient(id: 1, name: 'ớt', value: 30),
          Ingredient(id: 2, name: 'gà', value: 1500),
          Ingredient(id: 3, name: 'muối', value: 200),
          Ingredient(id: 4, name: 'lá chanh', value: 50),
          Ingredient(id: 4, name: 'lá tiêu', value: 30),
        ]
        //
        );

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
              Ingredient(id: 1, name: 'ớt', value: 30),
              Ingredient(id: 2, name: 'gà', value: 1500),
              Ingredient(id: 3, name: 'muối', value: 200),
              Ingredient(id: 4, name: 'lá chanh', value: 50),
              Ingredient(id: 4, name: 'lá tiêu', value: 30),
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
              Ingredient(id: 10, name: 'Bí đỏ', value: 500),
              Ingredient(id: 11, name: 'Thịt băm', value: 200),
              Ingredient(id: 13, name: 'Hành lá', value: 30),
              Ingredient(id: 14, name: 'Cần tàu', value: 10),
              Ingredient(id: 15, name: 'Đường trắng', value: 15),
              Ingredient(id: 16, name: 'Hạt nêm', value: 30),
              Ingredient(id: 17, name: 'Nước mắm', value: 15),
              Ingredient(id: 18, name: 'Tiêu', value: 5),
              Ingredient(id: 19, name: 'Dầu ăn', value: 15),
            ]
            //
            )
      ],
    );
    Order order3 = Order(
      storeId: '1',
      userId: '1',
      orderId: '008',
      time: DateTime.parse("2021-10-06 09:35:50"),
      address: '12 Trần Nhân Tông',
      price: 210000,
      payment: 'tiền mặt',
      userName: 'Trần Văn Luân',
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
              Ingredient(id: 1, name: 'ớt', value: 30),
              Ingredient(id: 2, name: 'gà', value: 1500),
              Ingredient(id: 3, name: 'muối', value: 200),
              Ingredient(id: 4, name: 'lá chanh', value: 50),
              Ingredient(id: 4, name: 'lá tiêu', value: 30),
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
              Ingredient(id: 10, name: 'Bí đỏ', value: 500),
              Ingredient(id: 11, name: 'Thịt băm', value: 200),
              Ingredient(id: 13, name: 'Hành lá', value: 30),
              Ingredient(id: 14, name: 'Cần tàu', value: 10),
              Ingredient(id: 15, name: 'Đường trắng', value: 15),
              Ingredient(id: 16, name: 'Hạt nêm', value: 30),
              Ingredient(id: 17, name: 'Nước mắm', value: 15),
              Ingredient(id: 18, name: 'Tiêu', value: 5),
              Ingredient(id: 19, name: 'Dầu ăn', value: 15),
            ]
            //
            )
      ],
    );

    Order order2 = Order(
      storeId: '1',
      userId: '1',
      orderId: '009',
      time: DateTime.parse("2021-10-06 08:50:50"),
      address: '50 Cộng Hòa',
      price: 470000,
      payment: 'tiền mặt',
      userName: 'Chí Cường',
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
              Ingredient(id: 1, name: 'ớt', value: 30),
              Ingredient(id: 2, name: 'gà', value: 1500),
              Ingredient(id: 3, name: 'muối', value: 200),
              Ingredient(id: 4, name: 'lá chanh', value: 50),
              Ingredient(id: 4, name: 'lá tiêu', value: 30),
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
              Ingredient(id: 10, name: 'Bí đỏ', value: 500),
              Ingredient(id: 11, name: 'Thịt băm', value: 200),
              Ingredient(id: 13, name: 'Hành lá', value: 30),
              Ingredient(id: 14, name: 'Cần tàu', value: 10),
              Ingredient(id: 15, name: 'Đường trắng', value: 15),
              Ingredient(id: 16, name: 'Hạt nêm', value: 30),
              Ingredient(id: 17, name: 'Nước mắm', value: 15),
              Ingredient(id: 18, name: 'Tiêu', value: 5),
              Ingredient(id: 19, name: 'Dầu ăn', value: 15),
            ]
            //
            )
      ],
    );

    Order order4 = Order(
      storeId: '1',
      userId: '1',
      orderId: '010',
      time: DateTime.parse("2021-10-06 07:30:50"),
      address: '45 Tân Quý',
      price: 1470000,
      payment: 'tiền mặt',
      userName: 'Tiến Trần',
      orderStatus: 2,
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
              Ingredient(id: 1, name: 'ớt', value: 30),
              Ingredient(id: 2, name: 'gà', value: 1500),
              Ingredient(id: 3, name: 'muối', value: 200),
              Ingredient(id: 4, name: 'lá chanh', value: 50),
              Ingredient(id: 4, name: 'lá tiêu', value: 30),
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
              Ingredient(id: 10, name: 'Bí đỏ', value: 500),
              Ingredient(id: 11, name: 'Thịt băm', value: 200),
              Ingredient(id: 13, name: 'Hành lá', value: 30),
              Ingredient(id: 14, name: 'Cần tàu', value: 10),
              Ingredient(id: 15, name: 'Đường trắng', value: 15),
              Ingredient(id: 16, name: 'Hạt nêm', value: 30),
              Ingredient(id: 17, name: 'Nước mắm', value: 15),
              Ingredient(id: 18, name: 'Tiêu', value: 5),
              Ingredient(id: 19, name: 'Dầu ăn', value: 15),
            ]
            //
            )
      ],
    );

Order order5 = Order(
      storeId: '1',
      userId: '1',
      orderId: '011',
      time: DateTime.parse("2021-10-06 06:30:50"),
      address: '145 Trần Quốc Tuấn',
      price: 2470000,
      payment: 'tiền mặt',
      userName: 'Văn Sáng',
      orderStatus: 3,
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
              Ingredient(id: 1, name: 'ớt', value: 30),
              Ingredient(id: 2, name: 'gà', value: 1500),
              Ingredient(id: 3, name: 'muối', value: 200),
              Ingredient(id: 4, name: 'lá chanh', value: 50),
              Ingredient(id: 4, name: 'lá tiêu', value: 30),
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
              Ingredient(id: 10, name: 'Bí đỏ', value: 500),
              Ingredient(id: 11, name: 'Thịt băm', value: 200),
              Ingredient(id: 13, name: 'Hành lá', value: 30),
              Ingredient(id: 14, name: 'Cần tàu', value: 10),
              Ingredient(id: 15, name: 'Đường trắng', value: 15),
              Ingredient(id: 16, name: 'Hạt nêm', value: 30),
              Ingredient(id: 17, name: 'Nước mắm', value: 15),
              Ingredient(id: 18, name: 'Tiêu', value: 5),
              Ingredient(id: 19, name: 'Dầu ăn', value: 15),
            ]
            //
            )
      ],
    );

    orderList1.add(order1);
    orderList1.add(order2);
    orderList1.add(order3);
    orderList1.add(order4);
    orderList1.add(order5);
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

  List orderList = [
    {
      'name': 'Trần Bá Sơn',
      'address': '216 Tân Kỳ Tân Quý, Tân Phú',
      'price': '420000',
      'time': '${DateTime.now().toString()}',
      'orderCode': '001',
      'status': '2'
    },
    {
      'name': 'Hồ Cẩm Đào',
      'address': '14/9/38 Tân Kỳ Tân Quý, Tân Phú',
      'price': '120000',
      'time': '2021-09-23 08:41:21',
      'orderCode': '002',
      'status': '2'
    },
    {
      'name': 'Nguyễn Đăng Sáng',
      'address': '14/9/38 Tân Kỳ Tân Quý, Tân Phú',
      'price': '130000',
      'time': '2021-09-23 08:41:21',
      'orderCode': '003',
      'status': '2'
    },
    {
      'name': 'Lê Tấn Trường',
      'address': '14/9/38 Tân Kỳ Tân Quý, Tân Phú',
      'price': '120000',
      'time': '2021-09-23 08:41:21',
      'orderCode': '004',
      'status': '3'
    },
    {
      'name': 'Trần Văn Luân',
      'address': '14/9/38 Tân Kỳ Tân Quý, Tân Phú',
      'price': '120000',
      'time': '2021-09-23 08:41:21',
      'orderCode': '005',
      'status': '1'
    },
    {
      'name': 'Hồ Văn Chí',
      'address': '14/9/38 Tân Kỳ Tân Quý, Tân Phú',
      'price': '120000',
      'time': '2021-09-23 08:41:21',
      'orderCode': '006',
      'status': '1'
    }
  ];

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
              margin: EdgeInsets.only(top: 10, left: 40),
              child: Text(
                "Quản Lý Đơn Hàng",
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
                    labelText: "Mã đơn hàng"),
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
              height: 500,
              margin: EdgeInsets.only(top: 10),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: orderList1.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Order_item(
                    status: orderList1[index].orderStatus,
                    name: orderList1[index].userName,
                    price: orderList1[index].price,
                    address: orderList1[index].address,
                    orderCode: orderList1[index].orderId,
                    time: orderList1[index].time,
                    searchCate: seletedCate,
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

class Order_item extends StatelessWidget {
  final String name;
  final String address;
  final double price;
  final DateTime time;
  final String orderCode;
  final int status;
  final String searchCate;
  const Order_item(
      {Key? key,
      required this.name,
      required this.address,
      required this.price,
      required this.time,
      required this.orderCode,
      required this.status,
      required this.searchCate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lay Mau
    Function getColor = () {
      const Color = Colors.red;
      if (status == 1) {
        const Color = Colors.yellow;
        return Color;
      } else if (status == 2) {
        const Color = Colors.green;
        return Color;
      } else if (status == 3) {
        const Color = Colors.red;
        return Color;
      }
    };
    //Lay text

    Function getStatus = () {
      String textStatus = 'sss';
      if (status == 1) {
        textStatus = 'Chưa Hoàn Thành';
        return textStatus;
      } else if (status == 2) {
        textStatus = 'Đã Hoàn Thành';
        return textStatus;
      } else if (status == 3) {
        textStatus = 'Đã Hủy';
        return textStatus;
      }
    };

    int selectedCate = 0;
    if (searchCate.compareTo('Tất cả') == 0) {
      selectedCate = 0;
    } else if (searchCate.compareTo('Chưa hoàn thành') == 0) {
      selectedCate = 1;
    } else if (searchCate.compareTo('Đã hủy') == 0) {
      selectedCate = 3;
      print('da huy');
    } else if (searchCate.compareTo('Đã hoàn thành') == 0) {
      selectedCate = 2;
    }

    if (selectedCate == 0) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StoreOderDetail()),
          );
        },
        child: Container(
          height: 70,
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
                height: 70,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 5,
                      child: Text("$name", style: TextStyle(fontSize: 14)),
                    ),
                    Positioned(
                        top: 17,
                        left: 5,
                        child: Text(
                          "$time",
                          style: TextStyle(fontSize: 12),
                        )),
                    Positioned(
                        top: 31,
                        left: 5,
                        child: Text(
                          "$address",
                          style: TextStyle(fontSize: 12),
                        )),
                    Positioned(
                        top: 47,
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
                    borderRadius: BorderRadius.circular(20), color: getColor()),
                width: 130,
                height: 70,
                child: Container(
                    child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    getStatus(),
                    style: TextStyle(fontSize: 12),
                  ),
                )),
              )
            ],
          ),
        ),
      );
    } else if (status == selectedCate) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StoreOderDetail()),
          );
        },
        child: Container(
          height: 70,
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
                      top: 0,
                      left: 5,
                      child: Text("$name", style: TextStyle(fontSize: 14)),
                    ),
                    Positioned(
                        top: 17,
                        left: 5,
                        child: Text(
                          "$time",
                          style: TextStyle(fontSize: 12),
                        )),
                    Positioned(
                        top: 31,
                        left: 5,
                        child: Text(
                          "$address",
                          style: TextStyle(fontSize: 12),
                        )),
                    Positioned(
                        top: 47,
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
                    borderRadius: BorderRadius.circular(20), color: getColor()),
                width: 130,
                height: 70,
                child: Container(
                    child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    getStatus(),
                    style: TextStyle(fontSize: 12),
                  ),
                )),
              )
            ],
          ),
        ),
      );
    }
    return Text('');
  }
}
