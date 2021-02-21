import 'package:deus/statics/my_colors.dart';
import 'package:deus/statics/styles.dart';
import 'package:flutter/material.dart';

class TextFieldWithMax extends StatelessWidget {
  final TextEditingController controller;
  final double maxValue; // the maximum value that can be chosen
  final TextInputType keyboardType;
  final hintText;

  TextFieldWithMax(
      {@required this.controller,
      @required this.maxValue,
      this.keyboardType = TextInputType.number, this.hintText = '0.00'});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MyStyles.cardRadiusSize),
          color: Color(MyColors.Button_BG_Black),
          border: Border.all(color: Colors.white.withOpacity(0.1))),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        keyboardType: keyboardType,
        cursorColor: Colors.white,
        style: MyStyles.lightWhiteMediumTextStyle,
        decoration: InputDecoration(
            hintText: hintText,
            focusedErrorBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            border: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            suffixIcon: GestureDetector(
              onTap: () {
                controller.text = maxValue.toString();
              },
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: Text(
                  'MAX',
                  style: MyStyles.whiteSmallTextStyle,
                ),
                decoration: BoxDecoration(
                    color: Color(0xFF5BCCBD).withOpacity(0.25),
                    border: Border.all(color: Colors.white, width: 1.5),
                    borderRadius: BorderRadius.circular(7)),
              ),
            )),
      ),
    );
  }
}