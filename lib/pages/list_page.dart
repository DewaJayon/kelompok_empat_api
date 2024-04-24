import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kelompok_empat_api/models/shop.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late Future<List<Shop>> data;
  var url = 'https://kusumawardanastudio.com/api/api_online.php';

  Future<List<Shop>> fetchData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map api = json.decode(response.body);
      List jsonResponse = api['data'];

      print("data api :" + jsonResponse.toString());

      return jsonResponse.map((data) => Shop.fromJson(data)).toList();
    } else {
      throw Exception('gagal mendapatkan data API');
    }
  }

  @override
  void initState() {
    super.initState();
    data = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UNHI Shop'),
        backgroundColor: Colors.yellow,
      ),
      body: FutureBuilder<List<Shop>>(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasData) {
              if (snapshot.data!.isNotEmpty) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(snapshot.data![index].title),
                        subtitle: Text(snapshot.data![index].description),
                        leading: Image.network(snapshot.data![index].image),
                        trailing: Text(snapshot.data![index].harga),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text("Tidak ada data dari API"),
                );
              }
            } else {
              return const Center(
                child: Text("Tidak ada data dari API"),
              );
            }
          }
        },
      ),
    );
  }
}
