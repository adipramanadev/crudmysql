import 'package:crudmysql/controller/databaseHelper.dart';
import 'package:flutter/material.dart';

import 'addPage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //variabe memanggil getData
  DatabaseHelper dbHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => AddData()),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: dbHelper.getData(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ItemList(list: snapshot.data)
              : Center(
                  child: CircularProgressIndicator(),
                );
        }),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  List list;
  ItemList({required this.list, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: ((context, index) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {
              // Navigator.push(
              // context, MaterialPageRoute(builder: ((context) => Detail())));
            },
            child: Card(
              child: ListTile(
                title: Text(list[index]['nameproduct']),
                subtitle: Text(list[index]['price'].toString()),
                leading: Icon(Icons.apps),
              ),
            ),
          ),
        );
      }),
      itemCount: list == null ? 0 : list.length,
    );
  }
}
