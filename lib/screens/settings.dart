import 'package:doit/screens/privacy.dart';
import 'package:doit/screens/splash.dart';
import 'package:doit/services/auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:doit/components/app_bar_back.dart';
import 'package:doit/components/navigator.dart';
import 'package:doit/components/button_list.dart';
import 'package:doit/components/custom/user_profile.dart';
import 'package:doit/models/auth.dart';
import 'package:doit/config/constants.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = 'settings';

  SettingsScreen();

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var auth = Provider.of<AuthModel>(context, listen: true);
    var user = auth.user;

    _shareApp() {
      Share.share(
        '''${t.shareAppMessage}

        $playStoreUrl''',
      );
    }

    _signOut() async {
      var authService = new AuthService();
      await authService.signOut();
      CNavigator.stack(context, SplashScreen.routeName);
      auth.setTaskList([]);
      auth.setUser(null);
    }

    _goToPrivacy() {
      CNavigator.stack(context, PrivacyScreen.routeName);
    }

    return Scaffold(
      appBar: AppBarBack(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            UserProfile(
              name: user?.displayName,
              email: user?.email,
              imageUrl: user?.photoUrl,
            ),
            ButtonList(
              children: [
                ButtonListItem(
                  text: t.privacy,
                  onPressed: _goToPrivacy,
                ),
                ButtonListItem(
                  text: t.shareApp,
                  onPressed: _shareApp,
                ),
                ButtonListItem(
                  text: user == null ? t.goToLogin : t.signOut,
                  onPressed: _signOut,
                ),
              ],
            ),
            Text(t.byStanley)
          ],
        ),
      ),
    );
  }
}
