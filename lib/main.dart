// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/fruit_detail.dart';
import 'package:flutter_application_1/fruit_data_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Examen Erik',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static List<String> fruitname = [
    'Manzana',
    'Platano',
    'Mango',
    'Naranja',
    'Piña',
  ];

  static List url = [
    'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Tellissaare.JPG/256px-Tellissaare.JPG',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Banana_and_cross_section.jpg/256px-Banana_and_cross_section.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Hapus_Mango.jpg/220px-Hapus_Mango.jpg',
    'https://5.imimg.com/data5/VN/YP/MY-33296037/orange-600x600-500x500.jpg',
    'https://5.imimg.com/data5/GJ/MD/MY-35442270/fresh-pineapple-500x500.jpg',
  ];

  final List<FruitDataModel> Fruitdata = List.generate(
      fruitname.length,
      (index) => FruitDataModel(fruitname[index], '${url[index]}',
          '${fruitname[index]} Description...'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frutas'),
      ),
      body: ListView.builder(
          itemCount: Fruitdata.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                  title: Text(Fruitdata[index].name),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.network(Fruitdata[index].ImageUrl),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FruitDetail(
                              fruitDataModel: Fruitdata[index],
                            )));
                  }),
            );
          }),
      bottomNavigationBar: TextButton(
        onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) => const AlertDialog(
                  title: Text('Titulo'),
                  content: Text('Descripción'),
                )),
        child: const Text('Agregar'),
        style: TextButton.styleFrom(
            textStyle:
                const TextStyle(fontSize: 50, backgroundColor: Colors.red)),
      ),
    );
  }
}
