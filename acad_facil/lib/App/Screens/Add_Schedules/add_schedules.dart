import 'package:acad_facil/App/Controllers/disciplines_controller.dart';
import 'package:acad_facil/App/Core/Styles/button_styles.dart';
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Utils/messages.dart';
import 'package:acad_facil/App/Models/add_schedule_model.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddSchedules extends StatefulWidget {
  const AddSchedules({Key? key}) : super(key: key);

  @override
  State<AddSchedules> createState() => _AddSchedulesState();
}

class _AddSchedulesState extends State<AddSchedules> {
  final List days = ['SEGUNDA', 'TERÇA', 'QUARTA', 'QUINTA', 'SEXTA', 'SÁBADO'];
  bool isLoading = false;
  bool isClicked = false;
  String? day;
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  late TimeOfDay? picked;

  Future<void> selectStartTime(BuildContext context) async {
    picked = await showTimePicker(
      context: context,
      initialTime: startTime,
    );
    setState(() {
      startTime = picked!;
    });
  }

  Future<void> selectEndTime(BuildContext context) async {
    picked = await showTimePicker(
      context: context,
      initialTime: endTime,
    );
    setState(() {
      endTime = picked!;
    });
  }

  Widget button(int pos, String title) {
    return TextButton(
      onPressed: () {
          setState(() {
          isClicked = !isClicked;
          day = days.elementAt(pos);
        });
      },

      child: Text(
        title,
        style: isClicked 
        ? context.textStyles.mainTitleBlue
        : context.textStyles.mainTitle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final disciplinesProvider = Provider.of<DisciplinesControler>(context);
    Disciplines disciplines =
        ModalRoute.of(context)!.settings.arguments as Disciplines;

    Map<String, String> schedules(String day, String duration) {
      disciplines.schedule.addAll(
        {day: duration},
      );
      return disciplines.schedule;
    }
        
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Inserir Horário'),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
    
        body: Align(
          alignment: Alignment.bottomCenter,
    
          child: Padding(
            padding: const EdgeInsets.all(10.0),
    
            child: SingleChildScrollView(
    
              child:Wrap(
                runSpacing: 10,
    
                children: [
                  Visibility(
                    visible: isClicked == false,
    
                    child: Wrap(
                      children: [
                        Row(
                          children: [
                            Text('Selecione uma data', style: TextStyles.i.mainTitle,),
                          ],
                        ),
    
                        Row(             
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,   
                          children: [
                            button(0, 'Seg'),
                            button(1, 'Ter'),
                            button(2, 'Qua'),
                            button(3, 'Qui'),
                            button(4, 'Sex'),
                            button(5, 'Sab'),
                          ],
                        ),
                      ],
                    ),
                  ),
    
                  Visibility(
                    visible: isClicked == true,
    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      
                      children: [
                        Text(
                          'Data selecionada: $day',
                          style: TextStyles.i.mainTitleBlue,
                        ),
    
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isClicked = !isClicked;
                            });
                          },
                          child: Text('Selecionar nova data', style: TextStyles.i.mainTitle,),
                        ),
                      ],
                    ), 
                  ),
    
                  GestureDetector(
                    onTap: () => selectStartTime(context),
                    
                    child: Row(
                      children: [
                        Icon(Icons.alarm, size: 32, color: ColorsStyles.white,),
                        const SizedBox(width: 5,),
                        Text('Início da Aula', style: TextStyles.i.mainTitle,),
                      ],
                    ),
                  ),
    
                  GestureDetector(
                    onTap: () => selectEndTime(context),
                    
                    child: Row(
                      children: [
                        Icon(Icons.alarm, size: 32, color: ColorsStyles.white,),
                        const SizedBox(width: 5,),
                        Text('Fim da Aula', style: TextStyles.i.mainTitle,),
                      ],
                    ),
                  ),                
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                    children: [
                      Text(
                        'Salvar',
                        style: context.textStyles.authTitle,
                      ),
          
                      isLoading
                        ? CircularProgressIndicator(color: ColorsStyles.terciary,)
                        : ElevatedButton(
                            onPressed: () async {
      
                              if ((startTime != endTime) && day != null) {
                                setState(() {
                                  isLoading = true;
                                });
                                
                                await disciplinesProvider.addSchedules(
                                  AddScheduleModel(
                                    id: disciplines.id,
                                    schedule: schedules(
                                      day!.substring(0, 3),
                                      '${startTime.hour}:${startTime.minute} - ${endTime.hour}:${endTime.minute}',
                                    ),
                                    mounted: mounted,
                                    day: day!,
                                    discipline: disciplines.name,
                                    duration:
                                        '${startTime.hour}:${startTime.minute} - ${endTime.hour}:${endTime.minute}',
                                  ),
                                );
                          
                                setState(() {
                                  isLoading = false;
                                });
                              }
                              else {
                                Messages.showError(
                                  'Erro ao inserir, verifique se horário de início e término estão corretos',
                                );
                              }
                            },
                            style: context.buttonStyles.circleButton,
                            child: const Icon(Icons.arrow_forward),
                          ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
