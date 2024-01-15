import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../constants/string.dart';

class ErrorBox extends StatelessWidget {
  String errorMessage;

  ErrorBox({required this.errorMessage, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: Get.width -50,
        //width: 110,
        height: 60,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Colors.black12,
              width: 1.0,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          child: Center(
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: ConstantStrings.kAppInterFont,
              ),
              child: Text(
                errorMessage,

              ),
            ),
          ),
        ),
      ),
    );
  }
}
