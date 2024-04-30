import 'package:flutter/material.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';


class ProductDiscount extends StatelessWidget {
  final String title;
  final String imagepath;
  final String imagepathprofile;
  final String titleprofile;
  final double rating;
  final String harga;
  final String diskonprice;
  final double diskon;
  const ProductDiscount({Key? key, required this.title, required this.imagepath, required this.titleprofile, required this.rating, required this.harga, required this.diskonprice, required this.imagepathprofile, required this.diskon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.cardIconFill,
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 110,
            width: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                imagepath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 11, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        imagepathprofile,
                        width: 25,
                        height: 25,
                        fit: BoxFit.cover,
                      ),
                    ),
                     Text(
                      titleprofile,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: AppColors.description,
                      ),
                    ),
                  ].withSpaceBetween(width: 5),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, size: 20, color: AppColors.bintang,),
                    Text(
                      "$rating",
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: AppColors.description,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      harga,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: AppColors.description,
                      ),
                    ),
                    Text(
                      "Rp $diskonprice",
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: AppColors.hargaStat,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: const Color(0xFFFFCFCF)),
                      child:                           Text(
                      "$diskon%",
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppColors.hargaStat,
                        ),
                      ),
                    )
                  ].withSpaceBetween(width: 5),
                )
              ].withSpaceBetween(height: 5),
            ),
          )
        ].withSpaceBetween(width: 10),
      ),
    );
  }
}
