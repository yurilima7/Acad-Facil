import 'package:flutter/material.dart';

class GradesScreen extends StatelessWidget {
  const GradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),

      child: Scaffold(
        appBar: AppBar(
          title: const Text('Médias'),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),

        body: Padding(
          padding: const EdgeInsets.all(20.0),

          child: Column(
            children: [
              Expanded(),
            ],
          ),
        ),
      ),
    );
  }
}