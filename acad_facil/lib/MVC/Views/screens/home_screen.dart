import 'package:acad_facil/MVC/Controllers/materia_controller.dart';
import 'package:acad_facil/MVC/Models/materia.dart';
import 'package:acad_facil/MVC/Views/widgets/card_informacao.dart';
import 'package:acad_facil/MVC/Views/widgets/card_materia.dart';
import 'package:acad_facil/MVC/Views/widgets/estilos_texto.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
 
    final List<Materia> materias = MateriaControler().listaMaterias(context);

    final PreferredSizeWidget appBar = AppBar(
      title: const Text('Laura'),
    );

    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.all(20.0),

        child: Column(
          children: [
            const Flexible(
              flex: 2,
              child: CardInformacoes(titulo: 'Ciência da Computação'),
            ),

            const Spacer(),

            Flexible(
              
              child: Padding(
                padding: const EdgeInsets.all(5.0),
            
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                  children: [
                    EstilosTexto.textoTitulo('Disciplinas'),
                
                    const Icon(Icons.filter_list, color: Colors.white,),
                  ],
                ),
              ),
            ),

            Flexible(
              flex: 7,
              child: GridView.builder(
            
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 2, //  define o tamanho
                  crossAxisSpacing: 10, // define o espaçamento em linha
                  mainAxisSpacing: 10,
                ),
              
                itemCount: materias.length,
                itemBuilder: (context, i) => CardMateria(materia: materias[i]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
