import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/models/new_and_hot_model.dart';
import 'package:netflix_app/presentation/home/screen_home.dart';
import 'package:netflix_app/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
 final NewAndHotModel newAndHotModel;

  const ComingSoonWidget({
    required this.newAndHotModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        
        const SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('FEB',style: TextStyle(
                fontSize: 16,
                color: kGrey,
              ),),
              Text('11',style: TextStyle(
                fontSize: 30,
                letterSpacing: 4,
                fontWeight: FontWeight.bold,
              ),)
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child:  Column(
          
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(newAndHotModel: newAndHotModel,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(newAndHotModel.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 25 ,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -3 ,
                      
                      
                    ),),
                  ),
                  const Spacer(),
                  const Expanded(
                    child: Row(
                      children: [
                        CustomButton(icon: Icons.all_out_sharp, title: 'Remind me',iconSize: 18,textSize: 11,),
                        kwidth,
                        CustomButton(icon: Icons.info, title: 'Info',iconSize: 18,textSize: 11,),
                        kwidth,
                        
                      ],
                    ),
                  ),
                  
                ],
              ),
              kHeight,
              const Text('Coming on Friday'),
              kHeight,
              Text(newAndHotModel.title,style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),),
              Expanded(child: Text(newAndHotModel.description,style: const TextStyle(color: kGrey),))                                                 
            ],
          ),
        ),
      ],
    );
  }
}













// class ComingSoonWidget extends StatelessWidget {
//   final AsyncSnapshot snapshot;
//   const ComingSoonWidget({
//     required this.snapshot,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Row(
//       children: [
        
//         const SizedBox(
//           width: 50,
//           height: 450,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text('FEB',style: TextStyle(
//                 fontSize: 16,
//                 color: kGrey,
//               ),),
//               Text('11',style: TextStyle(
//                 fontSize: 30,
//                 letterSpacing: 4,
//                 fontWeight: FontWeight.bold,
//               ),)
//             ],
//           ),
//         ),
//         SizedBox(
//           width: size.width - 50,
//           height: 450,
//           child: const Column(
          
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               VideoWidget(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('TALL GIRL2',style: TextStyle(
//                     fontSize: 35,
//                     fontWeight: FontWeight.bold,
//                     letterSpacing: -5,
//                   ),),
//                   Spacer(),
//                   Row(
//                     children: [
//                       CustomButton(icon: Icons.all_out_sharp, title: 'Remind me',iconSize: 20,textSize: 12,),
//                       kwidth,
//                       CustomButton(icon: Icons.info, title: 'Info',iconSize: 20,textSize: 12,),
//                       kwidth,
    
//                     ],
//                   ),
                  
//                 ],
//               ),
//               kHeight,
//               Text('Coming on Friday'),
//               kHeight,
//               Text('Tall Girl 2',style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold
//               ),),
//               Text('Landing the lead in the school musical is a dream come true for jodi, until the pressure sends her confidence - and her relationship - into a tailspain.',style: TextStyle(color: kGrey),)
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

