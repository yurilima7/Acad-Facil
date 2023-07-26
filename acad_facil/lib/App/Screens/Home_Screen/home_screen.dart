import 'package:acad_facil/App/Core/Widgets/app_bar_main.dart';
import 'package:acad_facil/App/Core/Widgets/button.dart';
import 'package:acad_facil/App/Screens/Home_Screen/Widgets/options_card.dart';
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
    final disciplines = homeController.disciplines ?? [];

    return Visibility(
      visible: !homeController.loading && !homeController.isError,

      replacement: Visibility(
        visible: homeController.isError,

        child: Scaffold(
          body: Padding(
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
        ),
      ),

      child: Scaffold(
        appBar: AppBarMain(
          titleStr: 'Olá ${providerUser?.name}',
          subTitleCenter: 'Curso: ${providerUser?.course}',
          subTitleBottom: 'Período: ${providerUser?.period}°',
          image: providerUser?.perfilUrl ?? '',
          description: true,
        ),
    
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
    
            child: Column(
              children: [
                const SizedBox(
                    height: 45,
                ),
    
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Menu de Navegação',
                        style: context.textStyles.titleMedium,
                      ),
                    ],
                  ),
                ),
                
                SizedBox(      
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 4 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                    ),
                  
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    
                    itemCount: 4,
                    itemBuilder: (context, i) => disciplines.isNotEmpty && providerUser != null ? OptionsCard(
                      path: homeController.assets[i],
                      title: homeController.titles[i],
                      subtitle:
                          i > 1 ? '' : 'Disciplinas ${disciplines.length}',
                      index: i,
                      discipline: disciplines,
                      user: providerUser,
                    ) : OptionsCard(
                      path: homeController.assets[i],
                      title: homeController.titles[i],
                      subtitle:
                          i > 1 ? '' : 'Disciplinas ${disciplines.length}',
                      index: i,
                      user: providerUser,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
