import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lisu_font_converter/models/history_model.dart';
import 'package:lisu_font_converter/result.dart';
import 'package:lisu_font_converter/services/repository.dart';

import 'widgets/colors.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<History>? histories;

  @override
  void initState() {
    super.initState();

    getHistories();
  }

  Future<void> getHistories() async {
    await MyDB.db.getHistories().then((value) {
      if (mounted) {
        this.setState(() {
          histories = value.toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          'History',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          histories != null
              ? IconButton(
                  onPressed: () async {
                    await MyDB.db.deleteAll();

                    setState(() {
                      histories = null;
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Sucessfully clear history')));
                  },
                  icon: Icon(Icons.delete))
              : SizedBox.shrink(),
        ],
      ),
      body: histories != null
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: histories!.length,
                  itemBuilder: (context, index) {
                    final DateTime date =
                        DateTime.parse(histories![index].createdAt);

                    final String createdAt =
                        new DateFormat.yMMMd().format(date);

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultPage(
                                    data: histories![index].data,
                                    isToUnicode:
                                        histories![index].isUnicode != 0
                                            ? true
                                            : false)));
                      },
                      child: Card(
                        color: Colors.grey.withOpacity(0.2),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                histories![index].data,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: histories![index].isUnicode != 0
                                      ? 'LisuTzimu'
                                      : 'Byaly Lisu',
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                createdAt,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      color: Colors.pink,
                                      fontWeight: FontWeight.bold,
                                    ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          : Center(
              child: Text(
                'No histories yet.',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
    );
  }
}
