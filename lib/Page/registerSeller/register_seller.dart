import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rusconsign/page/registerSeller/widgets/appbar.dart';
import 'package:rusconsign/page/registerSeller/widgets/customtextfield.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class RegisterSeller extends StatelessWidget {
  const RegisterSeller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RegisterSellerForm();
  }
}

class RegisterSellerForm extends StatefulWidget {
  const RegisterSellerForm({Key? key}) : super(key: key);

  @override
  _RegisterSellerFormState createState() => _RegisterSellerFormState();
}

class _RegisterSellerFormState extends State<RegisterSellerForm> {
  File? _pickedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.transparent,
        color: Colors.transparent,
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed("/waitingadmin");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.button2,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                child: Text(
                  "Registrasi",
                  style: AppTextStyle().description(AppColors.background),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: const AppBarRegisterSeller(title: "Registrasi Penjualan"),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Nama Lengkap",
                    style: AppTextStyle().subHeader(AppColors.titleLine),
                  ),
                  SizedBox(
                    height: AppResponsive().screenHeight(context) * 0.02,
                  ),
                  const TextFieldRegisterSeller(
                    hintText: "Masukkan nama lengkap anda...",
                  ),
                  SizedBox(
                    height: AppResponsive().screenHeight(context) * 0.03,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "NIS",
                    style: AppTextStyle().subHeader(AppColors.titleLine),
                  ),
                  SizedBox(
                    height: AppResponsive().screenHeight(context) * 0.02,
                  ),
                  const TextFieldRegisterSellerNumber(
                    hintText: "Masukkan NIS anda...",
                  ),
                  SizedBox(
                    height: AppResponsive().screenHeight(context) * 0.03,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Nomor Dompet Digital Aktif (Dana, Gopay atau OVO)",
                    style: AppTextStyle().subHeader(AppColors.titleLine),
                  ),
                  SizedBox(
                    height: AppResponsive().screenHeight(context) * 0.02,
                  ),
                  const TextFieldRegisterSellerNumber(
                    hintText: "Masukkan nomor dompet digital anda...",
                  ),
                  SizedBox(
                    height: AppResponsive().screenHeight(context) * 0.03,
                  ),
                ],
              ),
              Text(
                "Foto ID Card SMK RUS",
                style: AppTextStyle().subHeader(AppColors.titleLine),
              ),
              SizedBox(
                height: AppResponsive().screenHeight(context) * 0.02,
              ),
              DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(10),
                strokeCap: StrokeCap.butt,
                strokeWidth: 4,
                color: AppColors.cardIconFill,
                dashPattern: const [20, 8],
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: SizedBox(
                    width: AppResponsive().screenWidth(context) * 0.4,
                    height: AppResponsive().screenHeight(context) * 0.3,
                    child: _pickedImage != null
                        ? Image.file(
                            _pickedImage!,
                            fit: BoxFit.cover,
                          )
                        : Center(
                            child: SvgPicture.asset(
                              "assets/images/clarity_picture-line.svg",
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: AppResponsive().screenHeight(context) * 0.02,
              ),
              ElevatedButton(
                onPressed: _pickImage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.activeIcon,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "Pilih Foto",
                    style: AppTextStyle().description(AppColors.background),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
