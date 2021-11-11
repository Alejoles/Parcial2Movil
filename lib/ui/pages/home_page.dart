import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:parcial2movil/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var iconChange = true;

    double fullHeight = MediaQuery.of(context).size.height;
    var ciudadInput = TextEditingController();
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
          body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: fullHeight,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue, Colors.purpleAccent])),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 25),
                Container(
                  width: 300,
                  height: 350,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [BoxShadow(blurRadius: 20)],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.location_pin),
                          Text(
                            controller.listaWeather[5].toString() +
                                ' - ' +
                                controller.listaWeather[6].toString(),
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                      Text(controller.listaWeather[0].toString()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const Icon(
                                Icons.thermostat_outlined,
                                size: 40,
                              ),
                              Text(controller.listaWeather[1].toString() + "°F")
                            ],
                          ),
                          Column(
                            children: [
                              const Icon(
                                Icons.cloud_circle_rounded,
                                size: 40,
                              ),
                              Text(controller.listaWeather[4].toString() +
                                  " km/h")
                            ],
                          ),
                          Column(
                            children: [
                              const Icon(
                                Icons.water_outlined,
                                size: 40,
                              ),
                              Text(controller.listaWeather[3].toString() + "%")
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.person),
                              Text(
                                  controller.listaWeather[2].toString() + "°F"),
                            ],
                          ),
                          IconButton(
                              onPressed: () => {
                                    //controller.prueba1(ciudadInput.text),
                                    iconChange = !iconChange,
                                    controller.favoriteIcon(iconChange),
                                  },
                              icon: controller.fluticon)
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: TextField(
                          controller: ciudadInput,
                        ),
                        width: 200,
                      ),
                      const SizedBox(
                        child: Icon(Icons.search),
                        width: 35,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      controller.prueba1(ciudadInput.text);
                      controller.favoriteIcon(true); //TODO: user choice
                      iconChange = true;
                    },
                    child: Text("data"))
              ],
            ),
          ),
        ),
      ));
    });
  }
}
