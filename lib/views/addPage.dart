import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Add Data'),
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
                keyboardType: TextInputType.none,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'Nama Produk',
                  hintText: 'Nama Produk',
                  icon: const Icon(Icons.apps),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
