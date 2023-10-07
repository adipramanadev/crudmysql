import 'package:flutter/material.dart';

import '../controller/databaseHelper.dart';
import 'dashboard.dart';
import 'editpage.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({required this.list, required this.index});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  DatabaseHelper dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.list![widget.index]['nameproduct']),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.only(
            top: 50,
            left: 12.0,
            right: 12.0,
            bottom: 12.0,
          ),
          children: [
            Container(
              child: Text(
                "Nama Produk: " + widget.list![widget.index]['nameproduct'],
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 20.0),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                "Price: " + widget.list![widget.index]['price'].toString(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 20.0),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      //delete
                      dbHelper.deleteData(widget.list![widget.index]['id']);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Dashboard(),
                      ));
                    },
                    child: Text('Delete'),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                    ),
                    onPressed: () {
                      //editPage
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              EditPage(list: widget.list, index: widget.index),
                        ),
                      );
                    },
                    child: Text('Update'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
