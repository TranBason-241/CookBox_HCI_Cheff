import 'package:cookbookapp/Views/common/color.dart';
import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    required hintText,
    required idpass,
    Key? key,
  })  : _hintText = hintText,_idpass=idpass,
        super(key: key);
  final String _hintText;
  final TextEditingController _idpass;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: ShapeDecoration(
          shape: StadiumBorder(), color: AppColor.placeholderBg),
      child: TextField(
        controller: _idpass,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: _hintText,
          hintStyle: TextStyle(color: AppColor.placeholder),
          contentPadding: const EdgeInsets.only(left: 40),
          
        ),
      ),
    );
  }
}
