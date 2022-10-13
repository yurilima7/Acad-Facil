import 'package:acad_facil/MVC/Controllers/materia_controller.dart';
import 'package:acad_facil/MVC/Controllers/usuario_controller.dart';
import 'package:acad_facil/MVC/Models/disciplinas.dart';
import 'package:acad_facil/MVC/Models/usuario.dart';
import 'package:acad_facil/MVC/Views/widgets/card_informacao.dart';
import 'package:acad_facil/MVC/Views/widgets/card_disciplina.dart';
import 'package:acad_facil/MVC/styles/estilos_texto.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
 
    final List<Disciplinas> disciplinas = MateriaControler().disciplinas;
    final Usuario usuario = UsuarioController().usuario;
    
    return SingleChildScrollView(       
      physics: const BouncingScrollPhysics(),

      child: Padding(
        padding: const EdgeInsets.all(20.0),

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
                      Text(
                        'Disciplinas',
                        style: context.estilosTexto.tituloPrincipal,
                      ),

                      TextButton(
                        onPressed: () {},
                        child: disciplinas.isNotEmpty
                          ? Text(
                              'Ver todas',
                              style: context.estilosTexto.tituloSecundario,
                            )
                          : Text(
                              'Adicionar',
                              style: context.estilosTexto.tituloSecundario,
                            ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 380,
                  child: disciplinas.isNotEmpty ? GridView.builder(
                  
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 10,
                    ),
                  
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (context, i) => CardDisciplina(disciplina: disciplinas[i]),
                  )
                  : 
                  Center(
                    child: Text(
                      'Sem disciplinas no momento!',
                      style: context.estilosTexto.tituloSecundario,
                    ),
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
