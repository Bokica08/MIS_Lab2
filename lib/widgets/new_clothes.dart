import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab2/model/Clothes.dart';

class NewClothes extends StatefulWidget {
  final Function addClothes;

  const NewClothes({super.key, required this.addClothes});

  @override
  State<NewClothes> createState() => _NewClothesState();
}

class _NewClothesState extends State<NewClothes> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  String name = "";
  String description = "";

  void _submitData() {
    if (_nameController.text.isEmpty) return;
    final inputName = _nameController.text;
    final inputDesc = _descriptionController.text;

    if (inputDesc.isEmpty || inputName.isEmpty) return;

    final newClothes = Clothes(Random().nextInt(50), inputName, inputDesc);

    widget.addClothes(newClothes);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: "Name"),
            onSubmitted: (_) => _submitData(),
          ),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: "Description"),
            onSubmitted: (_) => _submitData(),
          ),
          ElevatedButton(
            onPressed: _submitData,
            child: const Text(
              'Add Clothes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            ),
          )
        ],
      ),
    );
  }
}
