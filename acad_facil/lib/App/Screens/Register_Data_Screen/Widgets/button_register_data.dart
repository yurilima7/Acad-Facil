import 'package:acad_facil/App/Controllers/user_controller.dart';
import 'package:acad_facil/App/Core/Styles/button_styles.dart';
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonRegisterData extends StatefulWidget {
  final String course;
  final String period;
  final GlobalKey<FormState> formKey;

  const ButtonRegisterData({
    Key? key,
    required this.course,
    required this.period,
    required this.formKey,
  }) : super(key: key);

  @override
  State<ButtonRegisterData> createState() => _ButtonRegisterDataState();
}

class _ButtonRegisterDataState extends State<ButtonRegisterData> {
  bool isLoading = false;
  
  @override
  Widget build(BuildContext context) {
    var providerUser = Provider.of<UserController>(context, listen: false);

    return isLoading
      ? CircularProgressIndicator(color: ColorsStyles.terciary,)
      : ElevatedButton(
        onPressed: () async {
          final valid = widget.formKey.currentState?.validate() ?? false;

          if (valid) {
            setState(() {
              isLoading = true;
            });

            await providerUser.addData(
              User(
                id: '',
                name: '',
                course: widget.course,
                period: int.tryParse(widget.period)!,
              ),
              context,
              mounted,
            );

            setState(() {
              isLoading = false;
            });
          }          
        },
        style: context.buttonStyles.circleButton,
        child: const Icon(Icons.arrow_forward),
      );
  }
}
