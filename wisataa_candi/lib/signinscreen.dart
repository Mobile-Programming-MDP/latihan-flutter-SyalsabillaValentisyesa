import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // TODO 1 : Deklarasikan variabel
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;
  String _errorText = "";

  void signIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String savedUsername = prefs.getString('usernme') ?? '';
    final String savedPassword = prefs.getString('password') ?? '';
    final String enteredUsername = _usernameController.text.trim();
    final String enteredPassword = _passwordController.text.trim();

    if (enteredUsername.isEmpty || enteredPassword.isEmpty) {
      setState(() {
        _errorText = 'Nama dan kata sandi tidak boleh kosong';
      });
    } else if (savedUsername.isEmpty || savedPassword.isEmpty) {
      setState(() {
        _errorText = 'Anda belum terdaftar';
      });
    }

    if (enteredUsername == savedUsername && enteredPassword == savedPassword) {
      setState(() {
        _errorText = '';
        var _isSignedIn = true;
        prefs.setBool('isSignedIin', true);
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/h');
      });
    } else {
      setState(() {
        _errorText = 'Cek kembali nama pengguna dan kata sandi';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO 2: Pasang AppBar
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      // TODO 3: Pasang body
      body: Center(
        // bungkus Padding dengan SingleChildScrollView.
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                // TODO 4 : Atur mainAxisAlignment dan crossAxisAlignment
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // TODO 5 : Pasang TextFormField nama pengguna
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: "Nama Pengguna",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  // TODO 6 : Pasang TextFormField kata sandi
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "Kata Sandi",
                      errorText: _errorText.isNotEmpty ? _errorText : null,
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    obscureText: _obscurePassword,
                  ),
                  // TODO 7 : Pasang ElevatedButton sign in
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Implementasi fungsi sign in nanti
                    },
                    child: Text("Sign In"),
                  ),
                  // TODO 8: Pasang TextButton Sign Up
                  SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: "Belum punya akun? ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.deepPurple,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Daftar di sini.",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Aksi untuk pindah ke halaman pendaftaran
                              Navigator.pushNamed(context, '/signup');
                            },
                        ),
                      ],
                    ),
                  ),
                  RichText(text: TextSpan(text: _errorText)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
