import 'package:acad_facil/MVC/Controllers/materia_controller.dart';
import 'package:acad_facil/MVC/Models/materia.dart';
import 'package:acad_facil/MVC/Views/widgets/card_informacao.dart';
import 'package:acad_facil/MVC/Views/widgets/card_materia.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Materia> materias = MateriaControler().listaMaterias(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Laura'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),

        child: Column(
          children: [
            const CardInformacoes(),

            SizedBox(
              height: 400,
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2, //  define o tamanho
                crossAxisSpacing: 10, // define o espaçamento em linha
                
                children: List.generate(
                  4,
                  (index) => CardMateria(materia: materias[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
