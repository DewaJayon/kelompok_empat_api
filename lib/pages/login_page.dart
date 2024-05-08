import 'package:flutter/material.dart';
import 'package:kelompok_empat_api/pages/list_page.dart';
import 'package:kelompok_empat_api/widgets/custom_elevated_button.dart';
import 'package:kelompok_empat_api/widgets/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool lihatPassword = true;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/unhi.png",
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Selamat Datang Di UNHI Shop",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Toko Online Terlengkap Di UNHI",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    hintText: "Masukkan Username",
                    labelText: "Username",
                    obscureText: false,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                      hintText: "Masukkan Password",
                      labelText: "Password",
                      obscureText: lihatPassword,
                      icon: Icons.remove_red_eye,
                      onPressed: () {
                        setState(() {
                          lihatPassword = !lihatPassword;
                        });
                      }),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Lupa Password?",
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  CustomElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListPage(),
                        ),
                      );
                    },
                    text: "Login",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Belum punya akun?",
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Daftar Sekarang",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
