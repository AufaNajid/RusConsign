import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/profilePage/profile_page_controller.dart';

class CustomInfoWidget extends StatelessWidget {
  final IconData icon;
  final String info;
  final String infoNumber;


    CustomInfoWidget({
    required this.icon,
    required this.info,
    required this.infoNumber,
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: 55,
          height: 55,
          decoration: ShapeDecoration(
            color: Color(0xFFF5F5F5),
            shape: OvalBorder(),
          ),
          child: Icon(icon),
        ),
        Text(info,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFF30475E),
        fontSize: 11,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        height: 0,
      ),
    ),
    Text(
    infoNumber,
    textAlign: TextAlign.center,
    style: TextStyle(
        color: Color(0xFFFF3C3C),
        fontSize: 11,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        height: 0,
    ),
)
      ],
    );
  }
}

class SectionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final int index;

  const SectionButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SectionController sectionButtonController = Get.find();

    return Obx(() => OutlinedButton.icon(
          style: ButtonStyle(
            side: MaterialStateProperty.all(BorderSide(
              color: sectionButtonController.selectedIndex == index
              ? const Color(0xFFFF3C3C)
              : const Color(0xFFECECEC),
            )),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          icon: Icon(
            icon,
            color: sectionButtonController.selectedIndex == index
                ? const Color(0xFFFF3C3C)
                : const Color(0xFF30475E),
          ),
          label: Text(
            text,
            style: TextStyle(
              color: sectionButtonController.selectedIndex == index
                  ? const Color(0xFFFF3C3C)
                  : const Color(0xFF30475E),
              fontSize: 13,
            ),
          ),
          onPressed: () {
            if (sectionButtonController.selectedIndex != index) {
              sectionButtonController.setSelectedFilter(index);
            }
            if (index == 0) {
              
            }
            else if (index == 1){

            }
          },
        ));
  }
}

class SectionPribadi extends StatelessWidget {
  const SectionPribadi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}
