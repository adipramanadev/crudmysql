import 'package:flutter/material.dart';

import 'dashboard.dart';

class EditPage extends StatefulWidget {
  List list;
  int index;
  EditPage({required this.list, required this.index, super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController txtNamaProduk = TextEditingController();
  TextEditingController txtPrice = TextEditingController();

  @override
  void initState() {
    txtNamaProduk =
        TextEditingController(text: widget.list[widget.index]['nameproduct']);
    txtPrice = TextEditingController(
        text: widget.list[widget.index]['price'].toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.list[widget.index]['nameproduct']),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.only(
            top: 40.0,
            left: 12.0,
            right: 12.0,
            bottom: 12.0,
          ),
          children: [
            Container(
              height: 50.0,
              child: TextField(
                controller: txtNamaProduk,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'Nama Produk',
                  hintText: 'Nama Produk',
                  icon: const Icon(Icons.apps),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 50.0,
              child: TextField(
                controller: txtPrice,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'Price',
                  hintText: 'Price',
                  icon: const Icon(Icons.apps),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            ElevatedButton(
              onPressed: () {
                //saveData

                //redirect ke halaman dashboard
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Dashboard(),
                  ),
                );
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
