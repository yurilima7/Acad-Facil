import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Screens/Home_Screen/Widgets/grid_disciplines.dart';
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
  bool _isLoading = true;
  bool _isLoading2 = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeController>(context, listen: false)
          .loadDisciplines()
          .then((value) {
        setState(() {
          _isLoading = false;
        });
      });

      Provider.of<HomeController>(context, listen: false)
          .loadUser()
          .then((value) => {
                setState(
                  () {
                    _isLoading2 = false;
                  },
                )
              });
    });
  }

  @override
  Widget build(BuildContext context) {
    final providerUser = Provider.of<HomeController>(context).user;

    return !_isLoading && !_isLoading2
        ? Scaffold(
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
                  const GridDisciplines(),
                ],
              ),
            ),
          ),
        ) : Center(
            child: CircularProgressIndicator(
              color: ColorsStyles.white,
            ),
          );
  }
}
