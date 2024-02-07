import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chewie/chewie.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String url;
  const VideoPlayerWidget({super.key,required this.url,});
  @override
  State<VideoPlayerWidget> createState() => _VideoPopUpState();
}
class _VideoPopUpState extends State<VideoPlayerWidget> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  @override
  void initState() {
    super.initState();
    _initPlayer();
  }
  void _initPlayer() async {
    videoPlayerController = VideoPlayerController.network(
        '${AppConstants.BASE_URL}${widget.url}'
    );
    await Future.wait([videoPlayerController.initialize()]);

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );
    setState(() {
    });
  }
  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height/2.5,
      child: Column(
        children: [
     /*     Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  color: Colors.transparent,
                  height: 50,
                  width: 50,
                  child: Icon(Icons.close_sharp, color: Colors.red,),
                ),
              )
            ],
          ),
          SizedBox(height: 20),*/
          Container(
              height: 200,
              child: Center(child:
              chewieController!=null?Chewie(controller: chewieController!):
              Center(child: CircularProgressIndicator())
                ,))
        ],
      ),
    );
  }
}
