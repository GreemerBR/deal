 import 'dart:io';
    
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'new_announce_body.dart';

class ImageUploadContainer extends HookConsumerWidget {
  const ImageUploadContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    Future<void> pickImageFromGallery() async {
      try {
        final image = await ImagePicker()
            .pickImage(source: ImageSource.gallery, imageQuality: 50);
        if (image == null) return;
        File fileImage = File(image.path);
        var tempPhoto = fileImage.readAsBytesSync();
        ref.read(announceImageProvider.notifier).state = tempPhoto;
      } catch (e) {
        // ignore: avoid_print
        print('Failed to pick image: $e');
      }
    }

    Future<void> pickImageFromCamera() async {
      try {
        final image = await ImagePicker()
            .pickImage(source: ImageSource.gallery, imageQuality: 50);
        if (image == null) return;
        File fileImage = File(image.path);
        var tempPhoto = fileImage.readAsBytesSync();
        ref.read(announceImageProvider.notifier).state = tempPhoto;
      } catch (e) {
        // ignore: avoid_print
        print('Failed to pick image: $e');
      }
    }

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
                iconSize: 65,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Wrap(
                        children: [
                          GestureDetector(
                            onTap: () {
                              pickImageFromGallery();
                            },
                            child: ListTile(
                              leading: Icon(Icons.image),
                              title: Text("Escolher Imagem da Galeria"),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              pickImageFromCamera();
                            },
                            child: ListTile(
                              leading: Icon(Icons.camera_alt_outlined),
                              title: Text("Abrir Câmera"),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.upload,
                  color: Color.fromARGB(255, 99, 66, 191),
                ),
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
  }
}


//  final snackBar = SnackBar(
//                     content: const Text('Image Uploaded!'),
//                     action: SnackBarAction(
//                       label: 'Close',
//                       onPressed: () {
                        
//                       },
//                     ),
//                   );
//                   ScaffoldMessenger.of(context).showSnackBar(snackBar);