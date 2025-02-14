import 'package:flutter/material.dart';
import 'package:netflix_app/api/api_constants.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/widgets/number_card.dart';
import 'package:netflix_app/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
   final AsyncSnapshot snapshot;
  const NumberTitleCard({
    super.key,
     required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    children:  [
        const MainTitle(title: 'Top 10 TV shows in India Today'),
        kHeight,
      LimitedBox(
        maxHeight: 200,
        child: ListView.builder(
          itemBuilder: (context, index){
            return NumberCard(imageUrl: '${ApiConstants.kBaseUrl}${snapshot.data[index].posterPath}',index: index,);
          },
          itemCount: snapshot.data.length,

        scrollDirection: Axis.horizontal,
         
                
        ),
      ),
    ],
  );
  }
}



// class NumberTitleCard extends StatelessWidget {
//   const NumberTitleCard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//     children:  [
//         const MainTitle(title: 'Top 10 TV shows in India Today'),
//         kHeight,
//       LimitedBox(
//         maxHeight: 200,
//         child: ListView(
//         scrollDirection: Axis.horizontal,
//           children: 
//             List.generate(10, (index) =>  NumberCard(index: index)),
                
//         ),
//       ),
//     ],
//   );
//   }
// }