import 'package:flutter/material.dart';
import 'package:netflix_app/api/api.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/models/new_and_hot_model.dart';
import 'package:netflix_app/presentation/downloads/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_app/presentation/downloads/new_and_hot/widgets/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatefulWidget {
  const ScreenNewAndHot({super.key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {
  late Future<List<NewAndHotModel>> comingSoonlist;
  late Future<List<NewAndHotModel>> everyonesWatchinglist;


  @override
  void initState() {
   
    super.initState();
    comingSoonlist = Api().getComingSoon();
    everyonesWatchinglist = Api().getEveryOnesWatching();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              title: const Text(
                'New & Hot',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.cast),
                  color: Colors.white,
                  iconSize: 30,
                ),
                kwidth,
                Container(
                  width: 30,
                  height: 20,
                  color: Colors.blue,
                ),
                kwidth,
              ],
              bottom: TabBar(
                  isScrollable: true,
                  labelColor: kblackColor,
                  unselectedLabelColor: kwhiteColor,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                    color: kwhiteColor,
                    borderRadius: kRadius20,
                  ),
                  tabs: const [
                    Tab(text: '🍿 Coming Soon'),
                    Tab(text: "👀 Everyone's Watching")
                  ]),
            ),
          ),
          body: TabBarView(children: [
            // _buildComingSoon(),
            FutureBuilder(
                future: comingSoonlist,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    //final data = snapshot.hasData;
                    return _buildComingSoon(snapshot);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            //_buildEveryonesWatchimg(context)
                FutureBuilder(
                future: everyonesWatchinglist,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    //final data = snapshot.hasData;
                    return _buildEveryonesWatching(snapshot);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),

          ])),
    );
  }

  Widget _buildComingSoon(AsyncSnapshot<List<NewAndHotModel>>snapshot) {
    
    return ListView.builder(
         
        itemCount: snapshot.data!.length,      
        itemBuilder: (BuildContext context, index){
          final result = snapshot.data![index];
          return ComingSoonWidget(newAndHotModel: result);
        }); 
  }

  Widget _buildEveryonesWatching(AsyncSnapshot<List<NewAndHotModel>>snapshot) {
    return ListView.builder(
        itemCount: snapshot.data!.length,      
        itemBuilder: (BuildContext context, index){
          final result = snapshot.data![index];
          return EveryonesWatchingWIdget(newAndHotModel: result);
        }); 
  }
}




















// class ScreenNewAndHot extends StatelessWidget {
//   const ScreenNewAndHot({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//           appBar: PreferredSize(
//             preferredSize: const Size.fromHeight(90),
//             child: AppBar(
//               title: const Text(
//                 'New & Hot',
//                 style: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.w900,
//                     color: Colors.white),
//               ),
//               actions: [
//                 IconButton(
//                   onPressed: () {},
//                   icon: const Icon(Icons.cast),
//                   color: Colors.white,
//                   iconSize: 30,
//                 ),
//                 kwidth,
//                 Container(
//                   width: 30,
//                   height: 20,
//                   color: Colors.blue,
//                 ),
//                 kwidth,
//               ],
//               bottom: TabBar(
//                   isScrollable: true,
//                   labelColor: kblackColor,
//                   unselectedLabelColor: kwhiteColor,
//                   labelStyle: const TextStyle(
//                       fontSize: 16, fontWeight: FontWeight.bold),
//                   indicator: BoxDecoration(
//                     color: kwhiteColor,
//                     borderRadius: kRadius20,
//                   ),
//                   tabs: const [
//                     Tab(text: '🍿 Coming Soon'),
//                     Tab(text: "👀 Everyone's Watching")
//                   ]),
//             ),
//           ),
//           body: TabBarView(children: [
//             _buildComingSoon(),
//             _buildEveryonesWatchimg(context)
//           ])),
//     );
//   }

//   Widget _buildComingSoon() {
//     return ListView.builder(
//         itemCount: 10,
//         itemBuilder: (BuildContext context, index) => const ComingSoonWidget());
//   }

//   Widget _buildEveryonesWatchimg(BuildContext context) {
//     return ListView.builder(
//       itemCount: 10,
//       itemBuilder: (BuildContext context, index) => const EveryonesWatchingWIdget());
//   }
// }

