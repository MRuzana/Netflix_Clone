class DownloadsModel{
  String? posterPath;

  DownloadsModel({
    required this.posterPath,
  });

  factory DownloadsModel.fromJson(Map<String,dynamic> json){
    return DownloadsModel(
      posterPath: json['poster_path'] ?? 'https://media.themoviedb.org/t/p/w188_and_h282_bestv2/iUgeT99RHVdqkExrW7X0poE0BIB.jpg'
    );
  }
}
