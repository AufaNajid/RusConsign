import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rusconsign/detailPage/widgets/komponen.dart';
import 'package:get/get.dart';
import 'package:rusconsign/diskonPage/widgets/komponen.dart';
import 'package:rusconsign/extension.dart';

class DiskonPage extends StatelessWidget {
  const DiskonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Produk Diskon",
        onBackPressed: () {
          Get.back();
        },
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: ListView.builder(
            shrinkWrap: true,
              physics:  const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: productDiscount(
                  title: "Lorem ipsum dolor sit amet",
                  imagepath: 'https://via.placeholder.com/165x110' ,
                  titleprofile: "lorem ipsum",
                  rating: (index % 5) + 1,
                  harga: "Harga :",
                  diskon: (index * 5) + 20,
                  diskonprice: "100.000",
                  imagepathprofile:  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSU5NotY59b9Il4DR4FAUdE6cDxIvYQTHdi2CLPuMmv_Q&s",
                ),
              );
            },
            itemCount: 6,),
        ),
      ),
    );
  }
}

Widget customTextWidget(
  String text, {
  TextStyle? style,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    style: style, // Style teks yang bisa disesuaikan
    textAlign: textAlign, // Penyelarasan teks yang bisa disesuaikan
  );
}
