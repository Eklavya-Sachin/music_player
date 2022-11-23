import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:musically/app/modules/library/views/modals/custom_list_tile.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({super.key});

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  final List<Map<String, dynamic>> musicList = [
    {
      "title": "Uptown Funk",
      "singer": "One Republic",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
      "image":
          "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-Singers-Who-Lost-On-Reality-Shows8_5ea7d4f04e41e.jpeg",
    },
    {
      "title": "Black Space",
      "singer": "Sia",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
      "image":
          "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-Singers-Who-Lost-On-Reality-Shows10_5ea7d51d28f24.jpeg",
    },
    {
      "title": "Shake it off",
      "singer": "Coldplay",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
      "image":
          "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-Singers-Who-Lost-On-Reality-Shows2_5ea7d47403432.jpeg",
    },
    {
      "title": "Lean On",
      "singer": "T. Schürger",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3",
      "image":
          "https://i.pinimg.com/originals/ea/60/26/ea60268f4374e8840c4529ee1462fa38.jpg",
    },
    {
      "title": "Sugar",
      "singer": "Adele",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3",
      "image":
          "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-Singers-Who-Lost-On-Reality-Shows7_5ea7d4db364a2.jpeg",
    },
    {
      "title": "Believer",
      "singer": "Ed Sheeran",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3",
      "image":
          "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-Singers-Who-Lost-On-Reality-Shows6_5ea7d4c7225c1.jpeg",
    },
    {
      "title": "Stressed out",
      "singer": "Mark Ronson",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3",
      "image":
          "https://i.pinimg.com/originals/7c/a1/08/7ca1080bde6228e9fb8460915d36efdd.jpg",
    },
    {
      "title": "Girls Like You",
      "singer": "Maroon 5",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3",
      "image":
          "https://i.pinimg.com/originals/1b/b8/55/1bb8552249faa2f89ffa0d762d87088d.jpg",
    },
    {
      "title": "Let her go",
      "singer": "Passenger",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-9.mp3",
      "image":
          "https://64.media.tumblr.com/5b7c0f14e4e50922ccc024573078db42/15bda826b481de6f-5a/s1280x1920/b26b182f789ef7bb7be15b037e2e687b0fbc437d.jpg",
    },
    {
      "title": "Roar",
      "singer": "Katy Perry",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3",
      "image":
          "https://cdn2.stylecraze.com/wp-content/uploads/2013/11/Jesus-On-Her-Wrist.jpg.webp",
    },
  ];

  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String currentMusic = "";
  void playMusic(String url) async {
    if (isPlaying && currentMusic != url) {
      audioPlayer.pause();
      var result = audioPlayer.play;
      if (result == 1) {
        setState(() {
          currentMusic == url;
        });
      }
    }
  }

  List<Map<String, dynamic>> foundMusic = [];
  @override
  void initState() {
    foundMusic = musicList;
    super.initState();
  }

  void _runFilter(String keyword) {
    List<Map<String, dynamic>> result = [];
    if (keyword.isEmpty) {
      result = musicList;
    } else {
      result = musicList
          .where(
            (item) => item["title"].toString().toLowerCase().contains(
                  keyword.toLowerCase(),
                ),
          )
          .toList();
    }
    setState(() {
      foundMusic = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0x00000036),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            iconSize: 30,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          title: const Text(
            'Music Library',
            style: TextStyle(fontSize: 28),
          ),
          backgroundColor: const Color(0x00000036),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Column(
            children: [
              searchBar(),
              const SizedBox(height: 10),
              Expanded(
                child: foundMusic.isNotEmpty
                    ? ListView.builder(
                        itemBuilder: (context, index) => customListTile(
                          title: musicList[index]["title"],
                          onTap: () {},
                          singer: musicList[index]['singer'],
                          image: musicList[index]['image'],
                          url: musicList[index]['url'],
                        ),
                        itemCount: musicList.length,
                      )
                    : const Center(
                        child: Text(
                          "No Song Found",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
              ),
              Container()
            ],
          ),
        ),
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xff4c516d),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          // prefixIconConstraints: ,
          suffixIcon: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
          ),
          hintText: "Search Music",
          hintStyle: const TextStyle(fontSize: 20.0, color: Colors.white),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        ),
      ),
    );
  }
}
