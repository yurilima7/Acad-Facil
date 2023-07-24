import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:acad_facil/App/Core/Widgets/button.dart';
import 'package:acad_facil/App/Models/user.dart';
import 'package:acad_facil/App/Screens/Register_Data_Screen/register_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class RegisterData extends StatefulWidget {
  const RegisterData({super.key});

  @override
  State<RegisterData> createState() => _RegisterDataState();
}

class _RegisterDataState extends State<RegisterData> {
  final courseEC = TextEditingController();
  final periodEC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    courseEC.dispose();
    periodEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final registerDataController =
        Provider.of<RegisterDataController>(context);

    final nav = Navigator.of(context);

    void registerData() async {
      final valid = formKey.currentState?.validate() ?? false;

      if (valid) {

        await registerDataController.registerData(
          UserModel(
            id: '',
            name: '',
            course: courseEC.text.trim(),
            period: int.tryParse(periodEC.text)!,
          ),
        );

        if (registerDataController.isSuccess) {
          nav.pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
        }

      }
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),

      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Informe seus dados',
            style: context.textStyles.titleLarge,
          ),

          elevation: 0,
          automaticallyImplyLeading: false,
        ),

        body: Align(
          alignment: Alignment.bottomCenter,

          child: SingleChildScrollView(
            child: Form(
              key: formKey,

              child: Padding(
                padding: const EdgeInsets.all(16.0),

                child: Column(
                  children: [
                    TextFormField(
                      controller: courseEC,
                      style: context.textStyles.secundaryTitle,
                      
                      decoration: const InputDecoration(
                        label: Text('Seu curso'),
                      ),

                      validator: Validatorless.required('Obrigatório!'),
                    ),

                    TextFormField(
                      controller: periodEC,
                      style: context.textStyles.secundaryTitle,
                      keyboardType: TextInputType.number,

                      onFieldSubmitted: (_) => registerData(),

                      decoration: const InputDecoration(
                        label: Text('Período Atual'),
                      ),

                      validator: Validatorless.required('Obrigatório!'),
                    ),

                    SizedBox(
                      height: height * .05,
                    ),
                  
                    Button(title: 'Entrar', action: registerData)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
