import 'package:flutter/material.dart';
import 'package:spoti/provider/music_provider.dart';
import 'package:spoti/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final musicProvier = Provider.of<MusicProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        title: const Center(child: Text('Música')),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(223, 109, 0, 5),
              Color.fromARGB(202, 0, 0, 0)
            ],
            begin: Alignment.topLeft,
          ),
        ),
        child: Column(
          children: [
            CardSwiper(
              items: musicProvier.itemNewReleases,
            ),
          ],
        ),
      ),
    );
  }
}
