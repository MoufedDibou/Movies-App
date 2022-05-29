

class MovieModel{
  final String imdbId;
  final String poster;
  final String title;
  final String year;

  MovieModel({
    required  this.imdbId,
    required  this.poster,
    required   this.title,
    required  this.year});


  factory MovieModel.fromJson(Map<String,dynamic> json) =>
      MovieModel(
        imdbId: json['imdbID'],
        poster: json['Poster'],
        title: json['Title'],
        year: json['Year']
      );
}