import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class DropdownPayment extends StatelessWidget {
  const DropdownPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          title: Text("Pilih Metode Pembayaran" ,style: AppTextStyle().description(AppColors.description),) 
          ,leading:Icon(FeatherIcons.airplay ,color: AppColors.titleLine,),
           children: [
            ListTile(
              title: Text("1", style: AppTextStyle().header(AppColors.activeIconType),),
              onTap: () {
              },
            ),
            ListTile(
              title: Text("2", style: AppTextStyle().header(AppColors.activeIconType),),
              onTap: () {
                
              },
            )
           ],
          
          )
      ],
    );
  }
}