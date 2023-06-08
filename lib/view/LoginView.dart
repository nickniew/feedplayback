import 'package:feedplayback/helper/UsuarioHelper.dart';
import 'package:feedplayback/view/HomeView.dart';
import 'package:flutter/material.dart';
import 'package:feedplayback/view/CadastroUsuarioView.dart';


class Login extends StatelessWidget {
  usuarioHelper facadeUser = usuarioHelper();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  @override
  Widget build(BuildContext contexto) {
    Widget ok = ElevatedButton(
      child: Text('OK'),
      onPressed: (){
        Navigator.of(contexto).pop();
      },
    );
    AlertDialog semUsuario = AlertDialog(
      title: Text('Sem Usuário'),
      content: Text('Este usuário não existe!'),
      actions: [
        ok
      ],
    );
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.black87,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset('assets/images/logo.png'),
            ),
            const SizedBox(
              height: 20,
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
              style: TextStyle(fontSize: 20, color: Colors.orange),
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
                      )
                  )
              ),
              style: TextStyle(fontSize: 20, color: Colors.orange),
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                child: const Text(
                  "Esqueci minha senha",
                  textAlign: TextAlign.right,
                ),
                onPressed: (){
                  // chamar tela de recuperar a senha
                },
              ),
            ),
            const SizedBox(
              height: 40,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Image.asset('assets/images/usuario.png'),
                          height: 28,
                          width: 28,
                        ),
                      )
                    ],
                  ),
                  onPressed: () async {
                    if(await facadeUser.login(_emailController.text, _senhaController.text)){
                      Navigator.push(
                        contexto,
                        MaterialPageRoute(
                          builder: (contexto) => HomeView(),
                        ),
                      );
                    } else {
                      showDialog(
                          context: contexto,
                          builder: (BuildContext contexto){
                            return semUsuario;
                          },);
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              child: ElevatedButton(
                child: const Text(
                  "Cadastre-se",
                  textAlign: TextAlign.center,
                ),
                onPressed: (){
                  Navigator.push(
                    contexto,
                    MaterialPageRoute(
                      builder: (contexto) => Cadastro(),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}