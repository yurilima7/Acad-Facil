class Materia {
  String id;
  String nome;
  String sala;
  int periodo;
  Map<String, double> notas;
  Map<String, String> horario;
  double media;

  Materia({
    required this.id,
    required this.nome,
    required this.sala,
    required this.notas,
    required this.periodo,
    required this.horario,
    required this.media,
  });
}
