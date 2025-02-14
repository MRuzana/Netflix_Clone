import 'package:flutter/material.dart';
import 'package:netflix_app/api/api.dart';
import 'package:netflix_app/models/downloads_model.dart';
import 'package:netflix_app/presentation/downloads/fast_laughs/widgets/video_list_item.dart';

class ScreenFastLaughs extends StatefulWidget {
  const ScreenFastLaughs({super.key});

  @override
  State<ScreenFastLaughs> createState() => _ScreenFastLaughsState();
}

class _ScreenFastLaughsState extends State<ScreenFastLaughs> {
  late Future<List<DownloadsModel>> imagelist;

  @override
  void initState() {
    super.initState();
    imagelist = Api().getFastLaughImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future: imagelist,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else if (snapshot.hasData) {
                   return PageView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(snapshot.data!.length, (index) {
                    return VideoListItem(
                      index: index,
                      snapshot: snapshot,
                    );
                  }),
                );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

              
              })),
    );
  }
}

// class ScreenFastLaughs extends StatelessWidget {
//   const ScreenFastLaughs({super.key});

//   @override
//   Widget build(BuildContext context) {
  
//     return  Scaffold(
//       body: SafeArea(child: PageView(
//         scrollDirection: Axis.vertical,
//         children: 
//           List.generate(20, (index) {
//             return VideoListItem(index: index);
//           })
        
//       ))
//     );
//   }
// }

