import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lisu_font_converter/history.dart';
import 'package:lisu_font_converter/models/history_model.dart';
import 'package:lisu_font_converter/result.dart';
import 'package:lisu_font_converter/services/converter.dart';
import 'package:lisu_font_converter/services/repository.dart';
import 'package:lisu_font_converter/widgets/author_info.dart';
import 'package:lisu_font_converter/widgets/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Converter converter = Converter();

  TextEditingController ctrl1 = new TextEditingController();
  String? input;

  bool isToUnicode = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    ctrl1.dispose();
  }

  // ctrl1
  onTypeCtrl1(String i) {
    if (mounted) {
      this.setState(() {
        input = i;
      });
    }
  }

  // convert
  String convertUnicodeText() {
    print(isToUnicode);

    String data = isToUnicode ? Converter().toUnicode(input) : Converter().toNonUnicode(input);
    return data;
  }

  // add history
  Future<void> add(data) async {
    await MyDB.db.insert(History(data: data, isUnicode: isToUnicode ? 1 : 0, createdAt: new DateTime.now().toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: Image.asset('./assets/Logo.png'),
        elevation: 0,
        title: Text(
          'Lisu Unicode Converter',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            splashRadius: 25,
            onPressed: () {
              Clipboard.getData('text/plain').then((value) {
                ctrl1.text = value!.text.toString();
                ctrl1.selection = TextSelection.fromPosition(TextPosition(offset: ctrl1.text.length));
                this.setState(() {
                  this.input = value.text;
                });
              });
            },
            icon: Icon(Icons.paste),
          ),
          HistoryIcon()
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: input != null && input!.isNotEmpty
              ? () async {
                  String uniCode = convertUnicodeText();

                  // store to history
                  await add(uniCode);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                                data: uniCode,
                                isToUnicode: isToUnicode,
                              )));
                }
              : null,
          child: Icon(
            Icons.keyboard_arrow_right,
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: [
                  TextField(
                    style: textFieldStyle(),
                    maxLines: null,
                    minLines: 10,
                    decoration: inputDecoration(hint: isToUnicode ? 'li-su font converter' : 'ꓡꓲ-ꓢꓴ ꓝꓳꓠꓔ ꓚꓳꓠꓦꓰꓣꓔꓰꓣ'),
                    controller: ctrl1,
                    onChanged: onTypeCtrl1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          isToUnicode ? 'Non-Unicode' : 'Unicode',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            this.setState(() {
                              isToUnicode = !isToUnicode;
                            });
                          },
                          child: Icon(Icons.compare_arrows, color: Colors.pink),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(10),
                            backgroundColor: Color.fromARGB(255, 255, 225, 236), // <-- Button color
                            foregroundColor: Colors.pinkAccent, // <-- Splash color
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          isToUnicode ? 'Unicode' : 'Non-Unicode',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            AuthorInfo(isToUnicode: isToUnicode),
          ],
        ),
      ),
    );
  }

  TextStyle textFieldStyle() {
    return TextStyle(
      fontFamily: isToUnicode ? 'Byaly Lisu' : 'LisuTzimu',
      color: Colors.white,
      fontSize: 16,
    );
  }

  InputDecoration inputDecoration({String? hint}) {
    return InputDecoration(
      filled: true,
      fillColor: Color.fromARGB(29, 254, 201, 201),
      enabled: true,
      contentPadding: EdgeInsets.all(20),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(20),
        gapPadding: 10,
      ),
      hintStyle: TextStyle(
        color: Colors.white38,
        fontSize: 16,
      ),
      hintText: hint ?? '',
    );
  }
}

class HistoryIcon extends StatelessWidget {
  const HistoryIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 25,
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryPage()));
      },
      icon: Icon(Icons.history),
    );
  }
}
