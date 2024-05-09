import 'package:flutter/material.dart';

class DropdownPayment extends StatefulWidget {
  @override
  _DropdownPaymentState createState() => _DropdownPaymentState();
}

class _DropdownPaymentState extends State<DropdownPayment> {
  late String valueChoose; // Menggunakan late untuk menunjukkan bahwa nilai ini akan diinisialisasi segera
  final List<String> paymentList = [
    "Gopay", "Dana", "OVO", "QRIS", "COD (Cash On Delivery)"
  ];

  @override
  void initState() {
    super.initState();
    valueChoose = paymentList.first; // Menginisialisasi valueChoose dengan nilai pertama dalam paymentList
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: valueChoose,
      onChanged: (newValue) {
        setState(() {
          valueChoose = newValue.toString(); // Mengonversi nilai nullable menjadi string
        });
      },
      items: paymentList.map((valueItem) {
        return DropdownMenuItem(
          value: valueItem,
          child: Text(valueItem),
        );
      }).toList(),
    );
  }
}
