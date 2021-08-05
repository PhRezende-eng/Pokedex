class Pokemon {
  final String name;
  final String photo;
  final int id;
  final List<String> types;

  const Pokemon(
      {required this.name,
      required this.photo,
      required this.id,
      required this.types});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    List<String> types = [];
    json['types'].forEach(
      (type) => types.add(
        type["type"]['name'],
      ),
    );
    return Pokemon(
      name: json['name'],
      photo: json['sprites']['other']['official-artwork']['front_default'],
      id: json['id'],
      types: [],
    );
  }
}
