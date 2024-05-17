import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nextoftcasestudy/colors.dart';
import 'package:nextoftcasestudy/openapi.dart';
import 'package:provider/provider.dart';

import '../loading_notifier.dart';
import 'delete_contact_sheet.dart';
import 'photo_options_sheet.dart';
import 'success_message_sheet.dart';

class AddEditContactScreen extends StatefulWidget {
  final Openapi openApi;
  final UserResponse? contact;

  AddEditContactScreen({required this.openApi, this.contact});

  @override
  _AddEditContactScreenState createState() => _AddEditContactScreenState();
}

class _AddEditContactScreenState extends State<AddEditContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _profileImageUrlController = TextEditingController();

  String? _profileImagePath;
  bool _allFieldsFilled = false;
  bool _isEditing = false;
  String? _userId;

  void _checkFieldsFilled() {
    setState(() {
      _allFieldsFilled = _firstNameController.text.isNotEmpty &&
          _lastNameController.text.isNotEmpty &&
          _phoneNumberController.text.isNotEmpty;
    });
  }

  Future<void> _addOrUpdateContact() async {
    final loadingNotifier =
        Provider.of<LoadingNotifier>(context, listen: false);
    loadingNotifier.startLoading();

    if (_formKey.currentState?.validate() ?? false) {
      try {
        bool userExists = await _checkUserExists();

        if (userExists) {
          await _updateUser();
        } else {
          await _createUser();
        }
      } catch (e) {
        print("Error in _addOrUpdateContact: $e");
      } finally {
        loadingNotifier.stopLoading();
      }
    }
  }

  Future<bool> _checkUserExists() async {
    if (_userId == null) return false;

    try {
      final response =
          await widget.openApi.getUserApi().apiUserIdGet(id: _userId!);
      return response.data?.success ?? false;
    } catch (e) {
      print("Error in _checkUserExists: $e");
      return false;
    }
  }

  Future<void> _updateUser() async {
    final requestBuilder = (b) => b
      ..firstName = _firstNameController.text
      ..lastName = _lastNameController.text
      ..phoneNumber = _phoneNumberController.text
      ..profileImageUrl = _profileImagePath ?? _profileImageUrlController.text;

    final updateUserRequest = UpdateUserRequest(requestBuilder);

    try {
      final response = await widget.openApi
          .getUserApi()
          .apiUserIdPut(id: _userId!, updateUserRequest: updateUserRequest);
      print("User updated: ${response.data}");
      _showSuccessMessage('Changes have been applied!');
    } catch (e) {
      print("Error in _updateUser: $e");
    }
  }

  Future<void> _createUser() async {
    final requestBuilder = (b) => b
      ..firstName = _firstNameController.text
      ..lastName = _lastNameController.text
      ..phoneNumber = _phoneNumberController.text
      ..profileImageUrl = _profileImagePath ?? _profileImageUrlController.text;

    final createUserRequest = CreateUserRequest(requestBuilder);

    try {
      final response = await widget.openApi
          .getUserApi()
          .apiUserPost(createUserRequest: createUserRequest);
      print("User created: ${response.data}");
      _userId = response.data?.data?.id;
      _showSuccessMessage('User added!');

      setState(() {
        _isEditing = true;
      });
    } catch (e) {
      print("Error in _createUser: $e");
    }
  }

  Future<void> _deleteContact() async {
    if (_userId == null) return;

    final loadingNotifier =
        Provider.of<LoadingNotifier>(context, listen: false);
    loadingNotifier.startLoading();

    try {
      await widget.openApi.getUserApi().apiUserIdDelete(id: _userId!);
      Navigator.of(context).pop('Account deleted!');
      Navigator.of(context).pop('Account deleted!');
    } catch (e) {
      print("Exception when calling UserApi->apiUserIdDelete: $e\n");
    } finally {
      loadingNotifier.stopLoading();
    }
  }

  void _showDeleteContactSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => DeleteContactSheet(
        onDelete: _deleteContact,
      ),
      backgroundColor: Colors.transparent,
    );
  }

  void _showSuccessMessage(String message) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SuccessMessageSheet(
        message: message,
        icon: SvgPicture.asset(
          'assets/images/badge_check.svg',
          semanticsLabel: 'badge_check',
          width: 24,
          height: 24,
        ),
        textColor: AppColors.green,
      ),
      backgroundColor: Colors.transparent,
    );
  }

  void _showPhotoOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => PhotoOptionsSheet(
        onImageSelected: (String imageUrl) {
          setState(() {
            _profileImageUrlController.text = imageUrl;
            _profileImagePath = imageUrl;
            _allFieldsFilled = true;
          });
        },
        openApi: widget.openApi,
      ),
      backgroundColor: Colors.transparent,
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.contact != null) {
      _isEditing = true;
      _userId = widget.contact!.id;
      _firstNameController.text = widget.contact!.firstName ?? '';
      _lastNameController.text = widget.contact!.lastName ?? '';
      _phoneNumberController.text = widget.contact!.phoneNumber ?? '';
      _profileImageUrlController.text = widget.contact!.profileImageUrl ?? '';
      _profileImagePath = widget.contact!.profileImageUrl ?? '';
    }
    _firstNameController.addListener(_checkFieldsFilled);
    _lastNameController.addListener(_checkFieldsFilled);
    _phoneNumberController.addListener(_checkFieldsFilled);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _profileImageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<LoadingNotifier>().isLoading;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 30.0, left: 30.0, right: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  color: AppColors.blue,
                                  fontFamily: 'Nunito',
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                          ),
                        ),
                        Text(
                          _userId?.isNotEmpty == true ? '' : 'New Contact',
                          style: TextStyle(
                              color: AppColors.black,
                              fontFamily: 'Nunito',
                              fontSize: 16,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: _allFieldsFilled || _isEditing
                                ? () {
                                    if (_isEditing) {
                                      setState(() {
                                        _isEditing = false;
                                      });
                                    } else {
                                      _addOrUpdateContact();
                                    }
                                  }
                                : null,
                            child: Text(
                              _isEditing ? 'Edit' : 'Done',
                              style: TextStyle(
                                  color: _allFieldsFilled || _isEditing
                                      ? AppColors.blue
                                      : AppColors.grey,
                                  fontFamily: 'Nunito',
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        SizedBox(height: 40),
                        GestureDetector(
                          onTap: _showPhotoOptions,
                          child: (_profileImagePath == null ||
                                  _profileImagePath?.isEmpty == true)
                              ? SvgPicture.asset(
                                  'assets/images/contact.svg',
                                  semanticsLabel: 'contact',
                                  width: 195,
                                  height: 195,
                                )
                              : ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: _profileImageUrlController.text,
                                    width: 195,
                                    height: 195,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                        ),
                        TextButton(
                          onPressed: () {
                            _showPhotoOptions();
                            if (_isEditing) {
                              setState(() {
                                _isEditing = false;
                              });
                            }
                          },
                          child: Text(
                              _userId?.isNotEmpty == true
                                  ? 'Change Photo'
                                  : 'Add Photo',
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1)),
                        ),
                        SizedBox(height: 30),
                        if (_isEditing) ...[
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                _firstNameController.text,
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontFamily: 'Nunito',
                                    fontSize: 16,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Divider(
                              color: AppColors.grey,
                              thickness: 1,
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                _lastNameController.text,
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontFamily: 'Nunito',
                                    fontSize: 16,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Divider(
                              color: AppColors.grey,
                              thickness: 1,
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                _phoneNumberController.text,
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontFamily: 'Nunito',
                                    fontSize: 16,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Divider(
                              color: AppColors.grey,
                              thickness: 1,
                            ),
                          ),
                          SizedBox(height: 15),
                          GestureDetector(
                            onTap: _showDeleteContactSheet,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Delete contact',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontFamily: 'Nunito',
                                      fontSize: 16,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                        ] else ...[
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _firstNameController,
                                  decoration: InputDecoration(
                                    labelText: 'First name',
                                    labelStyle: TextStyle(
                                        color: AppColors.grey,
                                        fontFamily: 'Nunito',
                                        fontSize: 16,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1.0),
                                    ),
                                    filled: true,
                                    fillColor: AppColors.page_color,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a first name';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 15),
                                TextFormField(
                                  controller: _lastNameController,
                                  decoration: InputDecoration(
                                    labelText: 'Last name',
                                    labelStyle: TextStyle(
                                        color: AppColors.grey,
                                        fontFamily: 'Nunito',
                                        fontSize: 16,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1.0),
                                    ),
                                    filled: true,
                                    fillColor: AppColors.page_color,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a last name';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 15),
                                TextFormField(
                                  controller: _phoneNumberController,
                                  decoration: InputDecoration(
                                    labelText: 'Phone number',
                                    labelStyle: TextStyle(
                                        color: AppColors.grey,
                                        fontFamily: 'Nunito',
                                        fontSize: 16,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1.0),
                                    ),
                                    filled: true,
                                    fillColor: AppColors.page_color,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                  ),
                                  keyboardType: TextInputType.phone,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a phone number';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
