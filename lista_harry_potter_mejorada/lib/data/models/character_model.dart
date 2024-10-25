class CharacterModel {
  final String name;
  final String house;
  final String image;
  final String dateOfBirth;
  final String species;

  CharacterModel({
    required this.name,
    required this.house,
    required this.image,
    required this.dateOfBirth,
    required this.species,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      name: json['name'] ?? 'Unknown',
      house: json['house'] ?? 'Unknown',
      image: (json['image'].isNotEmpty) ? json['image'] : 'https://www.shutterstock.com/image-vector/chinese-folklore-dragon-suitable-new-600nw-2311376525.jpg',
      dateOfBirth: json['dateOfBirth'] ?? 'Unknown',
      species: json['species'] ?? 'Unknown',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'house': house,
      'image': image,
      'dateOfBirth': dateOfBirth,
      'species': species,
    };
  }
}
