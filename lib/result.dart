import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lisu_font_converter/home.dart';
import 'package:lisu_font_converter/widgets/colors.dart';

import 'widgets/author_info.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key, required this.data, required this.isToUnicode});
  final bool isToUnicode;
  final String data;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Result',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        actions: [
          HistoryIcon(),
          IconButton(
            splashRadius: 25,
            onPressed: () {
              Clipboard.setData(ClipboardData(text: widget.data)).then((value) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Copied successfully.')));
              });
            },
            icon: Icon(Icons.copy),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                widget.data,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: widget.isToUnicode ? 'LisuTzimu' : 'Byaly Lisu',
                  fontSize: 16,
                ),
              ),
            ),
            AuthorInfo(
              isToUnicode: widget.isToUnicode,
            )
          ],
        ),
      ),
    );
  }
}
