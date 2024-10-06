class Usuario {
  String nombre;
  String apellidos;
  num edad;
  String email;
  String sexo;
  List<String> aficiones;

  Usuario({
    required this.nombre,
    required this.apellidos,
    required this.edad,
    required this.email,
    required this.sexo,
    required this.aficiones,
  });
}
