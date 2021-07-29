import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewerWidget extends StatelessWidget {
  final String? url;
  final BuildContext? context;
  final String? tag;
  final String? subTag;
  final File? file;
  const PhotoViewerWidget({
    Key? key,
    this.url,
    this.context,
    this.tag,
    this.subTag,
    this.file,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HeroPhotoViewRouteWrapper(
                imageProvider: file == null
                    ? NetworkImage(
                        url!,
                      )
                    : FileImage(file!) as ImageProvider,
                subTag: this.subTag != null ? this.subTag : "Vista Previa",
              ),
            ),
          );
        },
        child: Container(
          child: Hero(
            tag: "Foto",
            child: file == null
                ? Image.network(
                    url!,
                    width: 350.0,
                    loadingBuilder: (_, child, chunk) =>
                        chunk != null ? CircularProgressIndicator() : child,
                  )
                : Image.file(file!, width: 350.0),
          ),
        ),
      ),
    );
  }
}

class HeroPhotoViewRouteWrapper extends StatelessWidget {
  const HeroPhotoViewRouteWrapper({
    this.imageProvider,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.subTag,
  });

  final ImageProvider? imageProvider;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final String? subTag;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: PhotoView(
            imageProvider: imageProvider,
            backgroundDecoration: backgroundDecoration,
            minScale: minScale,
            maxScale: maxScale,
            heroAttributes:
                PhotoViewHeroAttributes(tag: this.subTag.toString()),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.only(top: 60, left: 30),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
