import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ImageUploadContainer extends StatelessWidget {
  const ImageUploadContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          ListTile(
                            leading: Icon(Icons.share),
                            title: Text("Share"),
                          ),
                          ListTile(
                            leading: Icon(Icons.copy),
                            title: Text("Copy"),
                          ),
                          ListTile(
                            leading: Icon(Icons.edit),
                            title: Text("Edit"),
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