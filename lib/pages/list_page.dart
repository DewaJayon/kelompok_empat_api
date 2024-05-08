import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kelompok_empat_api/models/shop.dart';
import 'package:kelompok_empat_api/pages/pages.dart';

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
                    var shop = snapshot.data![index];
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Shop model = Shop(
                            id: shop.id,
                            title: shop.title,
                            description: shop.description,
                            image: shop.image,
                            harga: shop.harga,
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(model: model),
                            ),
                          );
                        },
                        title: Text(
                          shop.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          shop.description,
                          maxLines: 2,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        leading: Image.network(shop.image),
                        trailing: Text(shop.harga),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreatePage(),
            ),
          );
        },
        backgroundColor: Colors.yellow,
        child: const Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
