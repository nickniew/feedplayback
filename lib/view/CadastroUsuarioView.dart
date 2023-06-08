import 'package:flutter/material.dart';
import 'package:feedplayback/helper/UsuarioHelper.dart';
import 'package:feedplayback/view/LoginView.dart';
import '../model/Usuario.dart';

class Cadastro extends StatelessWidget {

  usuarioHelper facadeUser = usuarioHelper();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final _validKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext contexto) {
    return Scaffold(
      key: _validKey,
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 40, right: 40),
        color: Colors.black87,
        child: ListView(
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              alignment: Alignment(0.0, 1.15),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/usuario.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: Container(
                height: 56,
                width: 56,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange,
                ),
                child: SizedBox.expand(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    onPressed: (){},
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _nomeController,
              keyboardType: TextInputType.text,
              validator: (nome){
                if(nome!.isEmpty)
                  return 'O nome deve ser preenchido';
                else
                  return null;
              },
              onSaved: (nome){
                _nomeController.text = nome!;
              },
              decoration: const InputDecoration(
                labelText: "Nome",
                labelStyle: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                    width: 2.0,
                  ),
                ),
              ),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.orange,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (email){
                if(email!.isEmpty)
                  return 'O email deve ser preenchido';
                else
                  return null;
              },
              onSaved: (email){
                _emailController.text = email!;
              },
              decoration: const InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                    width: 2.0,
                  ),
                ),
              ),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.orange,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _senhaController,
              keyboardType: TextInputType.text,
              validator: (senha){
                if(senha!.isEmpty)
                  return 'A senha deve ser preenchida';
                else
                  return null;
              },
              onSaved: (senha){
                _senhaController.text = senha!;
              },
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                    width: 2.0,
                  ),
                ),
              ),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.orange,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: ElevatedButton(
                    child: const Text(
                      "Cadastrar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      Usuario usuario = Usuario();
                      usuario.nome = _nomeController.text;
                      usuario.email = _emailController.text;
                      usuario.senha = _senhaController.text;
                      facadeUser.saveUser(usuario);
                      _nomeController.clear();
                      _emailController.clear();
                      _senhaController.clear();
                      Navigator.push(
                        contexto,
                        MaterialPageRoute(
                          builder: (contexto) => Login(),
                        ),
                      );
                    }
                  //              },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              child: ElevatedButton(
                child: const Text(
                  "Cancelar",
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.pop(contexto, false),
              ),
            ),
          ],
        ),
      ),
    );
  }
}