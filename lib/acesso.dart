import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mikenson_thomas/login.dart';
import 'cadastro.dart';
import 'about.dart';
import 'homePage.dart';

class AcessoPage extends StatefulWidget {
  String? nome;
  String? sobrenome; //opcional
  String email;

  AcessoPage({
    required this.email,
    this.nome,
    this.sobrenome,
  });

  @override
  _AcessoPageState createState() => _AcessoPageState();
}

class _AcessoPageState extends State<AcessoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.home),
        automaticallyImplyLeading: false,
        title: Center(child: Text('Pagina de acesso')),
      ),
      body: Container(
        //color: Colors.yellow,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    "OLÁ! SEJA BEM VINDO(A)",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Por favor verifique seus email",
                    style: TextStyle(fontSize: 20, color: Colors.deepOrange),
                  ),
                ),
                Center(
                    child: Center(
                        child:
                            Text("Seu email cadastrado é: ${widget.email}"))),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => About()),
                    );
                  },
                  child: Text('Proxima Página'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text('Voltar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text('Pega imagem'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
