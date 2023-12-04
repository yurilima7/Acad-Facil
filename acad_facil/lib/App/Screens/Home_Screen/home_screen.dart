import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:acad_facil/App/Core/Widgets/app_bar_main.dart';
import 'package:acad_facil/App/Core/Widgets/button.dart';
import 'package:acad_facil/App/Core/Widgets/tab_nav.dart';
import 'package:acad_facil/App/Screens/Home_Screen/Widgets/floating_button.dart';
import 'package:acad_facil/App/Screens/Home_Screen/Widgets/discipline_card.dart';
import 'package:acad_facil/App/Screens/Home_Screen/Widgets/search.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Screens/Home_Screen/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeController>(context, listen: false)
          .loadDataUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    final providerUser = homeController.user;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      
      child: Scaffold(
        appBar: !homeController.loading && !homeController.isError ? AppBarMain(
          titleStr: 'Olá ${providerUser?.name}',
          subTitleCenter: 'Curso: ${providerUser?.course}',
          subTitleBottom: 'Período: ${providerUser?.period}°',
          image: providerUser?.perfilUrl ?? '',
          description: true,
        ) : AppBar(elevation: 0,),
    
        body: Visibility(
          visible: !homeController.loading,
    
          child: Visibility(
            visible: !homeController.isError,
    
            replacement: Padding(
              padding: const EdgeInsets.all(16.0),
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ocorreu um erro, verifique sua conexão com a internet e tente novamente!',
                    style: context.textStyles.secundaryTitle,
                  ),
    
                  const SizedBox(
                     height: 20,
                  ),
    
                  Button(
                    action: () => homeController.loadDataUser(),
                    title: 'Recarregar',
                  ),
                ],
              ),
            ),
    
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
    
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
              
                child: Column(
                  children: [
                    const SizedBox(
                        height: 30,
                    ),
    
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0, 0.0, 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
    
                        children: [
                          Search(
                            onChanged: (search) => homeController.filter(search),
                          ),
    
                          const SizedBox(height: 12),
    
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Disciplinas',
                                style: context.textStyles.secundaryTitle,
                              ),
    
                              PopupMenuButton<int>(
                                color: ColorsStyles.secundary,
    
                                initialValue: homeController.periodSelected,
                      
                                icon: Icon(
                                  Icons.filter_list,
                                  color: ColorsStyles.white,
                                ),
                      
                                onSelected: (period) => homeController.updatePeriod(period),
                      
                                itemBuilder: (context) {
                                  return [
                                    PopupMenuItem<int>(
                                      value: 0, // 0 para mostrar todas as disciplinas
                                      child: Text(
                                        'Todas as disciplinas',
                                        style: context.textStyles.titleMedium,
                                      ),
                                    ),
                      
                                    for (int period in homeController.periodsWithoutZero)
                                      PopupMenuItem<int>(
                                        value: period,
                                        child: Text(
                                          'Período $period',
                                          style: context.textStyles.titleMedium,
                                        ),
                                      ),
                                  ];
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
          
                    Visibility(
                      visible: homeController.filtered.isNotEmpty,
          
                      replacement: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
    
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          
                          children: [
                            Text(
                              'Sem disciplinas no momento!',
                              style: context.textStyles.secundaryTitle,
                            ),
                          ],
                        ),
                      ),
          
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 10.0,
                        
                        children: List.generate(
                          homeController.filtered.length,
                          (i) => DisciplineCard(
                            discipline: homeController.filtered[i],
                            disciplines: homeController.filtered,
                            function: () {
                              Navigator.of(context).pushNamed(
                                AppRoutes.details,
                                arguments: {
                                  "discipline": homeController.filtered[i],
                                  "listDisciplines": homeController.filtered,
                                  "period": homeController.period,
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
    
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
    
        floatingActionButton: Visibility(
          visible: !homeController.loading,
          child: FloatingButton(
              title: 'Adicionar Disciplina',
              function: () => Navigator.of(context).pushNamed(AppRoutes.addDisciplines),
            ),
        ),
    
        bottomNavigationBar: Visibility(
          visible: !homeController.loading,
          child: const TabNav(currentScreen: 0),
        ),
      ),
    );
  }
}
