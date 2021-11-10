import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parcial2movil/bindings/dashboard_binding.dart';
import 'package:parcial2movil/ui/pages/dashboard.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
            name: "/",
            page: () => const MyDashBoard(),
            binding: DashBoardBinding())
      ],
    );
  }
}
