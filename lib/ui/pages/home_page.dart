import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:parcial2movil/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
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
                      children: const [
                        Icon(Icons.location_pin),
                        Text(
                          "data",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    const Text("Descripcion"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: const [
                            Icon(
                              Icons.thermostat_outlined,
                              size: 40,
                            ),
                            Text("Temp")
                          ],
                        ),
                        Column(
                          children: const [
                            Icon(
                              Icons.cloud_circle_rounded,
                              size: 40,
                            ),
                            Text("Velocidad")
                          ],
                        ),
                        Column(
                          children: const [
                            Icon(
                              Icons.water,
                              size: 40,
                            ),
                            Text("Humedad")
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
                          children: const [
                            Icon(Icons.person),
                            Text("Feels like"),
                          ],
                        ),
                        IconButton(
                            onPressed: () => {},
                            icon: Icon(Icons.favorite_outline))
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
                      child: TextField(),
                      width: 200,
                    ),
                    const SizedBox(
                      child: Icon(Icons.search),
                      width: 35,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () =>
                      controller.prueba1("Bogota"), //TODO: user choice
                  child: Text("data"))
            ],
          ),
        ),
      ),
    ));
  }
}
