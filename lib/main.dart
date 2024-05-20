import 'package:duole/constants/fonts.dart';
import 'package:duole/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const DuoleGame());
}

class DuoleGame extends StatefulWidget {
  const DuoleGame({super.key});

  @override
  State<DuoleGame> createState() => _DuoleGameState();
}

class _DuoleGameState extends State<DuoleGame> {
  // This widget is the root of your application.
  final GlobalKey<NavigatorState> appContext = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '',
      theme: ThemeData(
        // scaffoldBackgroundColor: CupertinoColors.systemBackground,
        fontFamily: Fonts.HarmonyOS,
        colorScheme: ColorScheme.fromSeed(
          seedColor: CupertinoColors.systemGreen,
          surface: CupertinoColors.systemBackground,
        ),
        useMaterial3: true,
        snackBarTheme: SnackBarThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // 设置圆角半径为10
          ),
        ),
      ),
      routingCallback: (route) {
        print('Current route: ${route!.current}');
      },
      locale: Locale('zh'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh'),
        const Locale('en'),
      ],
      builder: EasyLoading.init(builder: (context, widget) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.linear(1.0)),
          child: widget!,
        );
      }),
      initialRoute: RoutesClass.APP,
      getPages: RoutesClass.routes,
      defaultTransition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 360),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
