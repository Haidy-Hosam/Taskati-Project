import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/Core/Common Widgets/customtextformdield.dart';
import 'package:taskati/Core/Common Widgets/primary_elevated_button.dart';
import 'package:taskati/Core/Common Widgets/secondary_elevated_button.dart';
import 'package:taskati/Core/Constants/app_images.dart';
import 'package:taskati/Core/Functions/extentions.dart';
import 'package:taskati/Core/Functions/navigation.dart';
import 'package:taskati/Core/Styles/colors.dart';
import 'package:taskati/Core/Styles/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskati/Features/Profile/profile_screeen.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  String? path;
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            (context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            "Complete Your Profile",
            style: TextStyles.title.copyWith(fontSize: 18),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(50),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Profile Image',
                  style: TextStyles.body.copyWith(
                    fontSize: 12,
                    color: AppColors.greyColor,
                  ),
                ),
              ),
              20.h,
              Stack(
                children: [
                  CircleAvatar(
                    radius: 90,
                    backgroundImage: path != null
                        ? FileImage(File(path!))
                        : AssetImage(AppImages.user),
                  ),
                  if (path != null)
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: () {
                          // Show Diallog
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog.adaptive(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              title: const Text('Delete Image'),
                              content: const Text(
                                'Are you sure you want to delete?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      path = null;
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Yes',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('No'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(AppImages.deletedIconSvg),
                        ),
                      ),
                    ),
                ],
              ),

              30.h,

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SecondaryElevatedButton(
                    title: "From Camera",
                    onpressed: () async {
                      var imagee = await ImagePicker().pickImage(
                        source: ImageSource.camera,
                      );
                      if (imagee != null) {
                        setState(() {
                          path = imagee.path;
                        });
                      }
                    },
                  ),
                  20.w,
                  SecondaryElevatedButton(
                    title: "From Gallery",
                    onpressed: () async {
                      final image = await ImagePicker().pickImage(
                        source: ImageSource.gallery,
                      );

                      if (image != null) {
                        setState(() {
                          path = image.path;
                        });
                      }
                    },
                  ),
                ],
              ),

              50.h,

              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Your Name',
                  style: TextStyles.body.copyWith(
                    fontSize: 12,
                    color: AppColors.greyColor,
                  ),
                ),
              ),
              10.h,
              customtextformdield(controller: controller,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
        child: PrimaryElevatedBotton(
          title: "Let's Start !",
          onPressed: () {
            pushReplacement(context, ProfileScreen());
          },
        ),
      ),
    );
  }
}
