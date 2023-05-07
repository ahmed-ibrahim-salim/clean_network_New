import 'package:clean_network/app/models/models.dart';
import 'package:clean_network/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/screens/home_screen/home.viewmodel.dart';
import 'app/screens/tabbar_screen.dart';
import 'core/placeholder_service.dart';
import 'helpers/fooderlich_them.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final theme = FooderlichTheme.light();

  setupServiceLocator();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(repo: locator<HomeRepo>()),
        ),
        ChangeNotifierProvider(
          create: (_) => TabManager(),
        )
        // ChangeNotifierProvider.value(
        //   value: PellenViewModel(repo: locator<PellenRepo>()),
        // ),
      ],
      child: MaterialApp(
        theme: theme,
        home: TabBarScreen(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
