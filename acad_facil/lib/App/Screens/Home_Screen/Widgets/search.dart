import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  final Function(String) onChanged;

  const Search({
    super.key,
    required this.onChanged,
  });

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  
  @override
  Widget build(BuildContext context) {
    return TextFormField( 
      // coloração do texto digitado
      style: const TextStyle(color: Colors.white),
      onChanged: widget.onChanged,

      decoration: InputDecoration(
        border: OutlineInputBorder(
          // definindo o tamanho das bordas
          borderRadius: BorderRadius.circular(26.0),
        ),

        labelText: 'Pesquise uma Disciplina', // texto a ser exibido na label

        labelStyle: const TextStyle(
          color: Colors.white,
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color(0xFFFFFFFF),
          ), // define a cor da borda quando não selecionado o input

          borderRadius: BorderRadius.circular(
            26.0,
          ), // define as bordas, para manter o padrão
        ),

        focusedBorder:OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(26.0),
        ),

        prefixIcon: const Icon(Icons.search, color: Colors.white,),  

        filled: true,    
      ),
      
    );
  }
}
