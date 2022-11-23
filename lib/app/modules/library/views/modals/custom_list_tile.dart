import 'package:flutter/material.dart';

Widget customListTile(
    {required String title,
    required String singer,
    required String image,
    required String url,
    onTap}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff4c516d),
      ),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 30),
          Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                singer,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              )
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          )
        ],
      ),
    ),
  );
}
