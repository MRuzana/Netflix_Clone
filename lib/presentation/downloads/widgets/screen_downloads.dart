import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix_app/api/api.dart';
import 'package:netflix_app/api/api_constants.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/models/downloads_model.dart';
import 'package:netflix_app/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatefulWidget {
  const ScreenDownloads({super.key});

  @override
  State<ScreenDownloads> createState() => _ScreenDownloadsState();
}

class _ScreenDownloadsState extends State<ScreenDownloads> {
  late Future<List<DownloadsModel>> imagelist;
 
  final _widgetlist = [
    const Section1(),
    const Section2(imageList: []),
    const Section3(),
  ];
  @override
  void initState() {
    super.initState();
    imagelist = Api().getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'Downloads',
          )),

      body: FutureBuilder<List<DownloadsModel>>(
        future: imagelist,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final imageList = snapshot.data!;
            // Access the downloaded data
            return ListView.separated(
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                if(index==1){
                  return Section2(imageList: imageList);
                }
                else{
                  return _widgetlist[index];
                }
              },
              
                 // _widgetlist[index], // Pass imageList to Section2
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: _widgetlist.length,
            );
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error: ${snapshot.error}')); // Handle errors
          }
          // Display a loading indicator while data is loading (optional)
          return const Center(child: CircularProgressIndicator());
        },
      ),
      // body: ListView.separated(
      //   padding: const EdgeInsets.all(10),
      //   itemBuilder: (context,index)=> _widgetlist[index],
      //   separatorBuilder: (context,index)=> const SizedBox(height: 20,),
      //   itemCount: _widgetlist.length)
    );
  }
}

class Section1 extends StatelessWidget {
  const Section1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kwidth,
        Icon(
          Icons.settings,
          color: kwhiteColor,
        ),
        kwidth,
        Text('Smart Downloads')
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key, required this.imageList});
  final List<DownloadsModel> imageList;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          'We will download a personalised selection of \nmovies and shows for you, so there is\n always something to watch on your\n device',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        kHeight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.4,
                backgroundColor: const Color.fromARGB(255, 42, 41, 41),
              ),

              DownloadsImageWidget(model: imageList[0], margin: const EdgeInsets.only(left: 170,top: 50), size: Size(size.width * 0.35, size.width * 0.55),angle: 25),
              DownloadsImageWidget(model: imageList[1], margin: const EdgeInsets.only(right: 170,top: 50), size:Size(size.width * 0.35, size.width * 0.55 ),angle: -20),
              DownloadsImageWidget(model: imageList[2], margin: const EdgeInsets.only(top: 50, bottom: 40), size: Size(size.width * 0.35, size.width * 0.6 ),radius: 8,),
              
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kbuttonColorBlue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set up',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          color: kbuttonColorWhite,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can download',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        kHeight,
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    this.angle = 0,
    required this.model,
    // required this.imagelist,
    required this.margin,
    required this.size,
    this.radius = 10,
  });

  // final String imagelist;
  final DownloadsModel model;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    String baseUrl = ApiConstants.kBaseUrl;
    
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            //  margin: margin,
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(baseUrl + model.posterPath!))),
          ),
        ),
      ),
    );
  }
}
