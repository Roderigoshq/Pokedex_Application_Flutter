import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_application_flutter/pages/pokemon_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return Scaffold(
      backgroundColor: Color.fromRGBO(60, 90, 166, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(60, 90, 166, 1),
        title: Center(
          child: Text(
            "Home Page",
            style: TextStyle(
                color: Color.fromRGBO(255, 203, 5, 1),
                fontWeight: FontWeight.w600,
                fontSize: 25),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: 'Digite o nome do pokemon',
                  labelStyle: TextStyle(
                      color: Color.fromARGB(
                          255, 41, 41, 41)), // Label cinza escuro
                  filled: true,
                  fillColor: Colors.white, // Fundo branco
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(255, 203, 5, 1),
                        width: 2.0), // Contorno amarelo
                    borderRadius: BorderRadius.all(
                        Radius.circular(25.0)), // Borda arredondada
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(255, 203, 5, 1),
                        width: 2.0), // Contorno amarelo ao focar
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    // Borda arredondada ao focar
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () async {
                  final dio = Dio();
                  var response = await dio.get(
                      'https://pokeapi.co/api/v2/pokemon/${controller.text}');
                  String name = response.data['name'];
                  String id = response.data['id'].toString();
                  String type = response.data['types'][0]['type']['name'];
                  String imageUrl = response.data['sprites']['front_default'];
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PokemonPage(
                        imageUrl: imageUrl,
                        name: name,
                        id: id,
                        type: type,
                      ),
                    ),
                  );
                },
                child: Text(
                  "Pesquisa",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(60, 90, 166, 1),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(120, 22, 120, 22),
                    backgroundColor: Color.fromRGBO(255, 203, 5, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
