import 'package:doit/services/auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:doit/components/AppBarBack.dart';
import 'package:doit/components/CNavigator.dart';
import 'package:doit/components/ButtonList.dart';
import 'package:doit/components/custom/UserProfile.dart';
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
    var auth = context.watch<AuthModel>();
    var user = auth.user;

    _shareApp() {
      Share.share(
        '''${t.shareAppMessage}

        $playStoreUrl''',
      );
    }

    _signOut() async {
      Auth auth = new Auth();
      await auth.signOut();
      CNavigator.stack(context, 'splash');
    }

    _goToPrivacy() {
      CNavigator.stack(context, 'privacy');
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
                  text: t.signOut,
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
