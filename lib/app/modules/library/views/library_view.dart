import 'package:audioplayer/audioplayer.dart';
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
      "url": "https://www.youtube.com/watch?v=OPf0YbXqDm0",
      "image": "https://wallpapercave.com/wp/wp10380182.jpg",
    },
    {
      "title": "Black Space",
      "singer": "Sia",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
      "image":
          "https://i.pinimg.com/originals/22/40/f6/2240f670fa922717d837b25f298471e4.jpg",
    },
    {
      "title": "Shake it off",
      "singer": "Coldplay",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
      "image":
          "https://ichef.bbci.co.uk/news/976/cpsprodpb/C04C/production/_123882294_cb777976-6822-4327-a30a-038de067f761.jpg.webp",
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
          "https://media.istockphoto.com/id/1214887475/photo/salt-glass-salt-shaker-on-dark-stone-table-a-pile-of-salt-top-view-and-wooden-bowl.jpg?s=612x612&w=is&k=20&c=zBoOiYjBR5vhfDIaOmmz0tUi0gnw0fZGvnimwuRzCIo=",
    },
    {
      "title": "Believer",
      "singer": "Ed Sheeran",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3",
      "image":
          "https://ichef.bbci.co.uk/news/976/cpsprodpb/F382/production/_123883326_852a3a31-69d7-4849-81c7-8087bf630251.jpg.webp",
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
  Future<void> playMusic(String url) async {
    if (isPlaying && currentMusic != url) {
      audioPlayer.pause();
      Future<void> result = audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          currentMusic == url;
        });
      }
    } else if (!isPlaying) {
      var result = audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          isPlaying = true;
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
                          onTap: () {
                            playMusic(musicList[index]["url"]);
                          },
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
