class NewAndHotModel{
  String title;
  String description;
  String? posterPath;

  NewAndHotModel({
    required this.title,
    required this.description,
    required this.posterPath
  });

  factory NewAndHotModel.fromJson(Map<String,dynamic> json){
    return NewAndHotModel(
      title: json['title'], 
      description: json['overview'], 
      posterPath: json['poster_path'] ?? 'https://media.themoviedb.org/t/p/w188_and_h282_bestv2/iUgeT99RHVdqkExrW7X0poE0BIB.jpg'
    );
  }
}