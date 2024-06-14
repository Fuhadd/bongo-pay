import 'dart:developer';
import 'dart:io';

import 'package:bongo_pay/constants/custom_colors.dart';
import 'package:bongo_pay/screens/app_view_model.dart';
import 'package:bongo_pay/utils/spacers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class UploadIdDropdown extends StatefulHookConsumerWidget {
  const UploadIdDropdown({
    super.key,
  });

  @override
  ConsumerState<UploadIdDropdown> createState() => _UploadIdDropdownState();
}

class _UploadIdDropdownState extends ConsumerState<UploadIdDropdown> {
  final List<String> items = [
    "Upload File",
    "Upload from Gallery",
    "Open Camera",
  ];
  String? selecteditem;
  PlatformFile? userPhotoFile;
  File? userPhotoId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: CustomColors.textFieldColor,
                borderRadius: BorderRadius.circular(10),
                border: selecteditem == null
                    ? null
                    : Border.all(color: CustomColors.whiteColor)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        icon: const Icon(Icons.keyboard_arrow_down_sharp),
                        // padding: const EdgeInsets.all(30),
                        // isDense: true,
                        // elevation: 10,
                        // selectedItemBuilder: (context) {

                        // },
                        hint: const Text(
                          "Upload ID",
                          style: TextStyle(
                              color: CustomColors.greyTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        value: selecteditem,
                        onChanged: (String? newValue) async {
                          if (newValue != null) {
                            if (newValue == "Upload File") {
                              _uploadUserPhotoId();
                            } else {
                              if (newValue == "Upload from Gallery") {
                                pickUserPhotoId(
                                  ImageSource.gallery,
                                );
                              } else {
                                pickUserPhotoId(
                                  ImageSource.camera,
                                );
                              }
                            }
                            selecteditem = newValue;
                            setState(() {});
                          }
                        },
                        items:
                            items.map<DropdownMenuItem<String>>((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          userPhotoId != null || userPhotoFile != null
              ? Expanded(
                  child: Column(
                    children: [
                      verticalSpacer(20),
                      Expanded(
                        child: userPhotoId != null
                            ? Stack(
                                children: [
                                  Image.file(
                                    userPhotoId!,
                                    height: 150,
                                    // width: double.maxFinite,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    left: 2,
                                    top: 2,
                                    child: GestureDetector(
                                      onTap: () => deleteUserPhotoId(),
                                      child: Icon(
                                        Icons.delete_outline,
                                        size: 30,
                                        color: Colors.red.withOpacity(0.9),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Container(
                                height: 130,
                                width: 150,
                                color:
                                    CustomColors.orangeColor.withOpacity(0.05),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () => deleteUserPhotoId(),
                                      child: Icon(
                                        userPhotoFile == null
                                            ? Icons.camera_alt_outlined
                                            : Icons.delete_outline,
                                        size: 30,
                                        color: userPhotoFile == null
                                            ? CustomColors.orangeColor
                                            : Colors.red.withOpacity(0.9),
                                      ),
                                    ),
                                    verticalSpacer(10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        userPhotoFile?.name ?? "title",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }

  void _uploadUserPhotoId() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    setState(() {
      userPhotoId = null;
      userPhotoFile = file;
      ref.read(userPhotoFileProvider.notifier).state = file;
      ref.read(userPhotoIdProvider.notifier).state = null;
    });
  }

  Future pickUserPhotoId(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(
        source: source,
        maxWidth: 1000,
        imageQuality: 50,
      );
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        userPhotoFile = null;
        ref.read(userPhotoFileProvider.notifier).state = null;
        ref.read(userPhotoIdProvider.notifier).state = imageTemporary;
        userPhotoId = imageTemporary;
      });
    } on PlatformException catch (e) {
      log('Failed to pick image: $e');
    }
  }

  Future deleteUserPhotoId() async {
    setState(() {
      userPhotoFile = null;
      userPhotoId = null;
      ref.read(userPhotoFileProvider.notifier).state = null;
      ref.read(userPhotoIdProvider.notifier).state = null;
    });
  }
}
