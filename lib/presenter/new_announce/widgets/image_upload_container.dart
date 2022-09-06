import 'dart:io';

import 'package:app_2/presenter/main_menu/main_menu_page.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'new_announce_body.dart';

class ImageUploadContainer extends StatefulHookConsumerWidget {
  const ImageUploadContainer({Key? key}) : super(key: key);

  @override
  ConsumerState<ImageUploadContainer> createState() =>
      _ImageUploadContainerState();
}

class _ImageUploadContainerState extends ConsumerState<ImageUploadContainer> {
  @override
  Widget build(BuildContext context) {
    var tempPhoto;

    Future<void> pickImageFromGallery() async {
      try {
        final image = await ImagePicker()
            .pickImage(source: ImageSource.gallery, imageQuality: 50);
        if (image == null) return;
        File fileImage = File(image.path);
        tempPhoto = fileImage.readAsBytesSync();
        setState(() {});
        ref.read(announceImageProvider.notifier).state = tempPhoto;
      } catch (e) {
        // ignore: avoid_print
        print('Failed to pick image: $e');
      }
    }

    if (ref.watch(announceImageProvider.notifier).state!.isEmpty) {
      return Container(
        margin: EdgeInsets.all(25),
        child: DottedBorder(
          dashPattern: [4, 7],
          color: Colors.grey.shade700,
          radius: Radius.circular(15),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    pickImageFromGallery();
                  },
                  icon: Icon(Icons.photo),
                ),
                Text(
                  "Inserir Foto...",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 99, 66, 191),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: MemoryImage(
                      ref.watch(announceImageProvider.notifier).state!),
                ),
              ),
            ),
          ),
          Positioned(
            left: 310,
            top: 140,
            child: CircleAvatar(
              backgroundColor: Colors.deepPurple,
              radius: 30,
              child: IconButton(
                onPressed: () {
                  pickImageFromGallery();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => MainMenuPage(),
                    ),
                  );
                },
                icon: Icon(Icons.edit),
                iconSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
    }
  }
}
