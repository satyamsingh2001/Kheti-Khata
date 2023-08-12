import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khetikhata/colors/colors_const.dart';
import 'package:khetikhata/const/constContainer.dart';
import 'package:khetikhata/styles/textstyle_const.dart';

class AddPhotoWidget extends StatefulWidget {
  const AddPhotoWidget({super.key});

  @override
  _AddPhotoWidgetState createState() => _AddPhotoWidgetState();
}

class _AddPhotoWidgetState extends State<AddPhotoWidget> {
  final List<File> _selectedPhotos = [];

  Future<void> _selectPhoto() async {
    final pickedFile =
    await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      setState(() {
        _selectedPhotos.add(file);
      });
    }
  }
  int maxPhotos=5;
  void _clearPhoto(int index) {
    setState(() {
      _selectedPhotos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (_selectedPhotos.length < 6)
                InkWell(
                    onTap: () {
                      _selectPhoto();
                    },
                    child: ConstantContainer(
                      height: 100,
                      width: 80,
                      radiusBorder: 5,
                      borderColor: AppColors.white50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColors.primary60,
                            child: Icon(
                              Icons.add,
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            "Add photos",
                            style: AppTextStyles.kBody15RegularTextStyle
                                .copyWith(color: AppColors.white70),
                          )
                        ],
                      ),
                    )),
              for (int i = _selectedPhotos.length - 1; i >= 0; i--)
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 80,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: FileImage(_selectedPhotos[i]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 5,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Color(0xff554f51),
                        child: IconButton(
                          icon: Icon(
                            Icons.clear,
                            size: 10,
                          ),
                          onPressed: () {
                            _clearPhoto(i);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
        Text(
          "Photos ${_selectedPhotos.length}/$maxPhotos - Choose your post's main photo first",
          style: TextStyle(color: AppColors.white50),
        ),
      ],
    );
  }
}
