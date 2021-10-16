import 'package:flutter/material.dart';
import 'package:flutter_application_1/fruit_data_model.dart';

class FruitDetail extends StatelessWidget {
  final FruitDataModel fruitDataModel;

  const FruitDetail({Key? key, required this.fruitDataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(fruitDataModel.name),
      ),
      body: Column(
        children: [
          Image.network(fruitDataModel.ImageUrl),
          const SizedBox(
            height: 10,
          ),
          Text(
            fruitDataModel.desc,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}
