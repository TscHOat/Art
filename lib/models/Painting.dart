class Painting {
  final id;
  final int price;
  final width;
  final height;
  final String title;
  final String? type;
  final String artist;
  final String? year;
  final String? description;
  final String link;

  Painting(
    this.id,
    this.title,
    this.type,
    this.artist,
    this.year,
    this.price,
    this.width,
    this.height,
    this.description,
    this.link,
  );
  Painting.getDataFromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.title = json['title'],
        this.type = json['type'],
        this.artist = json['artist'],
        this.year = json['year'],
        this.price = json['price'],
        this.width = json['width'],
        this.height = json['height'],
        this.description = json['description'],
        this.link = 'http://192.168.1.8:8000' + json['link'];
}
