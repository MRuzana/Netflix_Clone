import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_app/api/api.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/models/downloads_model.dart';
import 'package:netflix_app/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_app/presentation/widgets/background_card.dart';
import 'package:netflix_app/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  late Future<List<DownloadsModel>> trendingImagelist;
  late Future<List<DownloadsModel>> lastYearMoviesList;
  late Future<List<DownloadsModel>> tenseDramas;
  late Future<List<DownloadsModel>> southIndianMovies;
  late Future<List<DownloadsModel>> topTvShows;
   

  @override
  void initState() {
    super.initState();
    trendingImagelist = Api().getTrendingMovies();
    lastYearMoviesList = Api().getLastYearMovies();
    tenseDramas = Api().getTenseDramas();
    southIndianMovies = Api().getSouthIndianMovies();
    topTvShows = Api().getTopTvShows();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    ListView(
                      children:  [
                        const BackgroundCard(),
                        kHeight,
                      //  MainTitleCard(cardTitle: 'Released in the past year'),
                      SizedBox(
                        child: FutureBuilder(
                          future: lastYearMoviesList, 
                          builder: (context,snapshot){
                            if(snapshot.hasError){
                              return Center(child: Text(snapshot.error.toString()));
                            }
                            else if(snapshot.hasData){
                              return MainTitleCard(cardTitle: 'Released in the past year', snapshot: snapshot);
                            }
                            else{
                              return const Center(child: CircularProgressIndicator(),);
                            }
                          }),
                      ),
                        kHeight,
                        SizedBox(
                          child: FutureBuilder(
                            future: trendingImagelist, 
                            builder: (context,snapshot){
                              if(snapshot.hasError){
                                return Center(
                                  child: Text(snapshot.error.toString()),
                                );
                              }
                              else if(snapshot.hasData){                            
                                return MainTitleCard(cardTitle: 'Trending Now',snapshot: snapshot);
                              }
                              else{
                                return const Center(child: CircularProgressIndicator(),);
                              }
                            }),
                        ),
                        // MainTitleCard(
                        //   cardTitle: 'Trending Now',
                        // ),
                        kHeight,
                       
                       // const NumberTitleCard(snapshot: snapshot,),
                       SizedBox(
                          child: FutureBuilder(
                            future: topTvShows, 
                            builder: (context,snapshot){
                              if(snapshot.hasError){
                                return Center(
                                  child: Text(snapshot.error.toString()),
                                );
                              }
                              else if(snapshot.hasData){
                                //final data = snapshot.hasData;
                                return NumberTitleCard(snapshot: snapshot);
                              }
                              else{
                                return const Center(child: CircularProgressIndicator(),);
                              }
                            }),
                        ),
                        kHeight,
                        SizedBox(
                          child: FutureBuilder(
                            future: tenseDramas, 
                            builder: (context,snapshot){
                              if(snapshot.hasError){
                                return Center(
                                  child: Text(snapshot.error.toString()),
                                );
                              }
                              else if(snapshot.hasData){
                                //final data = snapshot.hasData;
                                return MainTitleCard(cardTitle: 'Tense Dramas',snapshot: snapshot);
                              }
                              else{
                                return const Center(child: CircularProgressIndicator(),);
                              }
                            }),
                        ),
                      //  MainTitleCard(cardTitle: 'Tense Dramas'),
                        kHeight,

                        SizedBox(
                          child: FutureBuilder(
                            future: southIndianMovies, 
                            builder: (context,snapshot){
                              if(snapshot.hasError){
                                return Center(
                                  child: Text(snapshot.error.toString()),
                                );
                              }
                              else if(snapshot.hasData){
                                //final data = snapshot.hasData;
                                return MainTitleCard(cardTitle: 'South Indian cinemas',snapshot: snapshot);
                              }
                              else{
                                return const Center(child: CircularProgressIndicator(),);
                              }
                            }),
                        ),
                       // MainTitleCard(cardTitle: 'South Indian cinemas',),
                        kHeight,
                      ],
                    ),
                    scrollNotifier.value == true
                        ? AnimatedContainer(
                          duration: const Duration(milliseconds: 1000),
                            width: double.infinity,
                            height: 90,
                            color: Colors.black.withOpacity(0.3),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      'https://i.redd.it/gj1t3nckxyx61.png',
                                      width: 60,
                                      height: 60 ,
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.cast),
                                      color: Colors.white,
                                      iconSize: 30,
                                    ),
                                    kwidth,
                                    Container(
                                      width: 30,
                                      height: 30,
                                      color: Colors.blue,
                                    ),
                                    kwidth,
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('TV Shows',style: kHomeTitletext),
                                    Text('Movies',style: kHomeTitletext),
                                    Text('Categories',style: kHomeTitletext),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : kHeight,
                  ],
                ),
              );
            }));
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.icon, required this.title,this.iconSize = 30,this.textSize = 18});
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhiteColor,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: textSize,
          ),
        )
      ],
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: ValueListenableBuilder(
//             valueListenable: scrollNotifier,
//             builder: (context, index, _) {
//               return NotificationListener<UserScrollNotification>(
//                 onNotification: (notification) {
//                   final ScrollDirection direction = notification.direction;
                  
//                   if (direction == ScrollDirection.reverse) {
//                     scrollNotifier.value = false;
//                   } else if (direction == ScrollDirection.forward) {
//                     scrollNotifier.value = true;
//                   }
//                   return true;
//                 },
//                 child: Stack(
//                   children: [
//                     ListView(
//                       children:  [
//                         BackgroundCard(),
//                         kHeight,
//                         MainTitleCard(cardTitle: 'Released in the past year'),
//                         kHeight,
//                         SizedBox(
//                           child: FutureBuilder(
//                             future: trendingImagelist, 
//                             builder: (context,snapshot){
//                               if(snapshot.hasError){
//                                 return Center(
//                                   child: Text(snapshot.error.toString()),
//                                 );
//                               }
//                               else if(snapshot.hasData){
//                                 final data = snapshot.hasData;
//                                 return MainTitleCard(cardTitle: 'Trending Now');
//                               }
//                               else{
//                                 return const Center(child: CircularProgressIndicator(),);
//                               }
//                             }),
//                         ),
//                         // MainTitleCard(
//                         //   cardTitle: 'Trending Now',
//                         // ),
//                         kHeight,
//                         NumberTitleCard(),
//                         kHeight,
//                         MainTitleCard(cardTitle: 'Tense Dramas'),
//                         kHeight,
//                         MainTitleCard(
//                           cardTitle: 'South Indian cinemas',
//                         ),
//                         kHeight,
//                       ],
//                     ),
//                     scrollNotifier.value == true
//                         ? AnimatedContainer(
//                           duration: const Duration(milliseconds: 1000),
//                             width: double.infinity,
//                             height: 90,
//                             color: Colors.black.withOpacity(0.3),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Image.network(
//                                       'https://i.redd.it/gj1t3nckxyx61.png',
//                                       width: 60,
//                                       height: 60 ,
//                                     ),
//                                     const Spacer(),
//                                     IconButton(
//                                       onPressed: () {},
//                                       icon: const Icon(Icons.cast),
//                                       color: Colors.white,
//                                       iconSize: 30,
//                                     ),
//                                     kwidth,
//                                     Container(
//                                       width: 30,
//                                       height: 30,
//                                       color: Colors.blue,
//                                     ),
//                                     kwidth,
//                                   ],
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     Text('TV Shows',style: kHomeTitletext),
//                                     Text('Movies',style: kHomeTitletext),
//                                     Text('Categories',style: kHomeTitletext),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           )
//                         : kHeight,
//                   ],
//                 ),
//               );
//             }));
//   }
// }

// class CustomButton extends StatelessWidget {
//   const CustomButton({super.key, required this.icon, required this.title,this.iconSize = 30,this.textSize = 18});
//   final IconData icon;
//   final String title;
//   final double iconSize;
//   final double textSize;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Icon(
//           icon,
//           color: kwhiteColor,
//           size: iconSize,
//         ),
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: textSize,
//           ),
//         )
//       ],
//     );
//   }
// }
