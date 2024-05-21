import 'package:flutter/material.dart';

class PokemonPage extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String id;
  final String type;
  const PokemonPage({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.id,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(60, 90, 166, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(60, 90, 166, 1),
        centerTitle: true,
        title: const Text(
          'Pokemon Page',
          style: TextStyle(
            color: Color.fromRGBO(255, 203, 5, 1),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(imageUrl),
            Text(
              'Name: $name',
              style: const TextStyle(
                color: Color.fromRGBO(255, 203, 5, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'ID: $id',
              style: const TextStyle(
                color: Color.fromRGBO(255, 203, 5, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Type: $type',
              style: const TextStyle(
                color: Color.fromRGBO(255, 203, 5, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
