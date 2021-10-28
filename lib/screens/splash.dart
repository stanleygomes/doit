import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:doit/models/user.dart' as UserModel;
import 'package:doit/services/auth.dart';
import 'package:doit/components/CNavigator.dart';
import 'package:doit/components/Button.dart';
import 'package:doit/components/CDialog.dart';
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
    this._disableButtons();

    Auth auth = new Auth();
    FirebaseService service = new FirebaseService();

    try {
      var googleUser = await service.signInwithGoogle();
      var user = UserModel.User(
        id: googleUser?.id,
        displayName: googleUser?.displayName,
        email: googleUser?.email,
        photoUrl: googleUser?.photoUrl,
        serverAuthCode: googleUser?.serverAuthCode,
      );

      await auth.create(user);
      this._enableButtons();

      CNavigator.replace(context, 'home');
    } catch (e) {
      print('mensagem de erro aqui');
      print(e);
      CDialog.showOkDialog(context, 'Ops', 'Ocorreu um erro ao efetuar login.');
    }
  }

  _skipLogin() async {
    this._disableButtons();

    Auth auth = new Auth();
    await auth.create(null);

    this._enableButtons();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: Center(
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
      ),
    );
  }
}
