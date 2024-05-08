import 'package:flutter/material.dart';
import 'package:kelompok_empat_api/models/shop.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.model});

  final Shop model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(model.image),
              const SizedBox(height: 20),
              Text(
                model.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(model.harga),
              const SizedBox(height: 20),
              Text(model.description),
            ],
          ),
        ),
      ),
    );
  }
}
