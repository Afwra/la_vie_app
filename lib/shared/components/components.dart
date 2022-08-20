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
          Color? fillColor,
          IconData? prefix,
          String? text,
          String? Function(String?)? validator,
        Function(String)? onSubmit,
        Function()? onTap,
          TextInputType? inputType,
          bool isPassword = false,
          bool isReadOnly = false,
          bool isEnabled = true,
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
        prefixIcon: Icon(prefix??Ionicons.search),
        hintText: text??'Search',
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        fillColor: fillColor??Colors.grey.shade200,
      ),
    );

Widget defaultButton({String? text,void Function()? onPressed})=>Container(
  height: 40,
  width: double.infinity,
  decoration: BoxDecoration(
    color: Colors.green,
    borderRadius: BorderRadius.circular(10),
  ),
  child: MaterialButton(
    onPressed: onPressed,

    child: Text(
      '$text',
      style:const TextStyle(
        fontSize: 14,
        color: Colors.white,
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
