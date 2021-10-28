import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:doit/screens/splash.dart';
import 'package:doit/services/auth.dart';
import 'package:doit/screens/home.dart';
import 'package:doit/screens/error404.dart';
import 'package:doit/config/theme.dart';
import 'package:doit/config/routes.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Auth auth = Auth();
  bool completedIntro = await auth.didCompletedIntro();
  String initialRoute =
      completedIntro ? HomeScreen.routeName : SplashScreen.routeName;

  runApp(RootWidget(
    initialRoute: initialRoute,
  ));

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
}

class RootWidget extends StatelessWidget {
  final String initialRoute;

  RootWidget({
    required this.initialRoute,
  });

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Do it!',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      routes: routes,
      initialRoute: this.initialRoute,
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) => Error404Screen(),
        );
      },
    );
  }
}
