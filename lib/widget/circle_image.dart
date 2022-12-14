import 'package:cached_network_image/cached_network_image.dart';
import'package:flutter/material.dart';


class CircleImage extends StatelessWidget {
  final String imageUrl;
  const CircleImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
                imageUrl: imageUrl,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    )),
                  );
                },
                placeholder: (context, url) {
                  return const Center(child: CircularProgressIndicator(),);
                },
                errorWidget: (context, url, error) {
                  return const Icon(Icons.error);
                },
                );
  }
}