import 'dart:ffi';

import 'package:cookbookapp/Views/common/custom_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class StoreEmp extends StatefulWidget {
  @override
  _StoreEmpState createState() => _StoreEmpState();
}

class _StoreEmpState extends State<StoreEmp> {
  CalendarController? _controller;
  TextStyle dayStyle(FontWeight fontWeight) {
    return TextStyle(color: Color(0xff30384c), fontWeight: fontWeight);
  }

  Container taskList(String name, String desciption, String roll, time,
      IconData iconImg, Color colorIcon) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        children: <Widget>[
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 10),
            // width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 170,
                      // color: Colors.red,
                      child: Text(
                        name,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 60,
                          child: Text(
                            time,
                            style: TextStyle(
                                fontSize: 15,
                                // fontWeight: FontWeight.bold,
                                color: Colors.red.withOpacity(0.7)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Icon(
                            iconImg,
                            color: colorIcon,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              desciption,
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  roll,
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 70,
              ),
              Text(
                'Lịch làm việc',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomIconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 22,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    margin: EdgeInsets.all(0),
                    backgroundColor: Color(0xff30384c),
                  ),
                ],
              ),
              TableCalendar(
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  calendarStyle: CalendarStyle(
                      weekdayStyle: dayStyle(FontWeight.normal),
                      weekendStyle: dayStyle(FontWeight.normal),
                      selectedColor: Colors.red.withOpacity(0.7),
                      todayColor: Colors.red),
                  daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                          color: Color(0xff30384c),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      weekendStyle: TextStyle(
                          color: Color(0xff30384c),
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleTextStyle: TextStyle(
                          color: Color(0xff30384c),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  calendarController: _controller),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 30),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular((30)),
                      topRight: Radius.circular((30))),
                  color: Color(0xff30384c),
                ),
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 0),
                          child: Text(
                            'Hôm nay',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        taskList(
                            'Lê Văn Lượng',
                            '',
                            'Quản lí',
                            'cả ngày',
                            CupertinoIcons.check_mark_circled_solid,
                            Color(0xff00cf8d)),
                        taskList(
                            'Huỳnh Minh Chí',
                            'Đi trễ',
                            'Nhân viên',
                            'cả ngày',
                            CupertinoIcons.clock_solid,
                            Color(0xffff9e00)),
                        taskList(
                            'Lê Văn Nguyên',
                            '',
                            'Nhân viên',
                            'chiều',
                            CupertinoIcons.check_mark_circled_solid,
                            Color(0xff00cf8d)),
                        taskList(
                            'Trần Bích Liên',
                            '',
                            'Nhân viên',
                            'sáng',
                            CupertinoIcons.check_mark_circled_solid,
                            Color(0xff00cf8d)),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
