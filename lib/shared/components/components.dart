import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ionicons/ionicons.dart';

import '../../models/products_model.dart';

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
          Widget? suffix,
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
        suffix: suffix,

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

Widget buildProductItem(Data data)=>SizedBox(
  height: 200,
  child: Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        height: 272,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(blurRadius: 0.5, color: Colors.grey)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Ionicons.remove)),
                  const Text('1'),
                  IconButton(onPressed: () {}, icon: const Icon(Ionicons.add))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${data.name}',
                    style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(data.price == null?'Unknown':'${data.price} egp'),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: MaterialButton(
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      Align(
        alignment: const Alignment(-1.2, -1.2),
        child: Image(
          image: data.imageUrl==''? const NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png'):NetworkImage('https://lavie.orangedigitalcenteregypt.com${data.imageUrl}'),
          width: 90,
          height: 120,
          fit: BoxFit.fill,

        ),
      ),
    ],
  ),
);