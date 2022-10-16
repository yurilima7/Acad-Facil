import 'package:acad_facil/App/Controllers/disciplines_controller.dart';
import 'package:acad_facil/App/Controllers/user_controller.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';

import 'package:acad_facil/App/Core/Widgets/information_card.dart';
import 'package:acad_facil/App/Core/Widgets/grid_disciplines.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Widgets/text_button_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp){
      Provider.of<DisciplinesControler>(context, listen: false)
        .loadDisciplines().then((value) {
          setState(() {
            _isLoading = false;
          });
        });
    });
  }

  void nextScreen(){
    Navigator.of(context).pushNamed(AppRoutes.disciplines);
  }

  @override
  Widget build(BuildContext context) {
 
    final providerDiscipline = Provider.of<DisciplinesControler>(context);
    final providerUser = Provider.of<UserController>(context).user;
    
    return SingleChildScrollView(   
    
      physics: const BouncingScrollPhysics(),

      child: Padding(
        padding: const EdgeInsets.all(20.0),

        child: Wrap(
          runSpacing: MediaQuery.of(context).size.height * 0.06,
          
          children: [
            InformationCard(title: providerUser.course),             
            
            Column(
              
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                    children: [
                      Text(
                        'Disciplinas',
                        style: context.textStyles.mainTitle,
                      ),

                      Visibility(
                        visible: !_isLoading, 
              
                        child: providerDiscipline.disciplinesCount != 0
                            ? TextButtonApp(
                                title: 'Ver todas',
                                action: nextScreen,
                              )
                            : TextButtonApp(
                                title: 'Adicionar',
                                action: nextScreen,
                              ),
                      ),
                    ],
                  ),
                ),

                _isLoading 
                  ? const CircularProgressIndicator(color: Colors.white,)
                  : const GridDisciplines(presentsAll: false),
              ],
            ),
          ],
        ),
      ),
    );
  }
}