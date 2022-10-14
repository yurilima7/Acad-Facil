import 'package:acad_facil/MVC/Controllers/disciplinas_controller.dart';
import 'package:acad_facil/MVC/Controllers/usuario_controller.dart';
import 'package:acad_facil/MVC/Views/widgets/card_informacao.dart';
import 'package:acad_facil/MVC/Views/widgets/disciplinas_grid.dart';
import 'package:acad_facil/MVC/Styles/estilos_texto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _carregando = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp){
      Provider.of<DisciplinasControler>(context, listen: false)
        .lerDisciplinas().then((value) {
          setState(() {
            _carregando = false;
          });
        });
    });
  }

  @override
  Widget build(BuildContext context) {
 
    final providerDisciplinas = Provider.of<DisciplinasControler>(context);
    final providerUsuario = Provider.of<UsuarioController>(context).usuario;
    
    return SingleChildScrollView(   
    
      physics: const BouncingScrollPhysics(),

      child: Padding(
        padding: const EdgeInsets.all(20.0),

        child: Wrap(
          runSpacing: MediaQuery.of(context).size.height * 0.06,
          
          children: [
            CardInformacoes(titulo: providerUsuario.curso),             
            
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

                      Visibility(
                        visible: !_carregando, 
                        child: TextButton(
                          onPressed: () {},
                          child: providerDisciplinas.quantidadeDisciplinas != 0
                            ? Text(
                                'Ver todas',
                                style: context.estilosTexto.tituloSecundario,
                              )
                            : Text(
                                'Adicionar',
                                style: context.estilosTexto.tituloSecundario,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),

                _carregando 
                  ? const CircularProgressIndicator(color: Colors.white,)
                  : const DisciplinasGrid(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}