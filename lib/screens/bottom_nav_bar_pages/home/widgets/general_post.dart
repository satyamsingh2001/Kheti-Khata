import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../colors/colors_const.dart';
import '../../../../const/constContainer.dart';
import '../../../../styles/textstyle_const.dart';

class GeneralPost extends StatefulWidget {
  const GeneralPost({Key? key}) : super(key: key);

  @override
  State<GeneralPost> createState() => _GeneralPostState();
}

class _GeneralPostState extends State<GeneralPost> {
  final List<File> _selectedPhotos = [];
  int maxPhotos =5;

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
  void _clearPhoto(int index) {
    setState(() {
      _selectedPhotos.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    bool canAddMorePhotos = _selectedPhotos.length < maxPhotos;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      CupertinoIcons.multiply,
                      color: AppColors.white100,
                    ),
                  ),
                  Text(
                    "New General Post",
                    style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100),
                  ),
                  ConstantContainer(
                    color: AppColors.primary60,
                    radiusBorder: 20,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                        child: Text(
                          "Publish",
                          style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.white50,
                          child: Icon(
                            CupertinoIcons.person,
                            color: AppColors.white10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Satyam Singh ',
                              style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white80),
                            ),
                            TextSpan(
                              text: '(Farmer)',
                              style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Posting on ',
                              style: AppTextStyles.kCaption12RegularTextStyle.copyWith(color: AppColors.white80),
                            ),
                            TextSpan(
                              text: 'Onion Trading ',
                              style: AppTextStyles.kCaption12SemiboldTextStyle.copyWith(color: AppColors.white100),
                            ),
                            TextSpan(
                              text: ' group',
                              style: AppTextStyles.kCaption12RegularTextStyle.copyWith(color: AppColors.white80),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height:20),
              TextFormField(
                autofocus: true,
                cursorColor: AppColors.primary60,
                maxLines: 10,
                decoration: const InputDecoration(
                  hintText: "What  do you want to share?",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
              SizedBox(height: 20,),
              Wrap(
                alignment: WrapAlignment.start,
                spacing: 8.0,
                runSpacing: 8.0,
                children: _selectedPhotos.map((file) {
                  return Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        width: size.width/5,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: FileImage(file),
                            fit: BoxFit.cover,
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
                              _clearPhoto(_selectedPhotos.indexOf(file));
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
              Spacer(),
              Text(
                "Photos ${_selectedPhotos.length}/$maxPhotos ",
                style: TextStyle(color: AppColors.white50),
              ),
              ListTile(
                onTap: canAddMorePhotos ? _selectPhoto : null, // Disable onTap if max photos reached
                leading: Icon(Icons.add_photo_alternate_outlined),
                title: Text("Add Photos"),
                tileColor: canAddMorePhotos ? Colors.grey[200]:null, // Change tile color when max photos reached
              ),
            ],
          ),
        ),
      ),
    );
  }
}
