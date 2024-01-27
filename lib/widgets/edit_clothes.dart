import 'package:flutter/material.dart';
import 'package:lab2/model/Clothes.dart';

class EditClothes extends StatefulWidget {
  final Clothes clothes;
  final Function updateClothes;

  const EditClothes({Key? key, required this.clothes, required this.updateClothes}) : super(key: key);

  @override
  State<EditClothes> createState() => _EditClothesState();
}

class _EditClothesState extends State<EditClothes> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.clothes.name;
    _descriptionController.text = widget.clothes.description!;
  }

  void _updateData() {
    final updatedName = _nameController.text;
    final updatedDescription = _descriptionController.text;

    if (updatedName.isEmpty || updatedDescription.isEmpty) return;

    widget.clothes.name = updatedName;
    widget.clothes.description = updatedDescription;

    widget.updateClothes(widget.clothes);
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
            decoration: InputDecoration(labelText: 'Name'),
            onSubmitted: (_) => _updateData(),
          ),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: 'Description'),
            onSubmitted: (_) => _updateData(),
          ),
          ElevatedButton(
            onPressed: _updateData,
            child: const Text(
              'Update',
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
