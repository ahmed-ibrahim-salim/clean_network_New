import 'package:clean_network/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/home.dart';
import 'app/home.viewmodel.dart';
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
      child: MaterialApp(home: HomeScreen()),
    ),
  );
  // MaterialApp(home: HomeScreen()));
}
