class Newsproduct {
  late String description;
  //late String name;
  late String imageurl;
  //late int id;
  late String title;
  Newsproduct(
      {required this.description,
      //required this.name,
      required this.imageurl,
      //required this.id,
      required this.title});

  static Newsproduct fromJSON(dynamic map) {
    return Newsproduct(
        description: map['description'] ?? '',
        // name: map['name'] ?? '',
        imageurl: map['urlToImage'] ?? '',
        //id: map['id'] ?? '',
        title: map['title'] ?? '');
  }
}
