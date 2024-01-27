import 'package:flutter/material.dart';
import 'package:lab2/widgets/new_clothes.dart';

import '../model/Clothes.dart';
import '../widgets/edit_clothes.dart';

class ClothesScreen extends StatefulWidget {
  const ClothesScreen({super.key});

  @override
  State<ClothesScreen> createState() => _ClothesScreenState();
}

class _ClothesScreenState extends State<ClothesScreen> {
  List<Clothes> _clothes = [];

  void _addClothesFunction() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewClothes(
              addClothes: _addNewClothesToList,
            ),
          );
        });
  }

  void _addNewClothesToList(Clothes clothes) {
    setState(() {
      _clothes.add(clothes);
    });
  }

  void _showEditClothesForm(Clothes clothes) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: EditClothes(
              clothes: clothes,
              updateClothes: _updateClothesInList,
            ),
          );
        });
  }

  void _updateClothesInList(Clothes updatedClothes) {
    setState(() {
      int index =
          _clothes.indexWhere((clothes) => clothes.id == updatedClothes.id);
      if (index != -1) {
        _clothes[index] = updatedClothes;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Clothes App"),
        actions: [
          IconButton(
              onPressed: () => _addClothesFunction(),
              icon: const Icon(Icons.add_circle_rounded, color: Colors.white)
          )
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "What clothes you choose?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _clothes.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  color: Colors.green,
                  child: ListTile(
                    title: Text(
                      _clothes[index].name,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.red),
                    ),
                    subtitle: Text(
                      _clothes[index].description!,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.red),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.white),
                          onPressed: () => _showEditClothesForm(_clothes[index]),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete_rounded, color: Colors.white),
                          onPressed: () {
                            setState(() {
                              _clothes.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                    onTap: () => _showClothesDialog(context, _clothes[index].name),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showClothesDialog(BuildContext context, String clothesName) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('You chose $clothesName'),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

}
