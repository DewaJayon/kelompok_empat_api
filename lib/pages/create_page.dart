// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kelompok_empat_api/widgets/custom_elevated_button.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final title = TextEditingController();
  final description = TextEditingController();
  final harga = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text("Data Disimpan"),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void sendData() async {
    var urlApiCreate = "https://kusumawardanastudio.com/api/api_create.php";
    var dataSend = {
      "title": title.text,
      "description": description.text,
      "harga": harga.text
    };

    final response = await http.post(
      Uri.parse(urlApiCreate),
      body: dataSend,
    );

    if (response.statusCode == 200) {
      Map api = json.decode(response.body);
      print(api['status']);

      if (api['status'] == "Success") {
        _showToast(context);
      } else if (api['status'] == "Error") {
        print("error");
      } else {
        throw Exception('Gagal menambahkan data!');
      }
    } else {
      throw Exception('Gagal menambahkan data!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create'),
        backgroundColor: Colors.yellow,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextFormField(
                      controller: title,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Masukkan Judul',
                        labelText: 'Judul',
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextFormField(
                      controller: description,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Masukkan Deskripsi',
                        labelText: 'Deskripsi',
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: harga,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Masukan Harga',
                        labelText: 'Harga',
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomElevatedButton(
                  onPressed: () {
                    sendData();
                    _showToast(context);
                  },
                  text: 'Submit',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
