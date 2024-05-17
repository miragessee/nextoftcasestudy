import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../colors.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../openapi.dart';

class PhotoOptionsSheet extends StatelessWidget {
  final Function(String) onImageSelected;
  final Openapi openApi;

  PhotoOptionsSheet({required this.onImageSelected, required this.openApi});

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      try {
        final file = File(pickedFile.path);
        final multipartFile = await MultipartFile.fromFile(file.path,
            filename: file.path.split('/').last);

        final response = await openApi
            .getUserApi()
            .apiUserUploadImagePost(image: multipartFile);

        final imageUrl = response.data?.data?.imageUrl;
        if (imageUrl != null) {
          onImageSelected(imageUrl);
        }
      } catch (e) {
        print("Exception when calling apiUserUploadImagePost: $e\n");
      }
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: Offset(0, -6),
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 30),
            _buildOption(
              context,
              icon: Icons.camera_alt,
              label: 'Camera',
              onTap: () {
                _pickImage(context, ImageSource.camera);
              },
            ),
            SizedBox(height: 15),
            _buildOption(
              context,
              icon: Icons.photo_library,
              label: 'Gallery',
              onTap: () {
                _pickImage(context, ImageSource.gallery);
              },
            ),
            SizedBox(height: 15),
            _buildOption(
              context,
              icon: null,
              label: 'Cancel',
              onTap: () {
                Navigator.of(context).pop();
              },
              isCancel: true,
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(BuildContext context,
      {required IconData? icon,
      required String label,
      required VoidCallback onTap,
      bool isCancel = false}) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: isCancel ? Colors.white : AppColors.page_color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, 0),
            blurRadius: 4,
          ),
        ],
      ),
      child: Center(
        child: ListTile(
          leading: null,
          title: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) Icon(icon, color: AppColors.black),
                if (icon != null) SizedBox(width: 15),
                Text(
                  label,
                  style: TextStyle(
                    color: isCancel ? AppColors.blue : AppColors.black,
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
