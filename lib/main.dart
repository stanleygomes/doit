import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import './screens/splash.dart';
import './screens/error404.dart';
import 'config/theme.dart';
import 'config/routes.dart';

main() {
  runApp(RootWidget());
}

class RootWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Do it!',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      routes: routes,
      initialRoute: SplashScreen.routeName,
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) => Error404Screen(),
        );
      },
    );
  }
}
