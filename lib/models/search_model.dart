class SearchModel{
  String? posterPath;
  String movieName;

  SearchModel({
    required this.movieName,
    required this.posterPath,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json){
    return SearchModel(
      movieName: json['title'], 
      posterPath: json['poster_path'] ?? 'https://media.themoviedb.org/t/p/w188_and_h282_bestv2/iUgeT99RHVdqkExrW7X0poE0BIB.jpg'
    );
  }
}