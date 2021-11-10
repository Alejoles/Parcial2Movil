import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parcial2movil/controllers/dashboard_controller.dart';
import 'package:parcial2movil/ui/pages/favorite_page.dart';
import 'package:parcial2movil/ui/pages/home_page.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class MyDashBoard extends StatefulWidget {
  const MyDashBoard({Key? key}) : super(key: key);

  @override
  _MyDashBoardState createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (controller) {
      return Scaffold(
          body: Container(
            child: IndexedStack(
              index: controller.tabIndex,
              children: const [HomePage(), FavoritePage()],
            ),
          ),
          bottomNavigationBar: AnimatedNavigationBar(
            items: <AnimatedBarItems>[
              AnimatedBarItems(
                  selectedColor: Colors.lightBlue,
                  icon: const Icon(Icons.home),
                  title: const Text("Home")),
              AnimatedBarItems(
                  selectedColor: Colors.red,
                  icon: const Icon(Icons.favorite),
                  title: const Text("Favoritos"))
            ],
            currentIndex: controller.tabIndex,
            onTap: (index) {
              controller.changeTabIndex(index);
            },
          ));
    });
  }
}
 /*  */