import 'package:flutter/material.dart';
import 'package:mikenson_thomas/cadastro.dart';
import 'package:mikenson_thomas/db/database_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'acesso.dart';
import 'cadastro.dart';
import 'splash.dart';
import 'homePage.dart';
import 'animacao.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _showPaassword = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController emailEditingController =
        TextEditingController(text: '');
    TextEditingController senhaEditingController =
        TextEditingController(text: '');

    return Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Center(child: Text('Pagina de login')),
            actions: [
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Cadastro()));
                    },
                    child: Icon(
                      Icons.person_add,
                      size: 26.0,
                    ),
                  )),
            ],
          ),
          body: Container(
            //color: Colors.yellowAccent,
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text('Bem vindo(a)',
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(24),
                        child: TextFormField(
                          controller: emailEditingController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Preencha o campo email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'E_mail',
                              icon: Icon(Icons.email_outlined),
                              hintText: 'Informe o email'),
                          cursorColor: Colors.redAccent,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(24),
                        child: TextFormField(
                          controller: senhaEditingController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Preencha o campo senha';
                            }
                            return null;
                          },
                          obscureText: _showPaassword == false ? true : false,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            icon: Icon(Icons.vpn_key_off_sharp),
                            hintText: 'Informe a senha',
                            // suffixIcon: GestureDetector(
                            //   child: Icon(
                            //     _showPaassword == false
                            //         ? Icons.visibility_off
                            //         : Icons.visibility_off,
                            //     color: Colors.white,
                            //   ),
                            //   onTap: () {
                            //     setState(() {
                            //       _showPaassword = !_showPaassword;
                            //     });
                            //   },
                            // ),
                          ),
                          cursorColor: Colors.redAccent,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              String email = emailEditingController.text;
                              String senha = senhaEditingController.text;

                              var usuarioExiste = await DatabaseHelper.instance
                                  .login(email, senha);

                              if (usuarioExiste == 0) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('Usuário ou Senha Inválido!')),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AcessoPage(
                                      email: email,
                                    ),
                                  ),
                                );
                              }
                            }
                          },
                          child: const Text('Enviar'),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                        child: Text('Pega uma imagem'),
                      ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => Animacao(),
                      //       ),
                      //     );
                      //   },
                      //   child: Text('Animacao'),
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ),
          //backgroundColor: Colors.red,
        ));
  }
}
