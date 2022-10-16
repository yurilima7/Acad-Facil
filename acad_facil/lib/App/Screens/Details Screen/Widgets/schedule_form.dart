import 'package:flutter/material.dart';

class ScheduleForm extends StatelessWidget {
  const ScheduleForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 70,
          width: 35,
          
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.white,
            ),

            borderRadius: BorderRadius.circular(20.0)
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: const [
              Text(
                'SEG',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}