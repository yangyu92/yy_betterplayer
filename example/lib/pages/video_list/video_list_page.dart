import 'dart:math';

import 'package:better_player_example/constants.dart';
import 'package:better_player_example/model/video_list_data.dart';
import 'package:flutter/material.dart';

import 'video_list_widget.dart';

class VideoListPage extends StatefulWidget {
  @override
  _VideoListPageState createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage> {
  final _random = new Random();
  final List<String> _videos = [
    'https://vodzz.duoduocdn.com/4a8d9c67vodtransgzp1251542705/c1d5f892387702297192123077/v.f100820.mp4',
    'https://vodzz.duoduocdn.com/4a8d9c67vodtransgzp1251542705/c1d5f892387702297192123077/v.f100820.mp4',
    'https://vodzz.duoduocdn.com/4a8d9c67vodtransgzp1251542705/c1d5f892387702297192123077/v.f100820.mp4',
    'https://vodzz.duoduocdn.com/4a8d9c67vodtransgzp1251542705/c1d5f892387702297192123077/v.f100820.mp4',
    'https://vodzz.duoduocdn.com/4a8d9c67vodtransgzp1251542705/c1d5f892387702297192123077/v.f100820.mp4',
    'https://vodzz.duoduocdn.com/4a8d9c67vodtransgzp1251542705/c1d5f892387702297192123077/v.f100820.mp4',
    'http://mvdown.kuwo.cn/f24b51a9430d6f09f1378bae4371b37a/63439209/resource/m2/25/14/2377306201.mp4',
    'http://ip.h5.nf03.sycdn.kuwo.cn/ce4669885db29d6770c6c0c876f8844a/63439241/resource/m2/0/6/2741863772.mp4',
    'http://ip.h5.nf03.sycdn.kuwo.cn/690f2e496006307ba6bcd0dccbe69756/63439267/resource/m1/99/22/2588563583.mp4',
    'http://ip.h5.nf03.sycdn.kuwo.cn/593e084227d190693039b4982ebb9cf1/63439287/resource/m3/33/18/3550941205.mp4',
  ];
  List<VideoListData> dataList = [];
  var value = 0;

  @override
  void initState() {
    _setupData();
    super.initState();
  }

  void _setupData() {
    for (int index = 0; index < 100; index++) {
      var randomVideoUrl = _videos[_random.nextInt(_videos.length)];
      dataList.add(VideoListData("Video $index", randomVideoUrl));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video in list")),
      body: Container(
        color: Colors.grey,
        child: Column(children: [
          TextButton(
            child: Text("Update page state"),
            onPressed: () {
              setState(() {
                value++;
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                VideoListData videoListData = dataList[index];
                return VideoListWidget(
                  videoListData: videoListData,
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
