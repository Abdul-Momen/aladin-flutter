import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/color.dart';

class CustomField extends StatefulWidget {
  final TextEditingController textCon;

  final String? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final bool? isPassField;
  final bool? isEnabled;
  final TextInputType? inputType;
  final double? width, height;
  final FontWeight? txtFontWeight;
  final Color? fillClr;
  final Color? brdrClr;
  final Color? hintClr;
  final double? txtSize;
  final int? maxLine;
  final int? maxChar;
  final Function(String)? onChangedFn;
  final String? Function(String?)? validatorFn;
  const CustomField({
    Key? key,
    required this.textCon,
    this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    this.isPassField,
    this.isEnabled,
    this.inputType,
    this.width,
    this.height,
    this.txtFontWeight,
    this.fillClr,
    this.brdrClr,
    this.hintClr,
    this.txtSize,
    this.maxLine,
    this.maxChar,
    this.onChangedFn,
    this.validatorFn,
  }) : super(key: key);

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool obscureText = false;

  @override
  void initState() {
    obscureText = widget.isPassField ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 388.w,
      height: widget.height ?? 50.h,
      child: TextFormField(
        inputFormatters: widget.maxChar != null
            ? [
                LengthLimitingTextInputFormatter(widget.maxChar),
              ]
            : null,
        validator: widget.validatorFn,
        enabled: widget.isEnabled,
        cursorColor: ConstantColors.lightYellow,
        onChanged: widget.onChangedFn,
        maxLines: widget.isPassField != null ? 1 : widget.maxLine ?? 1,
        style: TextStyle(
          color: widget.isEnabled != null ? Colors.grey.shade500 : null,
          fontSize: widget.txtSize ?? 16.sp,
          fontWeight: widget.txtFontWeight ?? FontWeight.normal,
        ),
        controller: widget.textCon,
        keyboardType: widget.inputType,
        obscureText: obscureText,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          // filled: true,
          // fillColor: widget.fillClr ?? Colors.white,
          contentPadding: EdgeInsets.only(
            left: 15.w,
            top: widget.maxLine != null ? 25.h : 0.h,
          ),
          border: getInputBorder(),
          enabledBorder: getInputBorder(),
          focusedBorder: getInputBorder(),
          disabledBorder: getInputBorder(),
          prefixIcon: widget.prefixIcon != null
              ? SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: Center(
                    child:SvgPicture.asset(
                 //   Image.asset(
                      widget.prefixIcon!,
                      fit: BoxFit.cover,
                    ),

                  ),
                )
              : null,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: widget.txtSize ?? 16.sp,
            color: widget.hintClr ?? Colors.grey.shade600,
            fontWeight: widget.txtFontWeight,
          ),
          suffixIcon: widget.suffixIcon ??
              (widget.isPassField != null
                  ? IconButton(
                      onPressed: () =>
                          setState(() => obscureText = !obscureText),
                      icon: Icon(
                        obscureText
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Colors.black,
                      ),
                    )
                  : null),
        ),
      ),
    );
  }

  InputBorder getInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide(
        color: widget.isEnabled != null
            ? Colors.grey.shade300
            : widget.brdrClr ?? ConstantColors.lightYellow,
        width: 1,
      ),
    );
  }
}
