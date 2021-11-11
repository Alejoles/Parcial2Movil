import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:parcial2movil/data/models/variables_model.dart';
import 'myapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(WeatherModelAdapter());
  await Hive.openBox<WeatherModel>('weathers');

  runApp(const MyApp());
}
