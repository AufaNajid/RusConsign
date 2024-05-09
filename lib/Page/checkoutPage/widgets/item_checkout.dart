import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class ItemChekcout extends StatelessWidget {
  final String rating;
  final String price;
  final String jumlahBarang;
  final String subTotal;
  final String profileImagePath;

  const ItemChekcout({
    Key? key,
    required this.rating,
    required this.price,
    required this.jumlahBarang,
    required this.subTotal,
    required this.profileImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
          bottom: 20
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.cardIconFill,
        ),
        child: Column(
          children: [
            Card(
              elevation: 0,
              color: AppColors.cardProdukTidakDipilih,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: AppResponsive().screenWidth(context) * 0.250,
                      height: AppResponsive().screenHeight(context) * 0.13,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          "https://via.placeholder.com/165x110",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: AppResponsive().screenWidth(context) * 0.03,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Gantungan Kunci (Key Chain) Boneka Unik",
                            style: AppTextStyle().descriptionBold(AppColors.titleLine),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              SizedBox(
                                      height: 25,
                                      width: 25,
                                      child: ClipOval(
                                        child: Image.network(
                                          profileImagePath,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                              SizedBox(
                                width: AppResponsive().screenWidth(context) * 0.01,
                              ),
                              Text(
                                "Bagas Prasetyo",
                                style: AppTextStyle().textInfo(AppColors.description),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.bintang,
                              ),
                              Text(
                                rating,
                                style: AppTextStyle().textInfoBold(AppColors.description),
                              )
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Text(
                                "Harga : ",
                                style: AppTextStyle().textInfo(AppColors.description),
                              ),
                              Text(
                                "Rp " + price,
                                style: AppTextStyle().textInfoBold(AppColors.hargaStat),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Jumlah",
                      style: AppTextStyle().textInfo(AppColors.description),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        width: 40,
                        height: 20,
                        decoration: BoxDecoration(
                          color: AppColors.cardIconFill,
                          border: Border.all(color: AppColors.button2),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Text(jumlahBarang,
                        style: AppTextStyle().textInfoBold(AppColors.description),
                        textAlign: TextAlign.center,),
                      )
                    ],
                  ),
                ),
      
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [Text("Subtotal",
                    style: AppTextStyle().textInfo(AppColors.description),
                    textAlign: TextAlign.end,
                    ),
                    SizedBox(height: 5,),
                    Text("Rp " + subTotal, 
                    style: AppTextStyle().header(AppColors.hargaStat),
                    textAlign: TextAlign.end)
                    ],
                  ),
                )
              ],
            ),
      
            
          ],
        ),
      ),
    );
  }
}
