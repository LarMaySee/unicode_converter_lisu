import 'package:flutter/material.dart';

class AuthorInfo extends StatelessWidget {
  const AuthorInfo({
    Key? key,
    required this.isToUnicode,
  }) : super(key: key);

  final bool isToUnicode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isToUnicode ? 'ꓫꓬꓹ ꓢꓴ ꓾ ' : 'xy, su I',
            style: TextStyle(
              fontFamily: isToUnicode ? 'LisuTzimu' : 'Byaly Lisu',
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            isToUnicode ? 'ꓡꓯ‐ꓟꓯ‐ꓢꓶꓸ' : 'lA-mA-sL.',
            style: TextStyle(
              fontFamily: isToUnicode ? 'LisuTzimu' : 'Byaly Lisu',
              color: Colors.pink,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
