import 'package:clean_network/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/screens/home_screen/home.viewmodel.dart';
import 'app/screens/tabbar_screen.dart';
import 'core/placeholder_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupServiceLocator();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(repo: locator<HomeRepo>()),
        ),
        // ChangeNotifierProvider.value(
        //   value: PellenViewModel(repo: locator<PellenRepo>()),
        // ),
      ],
      child: MaterialApp(
        home: TabBarScreen(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
