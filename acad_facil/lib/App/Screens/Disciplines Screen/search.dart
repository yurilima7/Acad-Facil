import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  
  @override
  Widget build(BuildContext context) {
    return TextFormField( 
      // coloração do texto digitado
      style: const TextStyle(
            color: Colors.white),

      decoration: InputDecoration(

        floatingLabelBehavior:
            FloatingLabelBehavior.never, // desativa a subida da label
       
        border: OutlineInputBorder(
          // definindo o tamanho das bordas
          borderRadius: BorderRadius.circular(20.0),
        ),

        labelText: 'Pesquise', // texto a ser exibido na label

        labelStyle: const TextStyle(
          color: Colors.white,
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color(0xFFFFFFFF),
          ), // define a cor da borda quando não selecionado o input

          borderRadius: BorderRadius.circular(
            30.0,
          ), // define as bordas, para manter o padrão
        ),
            
      ),
    );
  }
}
