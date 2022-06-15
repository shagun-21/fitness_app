import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'colors.dart' as color;

class VideoInfo extends StatefulWidget {
  const VideoInfo({super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  bool _playArea = false;
  List Videoinfo = [];
  late VideoPlayerController _controller;

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
      setState(() {
        Videoinfo = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _playArea == false
            ? BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                    color.AppColor.gradientFirst.withOpacity(0.9),
                    color.AppColor.gradientSecond
                  ],
                    begin: const FractionalOffset(0.0, 0.4),
                    end: Alignment.topRight))
            : BoxDecoration(
                color: color.AppColor.gradientSecond,
              ),
        child: Column(
          children: [
            _playArea == false
                ? Container(
                    padding: EdgeInsets.only(top: 70, left: 30, right: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: color.AppColor.secondPageIconColor,
                              ),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: color.AppColor.secondPageIconColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Legs Toning',
                          style: TextStyle(
                              fontSize: 20,
                              color: color.AppColor.secondPageTitleColor),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'and Glutes Workout',
                          style: TextStyle(
                              fontSize: 20,
                              color: color.AppColor.secondPageTitleColor),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      colors: [
                                        color.AppColor
                                            .secondPageContainerGradient1stColor,
                                        color.AppColor
                                            .secondPageContainerGradient2ndColor
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.timer,
                                    color: color.AppColor.secondPageIconColor,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "68 min",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color:
                                            color.AppColor.secondPageIconColor),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 30,
                              width: 240,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      colors: [
                                        color.AppColor
                                            .secondPageContainerGradient1stColor,
                                        color.AppColor
                                            .secondPageContainerGradient2ndColor
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.handyman_outlined,
                                    color: color.AppColor.secondPageIconColor,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Resistance band, kettlebell",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color:
                                            color.AppColor.secondPageIconColor),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : Container(
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          padding:
                              EdgeInsets.only(top: 50, left: 30, right: 30),
                          child: Row(children: [
                            InkWell(
                              onTap: () {
                                debugPrint("tapped");
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: color.AppColor.secondPageIconColor,
                              ),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: Colors.white,
                            )
                          ]),
                        ),
                        _playView(context)
                      ],
                    ),
                  ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(70))),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Circuit 1 : Legs Toning",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: color.AppColor.circuitsColor),
                      ),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          Icon(
                            Icons.loop,
                            size: 30,
                            color: color.AppColor.loopColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "3 sets",
                            style: TextStyle(
                                fontSize: 15, color: color.AppColor.setsColor),
                          ),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: _listView(),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return Container(
        height: 300,
        width: 300,
        child: VideoPlayer(controller),
      );
    } else {
      return Text("Being initialized please wait");
    }
  }

  _onTapVideo(int index) {
    final controller =
        VideoPlayerController.network(Videoinfo[index]['videoUrl']);
    _controller = controller;
    setState(() {});
    controller
      ..initialize().then((_) {
        controller.play();
        setState(() {});
      });
  }

  _listView() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      itemCount: Videoinfo.length,
      itemBuilder: (_, int index) {
        return GestureDetector(
          onTap: () {
            _onTapVideo(index);
            debugPrint(index.toString());
            // sir continue from here
            setState(() {
              if (_playArea == false) {
                _playArea = true;
              }
            });
          },
          child: _buildCard(index),
        );
      },
    );
  }

  _buildCard(int index) {
    return Container(
      height: 135,
      child: Column(
        children: [
          //Isha continue from here
          Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(
                        Videoinfo[index]["thumbnail"],
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Videoinfo[index]["title"],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Text(
                      Videoinfo[index]["time"],
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0xFFeaeefc),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "15s rest",
                    style: TextStyle(
                      color: Color(0xFF839fed),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  for (int i = 0; i < 70; i++)
                    i.isEven
                        ? Container(
                            width: 3,
                            height: 1,
                            decoration: BoxDecoration(
                              color: Color(0xFF839fed),
                            ),
                          )
                        : Container(
                            width: 3,
                            height: 1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                          )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
