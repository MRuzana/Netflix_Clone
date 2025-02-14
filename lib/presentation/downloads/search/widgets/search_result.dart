import 'package:flutter/material.dart';
import 'package:netflix_app/api/api_constants.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/models/search_model.dart';
import 'package:netflix_app/presentation/downloads/search/widgets/title.dart';

//const imageUrl =  'https://media.themoviedb.org/t/p/w440_and_h660_face/d5NXSklXo0qyIYkgV94XAgMIckC.jpg';

class SearchResultWidget extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const SearchResultWidget({super.key,required this.snapshot});

  @override
  Widget build(BuildContext context) {
    final List<SearchModel> searchResults = snapshot.data;
   
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & TV'),
        kHeight,
        Expanded(child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1 / 1.4,
          children: searchResults.isEmpty
          ? [const Center(child: Text('No data found'),)]
          : List.generate(searchResults.length, (index){
             final searchResult = searchResults[index];
            return MainCard(searchModel: searchResult,); 
          }),
          
          // children: 
          //   List.generate(20, (index){
          //     return const MainCard();
          //   }),
          
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final SearchModel searchModel;
  const MainCard({super.key,required this.searchModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(ApiConstants.kBaseUrl+searchModel.posterPath!),fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(7)
      ),
    );
  }
}











// class SearchResultWidget extends StatelessWidget {
//   final AsyncSnapshot snapshot;
//   const SearchResultWidget({super.key,required this.snapshot});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SearchTextTitle(title: 'Movies & TV'),
//         kHeight,
//         Expanded(child: GridView.count(
//           shrinkWrap: true,
//           crossAxisCount: 3,
//           mainAxisSpacing: 8,
//           crossAxisSpacing: 8,
//           childAspectRatio: 1 / 1.4,
//           children: 
//             List.generate(20, (index){
//               return const MainCard();
//             }),
          
//         ))
//       ],
//     );
//   }
// }

// class MainCard extends StatelessWidget {
//   const MainCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         image: const DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.cover),
//         borderRadius: BorderRadius.circular(7)
//       ),
//     );
//   }
// }