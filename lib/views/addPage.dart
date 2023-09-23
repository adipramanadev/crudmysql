import 'package:crudmysql/controller/databaseHelper.dart';
import 'package:crudmysql/views/dashboard.dart';
import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  //panggil databaseHelper
  DatabaseHelper dbHelper = DatabaseHelper();
  //deklarasi controller pada textfield
  TextEditingController txtNamaProduk = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
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
                dbHelper.addData(
                  txtNamaProduk.text.trim(),
                  txtPrice.text.trim(),
                );
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
