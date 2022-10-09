import 'package:acad_facil/MVC/Controllers/materia_controller.dart';
import 'package:acad_facil/MVC/Controllers/usuario_controller.dart';
import 'package:acad_facil/MVC/Models/materia.dart';
import 'package:acad_facil/MVC/Models/usuario.dart';
import 'package:acad_facil/MVC/Views/widgets/card_informacao.dart';
import 'package:acad_facil/MVC/Views/widgets/card_materia.dart';
import 'package:acad_facil/MVC/Views/widgets/estilos_texto.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
 
    final List<Materia> materias = MateriaControler().listaMaterias(context);
    final Usuario usuario = UsuarioController().usuario(context);
    
    return Padding(
        padding: const EdgeInsets.all(20.0),
    
        child: SingleChildScrollView(       
          physics: const BouncingScrollPhysics(),

          child: Wrap(
            runSpacing: MediaQuery.of(context).size.height * 0.06,
            
            children: [
              CardInformacoes(titulo: usuario.curso),             
              
              Column(
                
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      
                      children: [
                        EstilosTexto.textoTitulo('Disciplinas'),
                        TextButton(
                          onPressed: () {},
                          child: materias.isNotEmpty
                            ? EstilosTexto.textNormalInter('Ver todas')
                            : EstilosTexto.textNormalInter(
                                'Adicionar',
                              ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 380,
                    child: materias.isNotEmpty ? GridView.builder(
                    
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 10,
                      ),
                    
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      itemBuilder: (context, i) => CardMateria(materia: materias[i]),
                    )
                    : 
                    Center(
                      child: EstilosTexto.textNormalInter(
                          'Sem disciplinas no momento!'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }
}
