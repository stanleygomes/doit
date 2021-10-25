import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
// import 'package:doit/models/user.dart';
import 'package:doit/services/auth.dart';
import 'package:doit/components/Button.dart';
import 'package:doit/components/Spacing.dart';
import 'package:doit/components/Typography.dart';
import 'package:doit/services/firebase.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = 'splash';

  SplashScreen();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isDisabledButtons = false;

  void _disableButtons() {
    setState(() {
      _isDisabledButtons = true;
    });
  }

  void _enableButtons() {
    setState(() {
      _isDisabledButtons = false;
    });
  }

  _loginWithGoogle() async {
    // this._disableButtons();
    // Auth auth = new Auth();

    print('counter 1');

    FirebaseService service = new FirebaseService();

    try {
      await service.signInwithGoogle();
      print('teste 2');
      // Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    } catch (e) {
      // TRATAR O ERRO AQUI MOSTRANDO UMA MENSAGEM NA TELA
      // TRATAR O ERRO AQUI MOSTRANDO UMA MENSAGEM NA TELA
      // TRATAR O ERRO AQUI MOSTRANDO UMA MENSAGEM NA TELA
      // TRATAR O ERRO AQUI MOSTRANDO UMA MENSAGEM NA TELA
      // TRATAR O ERRO AQUI MOSTRANDO UMA MENSAGEM NA TELA
      // TRATAR O ERRO AQUI MOSTRANDO UMA MENSAGEM NA TELA
      // TRATAR O ERRO AQUI MOSTRANDO UMA MENSAGEM NA TELA
      // TRATAR O ERRO AQUI MOSTRANDO UMA MENSAGEM NA TELA
      // TRATAR O ERRO AQUI MOSTRANDO UMA MENSAGEM NA TELA
      // TRATAR O ERRO AQUI MOSTRANDO UMA MENSAGEM NA TELA
      // TRATAR O ERRO AQUI MOSTRANDO UMA MENSAGEM NA TELA
      // TRATAR O ERRO AQUI MOSTRANDO UMA MENSAGEM NA TELA
      // TRATAR O ERRO AQUI MOSTRANDO UMA MENSAGEM NA TELA
      print(e);
      if (e is FirebaseAuthException) {
        print(e.toString());
        // showMessage(e.message!);
        print('teste 2');
      }
    }

    // var user = User(
    //   id: 1,
    //   name: 'Fulano',
    // );

    // await auth.create(null);
  }

  _skipLogin() async {
    this._disableButtons();

    Auth auth = new Auth();
    await auth.create(null);
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPadding(
              value: 30,
              child: Image(
                image: AssetImage('assets/images/app-icon.png'),
                width: 100,
              ),
            ),
            H1(
              label: t.appName,
            ),
            CustomPadding(
              value: 10,
              child: Paragraph(
                label: t.slogan,
              ),
            ),
            CustomPadding(
              value: 30,
              child: Column(
                children: [
                  CustomPadding(
                    value: 15,
                    child: Button(
                      type: 'elevated',
                      label: t.loginWithGoogle,
                      huge: true,
                      onPressed: _isDisabledButtons ? null : _loginWithGoogle,
                    ),
                  ),
                  Button(
                    type: 'outlined',
                    label: t.notNow,
                    huge: true,
                    onPressed: _isDisabledButtons ? null : _skipLogin,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
