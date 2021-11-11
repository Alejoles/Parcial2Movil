import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parcial2movil/controllers/favorite_controller.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:parcial2movil/data/models/variables_model.dart';
import 'package:parcial2movil/ui/widgets/boxes.dart';
import 'package:intl/intl.dart';

class FavoritePage extends GetView<FavoriteController> {
  const FavoritePage({Key? key}) : super(key: key);

/*
  @override
  Widget build(BuildContext context) {
    var fullHeight = MediaQuery.of(context).size.height;
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
              SizedBox(
                height: 25,
              ),
              Text(
                "Favoritos",
                style: GoogleFonts.robotoSlab(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                  child: ListView(
                padding: EdgeInsets.only(left: 25, right: 25),
                children: [ElementoLista(), ElementoLista(), ElementoLista()],
              ))
            ],
          ),
        ),
      ),
    ));
  }*/

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Favoritos'),
          centerTitle: true,
        ),
        body: ValueListenableBuilder<Box<WeatherModel>>(
          valueListenable: Boxes.getWeather().listenable(),
          builder: (context, box, _) {
            final transactions = box.values.toList().cast<WeatherModel>();

            return buildContent(transactions);
          },
        ),
        /*floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => showDialog(
            context: context,
            builder: (context) => TransactionDialog(
              onClickedDone: addTransaction,
            ),
          ),
        ),*/
      );
}

class ElementoLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: ValueListenableBuilder<Box<WeatherModel>>(
          valueListenable: Boxes.getWeather().listenable(),
          builder: (context, box, _) {
            final items = box.values.toList().cast<WeatherModel>();
            return buildContent(items);
          }));
}

Widget buildContent(List<WeatherModel> weather) {
  if (weather.isEmpty) {
    return Center(
      child: Text(
        'Aún no tienes favoritos',
        style: TextStyle(fontSize: 24),
      ),
    );
  } else {
    return Column(
      children: [
        SizedBox(height: 24),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: weather.length,
            itemBuilder: (BuildContext context, int index) {
              final transaction = weather[index];

              return buildTransaction(context, transaction);
            },
          ),
        ),
      ],
    );
  }
}

Widget buildTransaction(
  BuildContext context,
  WeatherModel transaction,
) {
  final color = transaction.ciudad == "Bogota" ? Colors.red : Colors.green;
  //final date = DateFormat.yMMMd().format(transaction.createdDate);
  final pais = transaction.pais.toString();
  final amount = '\$' + transaction.mainTemp.toStringAsFixed(2);

  return Card(
    color: Colors.white,
    child: ExpansionTile(
      tilePadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      title: Text(
        transaction.ciudad,
        maxLines: 2,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      subtitle: Text(pais),
      trailing: Text(
        amount,
        style:
            TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      children: [
        buildButtons(context, transaction),
      ],
    ),
  );
}

Widget buildButtons(BuildContext context, WeatherModel transaction) => Row(
      children: [
        Expanded(
          child: TextButton.icon(
            label: Text('Delete'),
            icon: Icon(Icons.delete),
            onPressed: () => deleteTransaction(transaction),
          ),
        )
      ],
    );

void deleteTransaction(WeatherModel transaction) {
  transaction.delete();
}

/*
class ElementoLista extends GetView<FavoriteController> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => {print("hola1")},
        child: Container(
          height: 60,
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(blurRadius: 5, color: Colors.black, offset: Offset(0, 5)),
          ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.location_pin),
                  Text("Ciudad - Pais")
                ],
              ),
              IconButton(
                  onPressed: () => {print("fav")}, icon: Icon(Icons.favorite))
            ],
          ),
        ));
  }
}*/
