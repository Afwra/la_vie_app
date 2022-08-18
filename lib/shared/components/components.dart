import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

void navigateTo(BuildContext context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigateToAndFinish(BuildContext context, Widget widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}

Widget defaultSearchField(
        {String? Function(String?)? validator,
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
        prefixIcon: const Icon(Ionicons.search),
        hintText: 'Search',
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        fillColor: Colors.grey.shade200,
      ),
    );
