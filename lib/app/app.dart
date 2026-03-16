import 'package:flutter/material.dart';
import 'package:testproj/app/router.dart';
import 'package:testproj/app/theme.dart';

class CryptoCoinsListApp extends StatelessWidget {
  const CryptoCoinsListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', theme: darkTheme, routes: routes);
  }
}
