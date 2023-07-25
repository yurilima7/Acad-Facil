import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:acad_facil/App/Core/Widgets/app_bar_main.dart';
import 'package:acad_facil/App/Core/Widgets/button.dart';
import 'package:acad_facil/App/Models/user.dart';
import 'package:acad_facil/App/Screens/Profile_Screen/profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final formKey = GlobalKey<FormState>();
  final formData = <String, Object>{};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final arg = ModalRoute.of(context)?.settings.arguments as UserModel;

    formData['id'] = arg.id;
    formData['name'] = arg.name;
    formData['period'] = arg.period;
    formData['course'] = arg.course;
  }

  @override
  Widget build(BuildContext context) {
    final profileDataProvider = Provider.of<ProfileScreenController>(context);
    final nav = Navigator.of(context);

    void updateUserValues() async {
      final valid = formKey.currentState?.validate() ?? false;

      if (valid) {
        formKey.currentState?.save();

        final updateUser = UserModel(
          id: formData['id'].toString(),
          name: formData['name'].toString(),
          course: formData['course'].toString(),
          period: formData['period'] as int,
        );

        await profileDataProvider.updateUserData(
          updateUser
        );

        if (profileDataProvider.isSuccess) {
          nav.pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
        }
      }
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBarMain(
          titleStr: formData['name'].toString(),
        ),
    
        body: Align(
            alignment: Alignment.bottomCenter,
    
            child: Padding(
              padding: const EdgeInsets.all(16.0),
    
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
    
                  child: Wrap(
                    runSpacing: 20,
    
                    children: [
                      TextFormField(
                        initialValue: formData['name'].toString(),
                        style: context.textStyles.secundaryTitle,
                        textInputAction: TextInputAction.next,
                        onSaved: (name) => formData['name'] = name ?? '',
    
                        decoration: InputDecoration(
                          label: Text(
                            'Nome de usuário',
                            style: context.textStyles.titleMedium,
                          ),
                        ),
                        
                        validator: Validatorless.required('Obrigatório!'),
                      ),
    
                      TextFormField(
                        initialValue: formData['course'].toString(),
                        style: context.textStyles.secundaryTitle,
                        textInputAction: TextInputAction.next,
    
                        onSaved: (classroom) =>
                            formData['course'] = classroom ?? '',
    
                        decoration: const InputDecoration(
                          label: Text('Curso'),
                        ),
    
                        validator: Validatorless.required('Obrigatório!'),
                      ),
    
                      TextFormField(
                        initialValue: formData['period'].toString(),
                        style: context.textStyles.secundaryTitle,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
    
                        onFieldSubmitted: (_) => updateUserValues(),
    
                        onSaved: (period) =>
                            formData['period'] = int.parse(period ?? ''),
                            
                        decoration: const InputDecoration(
                          label: Text('Período Atual'),
                        ),
    
                        validator: Validatorless.required('Obrigatório!'),
                      ),
    
                      Button(title: 'Salvar', action: updateUserValues),
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
