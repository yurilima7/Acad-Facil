import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Widgets/options_card.dart';
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
      visible: !homeController.loading,

      replacement: const Scaffold(
        body: SizedBox.shrink(),
      ),

      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Olá ${providerUser?.name}',
                    style: context.textStyles.titleLarge,
                  ),
                  Text(
                    'Curso: ${providerUser?.course}',
                    style: context.textStyles.titleMedium,
                  ),
                  Text(
                    'Período: ${providerUser?.period}°',
                    style: context.textStyles.titleMedium,
                  ),
                ],
              ),
    
              CircleAvatar(
                backgroundImage: NetworkImage(providerUser?.perfilUrl ?? ''),
                radius: 32,
              )
            ],
          ),
    
          toolbarHeight: 110,
          elevation: 0,
          backgroundColor: ColorsStyles.secundary,
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
        //  : const SizedBox.shrink(),
      ),
    );
  }
}
