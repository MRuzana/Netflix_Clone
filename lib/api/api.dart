import 'dart:convert';
import 'package:netflix_app/api/api_constants.dart';
import 'package:netflix_app/models/downloads_model.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_app/models/new_and_hot_model.dart';
import 'package:netflix_app/models/search_model.dart';

class Api{
  static const _downloads = 'https://api.themoviedb.org/3/trending/all/day?api_key=${ApiConstants.apikey}';
  //Home
  static const _lastyearMovies = 'https://api.themoviedb.org/3/discover/movie?api_key=${ApiConstants.apikey}&primary_release_year=2024';
  static const _tenseDramas = 'https://api.themoviedb.org/3/tv/airing_today?api_key=${ApiConstants.apikey}';
  static const _southIndianMovies = 'https://api.themoviedb.org/3/discover/movie?api_key=${ApiConstants.apikey}&with_original_language=ml';
  static const _topTvShows = 'https://api.themoviedb.org/3/discover/tv?api_key=${ApiConstants.apikey}';
  
  //New and Hot
  static const _everyonesWatching = 'https://api.themoviedb.org/3/movie/popular?api_key=68e9e9308f6e9274bac23d96c611394e';
  static const _comingSoon = 'https://api.themoviedb.org/3/movie/upcoming?api_key=${ApiConstants.apikey}';

  //search
  static const _searchIdle = 'https://api.themoviedb.org/3/trending/movie/week?api_key=${ApiConstants.apikey}';
  //static const _searchResult = 'https://api.themoviedb.org/3/search/movie?api_key=${ApiConstants.apikey}&query=$searchQuery';

  //fastlaugh
  static const _fastlaughImage = 'https://api.themoviedb.org/3/trending/all/day?api_key=${ApiConstants.apikey}';


  Future<List<DownloadsModel>> getTrendingMovies()async{
    final response = await http.get(Uri.parse(_downloads));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((image) => DownloadsModel.fromJson(image)).toList();
    }
    else{
      throw Exception('Something happened');
    }
  }

  Future<List<DownloadsModel>>getLastYearMovies()async{
    final response = await http.get(Uri.parse(_lastyearMovies));
    if(response.statusCode == 200){
      final decodedData = jsonDecode(response.body)['results'] as List;
      return decodedData.map((image) => DownloadsModel.fromJson(image)).toList();
    }
    else{
      throw Exception('Something happened');
    }
  }

  Future<List<DownloadsModel>> getTenseDramas()async{
    final response = await http.get(Uri.parse(_tenseDramas));

    if(response.statusCode == 200){
      final decodedData = jsonDecode(response.body)['results'] as List;
       return decodedData.map((image) => DownloadsModel.fromJson(image)).toList();
    }
    else{
      throw Exception('Something happened');
    }
  }

  Future<List<DownloadsModel>> getSouthIndianMovies()async{
    final response = await http.get(Uri.parse(_southIndianMovies));

    if(response.statusCode == 200){
      final decodedData = jsonDecode(response.body)['results'] as List;
       return decodedData.map((image) => DownloadsModel.fromJson(image)).toList();
    }
    else{
      throw Exception('Something happened');
    }
  }

  Future<List<DownloadsModel>> getTopTvShows()async{
    final response = await http.get(Uri.parse(_topTvShows));

    if(response.statusCode == 200){
      final decodedData = jsonDecode(response.body)['results'] as List;
       return decodedData.map((image) => DownloadsModel.fromJson(image)).toList();
    }
    else{
      throw Exception('Something happened');
    }
  }

  Future<List<NewAndHotModel>> getComingSoon()async{
    final response = await http.get(Uri.parse(_comingSoon));

    if(response.statusCode == 200){
      final decodedData = jsonDecode(response.body)['results'] as List;
       return decodedData.map((movie) => NewAndHotModel.fromJson(movie)).toList();
    }
    else{
      throw Exception('Something happened');
    }
  }

  Future<List<NewAndHotModel>> getEveryOnesWatching()async{
    final response = await http.get(Uri.parse(_everyonesWatching));

    if(response.statusCode == 200){
      final decodedData = jsonDecode(response.body)['results'] as List;
       return decodedData.map((movie) => NewAndHotModel.fromJson(movie)).toList();
    }
    else{
      throw Exception('Something happened');
    }
  }

  Future<List<SearchModel>> getSearchIdle()async{
    final response = await http.get(Uri.parse(_searchIdle));

    if(response.statusCode == 200){
      final decodedData = jsonDecode(response.body)['results'] as List;
       return decodedData.map((movie) => SearchModel.fromJson(movie)).toList();
    }
    else{
      throw Exception('Something happened');
    }
  }

  Future<List<SearchModel>> getSearchResult(String searchQuery)async{
   
    final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/search/movie?query=$searchQuery&api_key=${ApiConstants.apikey}'));

    if(response.statusCode == 200){
      final decodedData = jsonDecode(response.body)['results'] as List;
       return decodedData.map((movie) => SearchModel.fromJson(movie)).toList();
    }
    else{
      throw Exception('Something happened');
    }
  }

 Future<List<DownloadsModel>> getFastLaughImages()async{
    final response = await http.get(Uri.parse(_fastlaughImage));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((image) => DownloadsModel.fromJson(image)).toList();
    }
    else{
      throw Exception('Something happened');
    }
  }
  
}

