import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/api/api.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/models/search_model.dart';
import 'package:netflix_app/presentation/downloads/search/widgets/search_idle.dart';
import 'package:netflix_app/presentation/downloads/search/widgets/search_result.dart';

//const imageUrl = 'https://media.themoviedb.org/t/p/w500_and_h282_face/dbEuTZAZxftsQ9IdEoTm7CutD32.jpg';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  late Future<List<SearchModel>> searchIdleList;
  String searchQuery = '';
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    searchIdleList = Api().getSearchIdle();
  }
  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();

  }
            
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              onChanged: (value) {

                if (_debounce?.isActive ?? false) _debounce?.cancel();
                _debounce = Timer(const Duration(milliseconds: 700), () {
                  setState(() {
                    searchQuery = value;
                  });       
                });            
              },
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
              style: const TextStyle(color: Colors.grey),
            ),
            kHeight,
            Expanded(child: 
              searchQuery.isEmpty
              ? FutureBuilder(
                  future: searchIdleList, 
                  builder: (context,snapshot){
                    if(snapshot.hasError){
                      return Center(
                      child: Text(snapshot.error.toString()));
                    }
                    else if(snapshot.hasData){
                      return SearchIdleWidget(snapshot: snapshot);
                    }
                    else{
                      return const Center(child: CircleAvatar(),);
                    }
                  }
                )
              : FutureBuilder(
                  future: Api().getSearchResult(searchQuery), 
                  builder: (context,snapshot){
                     if(snapshot.hasError){
                      return Center(
                      child: Text(snapshot.error.toString()));
                    }
                    else if(snapshot.hasData){
                      return SearchResultWidget(snapshot: snapshot);
                    }
                    else{
                      return const Center(child: CircleAvatar(),);
                    }
                  }
                )
            )        
          ],
        ),
      )),
    );
  }
}

   // Expanded(
            //   child: FutureBuilder(
            //       future: searchIdleList,
            //       builder: (context, snapshot) {
            //         if (snapshot.hasError) {
            //           return Center(
            //             child: Text(snapshot.error.toString()),
            //           );
            //         } else if (snapshot.hasData) {
            //           //final data = snapshot.hasData;
            //           return SearchIdleWidget(
            //             snapshot: snapshot,
            //           );
            //         } else {
            //           return const Center(
            //             child: CircularProgressIndicator(),
            //           );
            //         }
            //       }),
            // ),
            // //Expanded(child: SearchResultWidget()),
            // Expanded(
            //     child: FutureBuilder(
            //         future: searchQuery.isEmpty
            //             ? searchIdleList
            //             : Api().getSearchResult(searchQuery),
            //         builder: (context, snapshot) {
            //           if (snapshot.hasError) {
            //             return Center(
            //               child: Text(snapshot.error.toString()),
            //             );
            //           } else if (snapshot.hasData) {
            //             //final data = snapshot.hasData;
            //             return SearchResultWidget(snapshot: snapshot,);
            //           } else {
            //             return const Center(
            //               child: CircularProgressIndicator(),
            //             );
            //           }
            //         }))




// class ScreenSearch extends StatelessWidget {
//   const ScreenSearch({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: SafeArea(child: Padding(
//         padding: EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CupertinoSearchTextField(
//               prefixIcon: Icon(CupertinoIcons.search,color: Colors.grey,),
//               suffixIcon: Icon(CupertinoIcons.xmark_circle_fill,color: Colors.grey,),
//               style: TextStyle(color: Colors.grey),
//             ),
//             kHeight,
            
//             Expanded(child: SearchIdleWidget()),
//             //Expanded(child: SearchResultWidget()),
//           ],
//         ),
//       )),
//     );
//   }
// }