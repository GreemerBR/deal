// import 'dart:io';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// import '../../../../core/app_assets.dart';
// import '../../../../core/database.dart';
// import '../../../../core/get_it.dart';
// import '../../widgets/profile_summary_informations.dart';
// import 'profile_list_informations.dart';

// class BodyMyProfileEditor extends StatefulWidget {
//   BodyMyProfileEditor(
//     TextEditingController this.nameController,
//     this.apelidoController,
//     this.CpfController,
//     this.emailController,
//     this.telefoneController,
//     this.cepController,
//     this.ruaController,
//     this.numeroController,
//     this.complementoController, {
//     Key? key,
//   }) : super(key: key);

//   final TextEditingController nameController;
//   final TextEditingController apelidoController;
//   final TextEditingController CpfController;
//   final TextEditingController emailController;
//   final TextEditingController telefoneController;
//   final TextEditingController cepController;
//   final TextEditingController ruaController;
//   final TextEditingController numeroController;
//   final TextEditingController complementoController;

//   @override
//   State<BodyMyProfileEditor> createState() => _BodyMyProfileEditorState();
// }

// class _BodyMyProfileEditorState extends State<BodyMyProfileEditor> {
//   final database = getIt.get<DatabaseApp>();
//   final user = FirebaseAuth.instance.currentUser!;

//   var photo;
//   String tempPhoto = imgAvatar;
//   File? image;

//   Future pickImage() async {
//     try {
//       final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//       if (image == null) return;
//       final imageTemp = File(image.path);
//       setState(() {
//         photo = imageTemp;
//       });
//     } catch (e) {
//       // ignore: avoid_print
//       print('Failed to pick image: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: database.select(
//           tableName: 'Users',
//           columnNames: [
//             'UserNomeCompleto',
//             'UserEmail',
//             'UserApelido',
//             'UserCpf',
//             'UserCep',
//             'UserTelefone',
//             'UserCidade',
//             'UserRua',
//             'UserNumero',
//             'UserComplemento',
//             'UserEstado'
//           ],
//           condition: 'UserEmail = "${user.email!}"'),
//       builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
//         if (!snapshot.hasData) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         return Center(
//           child: Column(
//             children: [
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   ProfileSummaryInformations(
//                     photo: photo != null ? photo : tempPhoto,
//                   ),
//                   Container(
//                     child: Padding(
//                       padding: const EdgeInsets.only(
//                         left: 70,
//                         bottom: 80,
//                       ),
//                       child: Transform.rotate(
//                         angle: 0.15,
//                         child: IconButton(
//                           icon: Icon(
//                             Icons.edit,
//                             color: Colors.white,
//                             size: 25,
//                           ),
//                           onPressed: () {
//                             pickImage();
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   physics: BouncingScrollPhysics(),
//                   child: Column(
//                     children: [
//                       ProfileListInformation(
//                         initialText:
//                             snapshot.data![0]["UserNomeCompleto"] == null
//                                 ? ''
//                                 : snapshot.data![0]["UserNomeCompleto"],
//                         boxLabel: 'Nome completo',
//                         controller: widget.nameController,
//                       ),
//                       ProfileListInformation(
//                         initialText: snapshot.data![0]["UserApelido"] == null
//                             ? ''
//                             : snapshot.data![0]["UserApelido"],
//                         boxLabel: 'Apelido',
//                         controller: widget.apelidoController,
//                       ),
//                       ProfileListInformation(
//                         initialText: snapshot.data![0]["UserCpf"] == null
//                             ? ''
//                             : snapshot.data![0]["UserCpf"],
//                         boxLabel: 'Cpf/CNPJ',
//                         controller: widget.CpfController,
//                       ),
//                       ProfileListInformation(
//                         initialText: snapshot.data![0]["UserEmail"] == null
//                             ? ''
//                             : snapshot.data![0]["UserEmail"],
//                         boxLabel: 'Email',
//                         controller: widget.emailController,
//                       ),
//                       ProfileListInformation(
//                         initialText: snapshot.data![0]["UserTelefone"] == null
//                             ? ''
//                             : snapshot.data![0]["UserTelefone"],
//                         boxLabel: 'Telefone',
//                         controller: widget.telefoneController,
//                       ),
//                       ProfileListInformation(
//                         initialText: snapshot.data![0]["UserCep"] == null
//                             ? ''
//                             : snapshot.data![0]["UserCep"],
//                         boxLabel: 'CEP',
//                         controller: widget.cepController,
//                       ),
//                       ProfileListInformation(
//                         initialText: snapshot.data![0]["UserRua"] == null
//                             ? ''
//                             : snapshot.data![0]["UserRua"],
//                         boxLabel: 'Rua',
//                         controller: widget.ruaController,
//                       ),
//                       ProfileListInformation(
//                         initialText: snapshot.data![0]["UserNumero"] == null
//                             ? ''
//                             : snapshot.data![0]["UserNumero"].toString(),
//                         boxLabel: 'Número',
//                         controller: widget.numeroController,
//                       ),
//                       ProfileListInformation(
//                         initialText:
//                             snapshot.data![0]["UserComplemento"] == null
//                                 ? ''
//                                 : snapshot.data![0]["UserComplemento"],
//                         boxLabel: 'Complemento',
//                         controller: widget.complementoController,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               // SaveButtonProfile(),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
