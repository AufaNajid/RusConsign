import 'package:flutter/cupertino.dart';

class CustomAccountUsername extends StatelessWidget {
  final String username;

  const CustomAccountUsername({
    required this.username,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      username,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Color(0xFF222831),
        fontSize: 18,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        height: 0,
      ),
    );
  }
}

class CustomDescription extends StatelessWidget {
  final String description;
  const CustomDescription({
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Color(0xFF30475E),
        fontSize: 11,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        height: 0,
      ),
    );
  }
}

class CustomInfoBold extends StatelessWidget {
  final String info;
  
  const CustomInfoBold({
    required this.info,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      info,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Color(0xFF30475E),
        fontSize: 11,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        height: 0,
      ),
    );
  }
}

class CustomInfoText extends StatelessWidget {
  final String info;
  
  const CustomInfoText({
    required this.info,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
  width: 600, // Atur lebar SizedBox sesuai kebutuhan Anda
  child: Text(
    info,
    maxLines: 5,
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.center,
    style: const TextStyle(
      color: Color(0xFF30475E),
      fontSize: 11,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      height: 1.0,
    ),
  ),
);
  }
}
