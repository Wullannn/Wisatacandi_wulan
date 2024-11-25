import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _namacontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  String _errorText = '';

  bool _obscurePassword = true;

  void _signUp(){
    String name = _namacontroller.text.trim();
    String username = _usernamecontroller.text.trim();
    String password = _passwordcontroller.text.trim();

    if (password.length<8 ||
        !password.contains(RegExp(r'[A-Z]')) ||
        !password.contains(RegExp(r'[a-z]')) ||
        !password.contains(RegExp(r'[0-9]')) ||
        !password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
      setState(() {
        _errorText = 'Minimal 8 karakter, kombinasi [A-Z], [a-z], [0-9], [!@#\\\$%^&*(),.?":{}|<>]';
      });
    };
    print('*** Sign Up berhasil');
    print('Nama : $name');
    print('Nama Pengguna : $username');
    print('Password : $password');

  }

  // Todo 2. Mmebuat fungsi dispose
  @override
  void dispose(){
    //   Todo: Implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      //   TODO: 2. pasang appbar
      appBar: AppBar(title: Text('Sign Up'),),
      //   TODO: 3. Pasang body
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
                child: Column(
                  // TODO:4 Atur MAINXISALIGNMENT DAN CROSSASISALIGNMENT
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _namacontroller,
                      decoration: InputDecoration(
                        labelText: "Nama",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20,),
                    //   Todo:5. pasang textformfield nama pengguna
                    TextFormField(
                      controller: _usernamecontroller,
                      decoration: InputDecoration(
                        labelText: "Nama pengguna",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    //   TODO 6. Pasang textform kata sandi
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: _passwordcontroller,
                      decoration: InputDecoration(
                        labelText: "kata sandi",
                        errorText: _errorText.isNotEmpty ? _errorText : null,
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off
                                :Icons.visibility,
                          ),),
                      ),
                      obscureText: _obscurePassword,
                    ),
                    //   Todo 7. pasang elevated sign in
                    SizedBox(height: 20,),
                    ElevatedButton(
                        onPressed: (){},
                        child: Text("Sign Up")),
                    //   TODO 8. PASANG TEXT BUTTON SIGN UP
                    SizedBox(height: 10,),
                    // TextButton(
                    //     onPressed: (){},
                    //     child: Text("Sudah punya akun? Sign In di sini")),
                    RichText(
                        text: TextSpan(
                          text: "Sudah punya akun?",
                          style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Sign In di sini",
                              style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                  fontSize: 16
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = (){},
                            ),
                          ],
                        )
                    ),
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }
}