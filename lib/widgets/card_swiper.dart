import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:spoti/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Item> items;
  const CardSwiper({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: items.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (_, int index) {
          final item = items[index];
          print(item.images);

          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: item),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('img/loading.gif'),
                image: NetworkImage(
                    item.images.isNotEmpty ? item.images[0].url : ''),
                //
              ),
            ),
          );
        },
      ),
    );
  }
}
