import 'package:flutter/material.dart';
import 'package:netflix_app/api/api_constants.dart';
import 'package:netflix_app/core/colors.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  final AsyncSnapshot snapshot;
  const VideoListItem({super.key,required this.index,required this.snapshot});
 
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
         // color: Colors.accents[index % Colors.accents.length],
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage('${ApiConstants.kBaseUrl}${snapshot.data[index].posterPath}'))
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// left side
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 30,
                  child: IconButton(onPressed: (){}, icon: const Icon(Icons.volume_off,
                  color: kwhiteColor,
                  size: 30,
                  )),
                ),

                /// right side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage('${ApiConstants.kBaseUrl}${snapshot.data[index].posterPath}',),
                      ),
                    ),
                    const VideoActionsWidget(icon: Icons.emoji_emotions, title: 'LOL'),
                    const VideoActionsWidget(icon: Icons.add, title: 'My List'),
                    const VideoActionsWidget(icon: Icons.share, title: 'Share'),
                    const VideoActionsWidget(icon: Icons.play_arrow, title: 'Play')
                  ],
                ),
                
               
              ],
            ),
          ),
        ),
      ]
    );
  }
}

class VideoActionsWidget extends StatelessWidget {

  final IconData icon;
  final String title;
  const VideoActionsWidget({super.key,required this.icon,required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Column(
        children: [
          Icon(icon,color: Colors.white,size: 30,),
          Text(title,style: const TextStyle(
            color: kwhiteColor,fontSize: 14,
          ),),
          
        ],
      ),
    );
  }
}
















// class VideoListItem extends StatelessWidget {
//   final int index;
//   const VideoListItem({super.key,required this.index});
 
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           color: Colors.accents[index % Colors.accents.length],
//         ),
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 /// left sidde
//                 CircleAvatar(
//                   backgroundColor: Colors.black.withOpacity(0.5),
//                   radius: 30,
//                   child: IconButton(onPressed: (){}, icon: const Icon(Icons.volume_off,
//                   color: kwhiteColor,
//                   size: 30,
//                   )),
//                 ),

//                 /// right side
//                 const Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 10),
//                       child: CircleAvatar(
//                         radius: 30,
//                         backgroundImage: NetworkImage('https://media.themoviedb.org/t/p/w440_and_h660_face/d5NXSklXo0qyIYkgV94XAgMIckC.jpg',),
//                       ),
//                     ),
//                     VideoActionsWidget(icon: Icons.emoji_emotions, title: 'LOL'),
//                     VideoActionsWidget(icon: Icons.add, title: 'My List'),
//                     VideoActionsWidget(icon: Icons.share, title: 'Share'),
//                     VideoActionsWidget(icon: Icons.play_arrow, title: 'Play')
//                   ],
//                 ),
                
               
//               ],
//             ),
//           ),
//         ),
//       ]
//     );
//   }
// }

// class VideoActionsWidget extends StatelessWidget {

//   final IconData icon;
//   final String title;
//   const VideoActionsWidget({super.key,required this.icon,required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
//       child: Column(
//         children: [
//           Icon(icon,color: Colors.white,size: 30,),
//           Text(title,style: const TextStyle(
//             color: kwhiteColor,fontSize: 14,
//           ),),
//         ],
//       ),
//     );
//   }
// }