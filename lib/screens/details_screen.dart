import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spoti/models/models.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Item item = ModalRoute.of(context)?.settings.arguments as Item;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(202, 0, 0, 0),
              Color.fromARGB(223, 109, 0, 5),
            ],
            begin: Alignment.topLeft,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            _CustomAppBar(item: item),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                  [_CoverAndTitle(item: item), _OverView(item: item)]),
            )
          ],
        ),
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  final Item item;
  const _OverView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        item.type.toString(),
        textAlign: TextAlign.justify,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}

class _CoverAndTitle extends StatelessWidget {
  final Item item;
  const _CoverAndTitle({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInUp(
              duration: const Duration(milliseconds: 700),
              child: FadeInImage(
                placeholder: const AssetImage('/img/loading.gif'),
                image: NetworkImage(
                    item.images.isNotEmpty ? item.images[0].url : ''),
                height: 250,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: FadeInRight(
              duration: const Duration(milliseconds: 700),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(fontSize: 30, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    'Artista: ${item.artists.map((artist) => artist.name).join(', ')}',
                    style: const TextStyle(fontSize: 23, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    'Tracks: ${item.totalTracks.toString()}',
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    'Tipo: ${describeEnum(item.albumType)}',
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Item item;
  const _CustomAppBar({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: 10,
      floating: false,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.white,
          child: Text(
            item.name,
            style: const TextStyle(fontSize: 100),
          ),
        ),
      ),
    );
  }
}
