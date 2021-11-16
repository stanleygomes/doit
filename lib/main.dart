import 'package:doit/utils/route.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:doit/screens/splash.dart';
import 'package:doit/services/auth.dart';
import 'package:doit/screens/home.dart';
import 'package:doit/config/theme.dart';
import 'package:doit/config/routes.dart';
import 'package:doit/models/auth.dart';
import 'package:doit/models/user.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Auth auth = Auth();
  bool completedIntro = await auth.didCompletedIntro();
  UserModel? user = await auth.getUser();
  String initialRoute =
      completedIntro ? HomeScreen.routeName : SplashScreen.routeName;

  runApp(RootWidget(
    initialRoute: initialRoute,
    user: user,
  ));

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
}

class RootWidget extends StatelessWidget {
  final String initialRoute;
  final UserModel? user;

  RootWidget({
    required this.initialRoute,
    required this.user,
  });

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => AuthModel()),
        ChangeNotifierProxyProvider0<AuthModel>(
          create: (context) {
            var authModel = new AuthModel();
            authModel.user = this.user;

            return authModel;
          },
          update: (context, auth) {
            return auth!;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Do it!',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        routes: routes,
        initialRoute: this.initialRoute,
        onUnknownRoute: RouteUtil.getNotFoundPage,
      ),
    );
  }
}
