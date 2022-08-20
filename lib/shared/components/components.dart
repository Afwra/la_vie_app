import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ionicons/ionicons.dart';

void navigateTo(BuildContext context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigateToAndFinish(BuildContext context, Widget widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}

Widget defaultSearchField(
        {
          int? minLines,
          int? maxLines,
          Color? fillColor,
          IconData? prefix,
          BorderSide? borderSide,
          bool prefixEnabled = true,
          String? text,
          String? Function(String?)? validator,
        Function(String)? onSubmit,
        Function()? onTap,
          TextInputType? inputType,
          bool isPassword = false,
          bool isReadOnly = false,
          bool isEnabled = true,
          EdgeInsetsGeometry? contentPadding,
        TextEditingController? controller,
        Function(String)? onChanged}) =>
    TextFormField(
      keyboardType: inputType,
      obscureText: isPassword,
      enabled: isEnabled,
      readOnly: isReadOnly,
      validator: validator,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        prefixIcon: prefixEnabled? Icon(prefix??Ionicons.search):null,
        hintText: text??'Search',
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: borderSide?? BorderSide.none,
        ),

        fillColor: fillColor??Colors.grey.shade200,
      ),
      minLines: minLines,
      maxLines: maxLines,


    );

Widget defaultButton({String? text,void Function()? onPressed,double? width,Color? backgroundColor,BoxBorder? border,Color? textColor,double? fontSize})=>Container(
  height: 40,
  width: width??double.infinity,
  decoration: BoxDecoration(
    color: backgroundColor?? Colors.green,
    borderRadius: BorderRadius.circular(10),
    border: border
  ),
  child: MaterialButton(
    onPressed: onPressed,

    child: Text(
      '$text',
      style: TextStyle(
        fontSize: fontSize??14,
        color: textColor??Colors.white,
      ),
    ),
  ),
);

void showToast({required String msg,Color? backGroundColor,ToastGravity? gravity,Toast? toastLength,Color? textColor})=>Fluttertoast.showToast(
    msg: msg,
  backgroundColor: backGroundColor,
  gravity: gravity,
  toastLength: toastLength,
  textColor: textColor
);
