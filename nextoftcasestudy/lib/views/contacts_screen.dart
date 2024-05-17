import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nextoftcasestudy/openapi.dart';
import 'package:nextoftcasestudy/views/success_message_sheet.dart';
import 'package:provider/provider.dart';
import '../colors.dart';
import '../loading_notifier.dart';
import 'add_edit_contact_screen.dart';
import 'dart:io';

class ContactsScreen extends StatefulWidget {
  final Openapi openApi;

  ContactsScreen({required this.openApi});

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final TextEditingController _searchController = TextEditingController();
  BuiltList<UserResponse> _contacts = BuiltList();
  bool _isLoading = true;
  bool _isSearchFieldFocused = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _fetchContacts();
    });
  }

  Future<void> _fetchContacts({String search = ''}) async {
    final loadingNotifier =
        Provider.of<LoadingNotifier>(context, listen: false);
    loadingNotifier.startLoading();

    try {
      final response = await widget.openApi
          .getUserApi()
          .apiUserGet(search: search, skip: 0, take: 10);
      setState(() {
        _contacts = response.data?.data?.users ?? BuiltList();
        _isLoading = false;
      });
    } catch (e) {
      print("Exception when calling UserApi->apiUserGet: $e\n");
      setState(() {
        _isLoading = false;
      });
    } finally {
      loadingNotifier.stopLoading();
    }
  }

  void _showSuccessMessage(BuildContext context, String message) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0)
                .copyWith(top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Contacts',
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: 'Nunito',
                    fontSize: 24,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/images/add.svg',
                    semanticsLabel: 'add',
                  ),
                  onPressed: () async {
                    final result = await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(25.0)),
                          child: Container(
                            height: MediaQuery.of(context).size.height - 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  offset: Offset(0, -6),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child:
                                AddEditContactScreen(openApi: widget.openApi),
                          ),
                        ),
                      ),
                      backgroundColor: Colors.transparent,
                    );
                    if (result == true) {
                      _fetchContacts();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: AppColors.page_color,
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: kToolbarHeight + 45),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Focus(
                onFocusChange: (hasFocus) {
                  setState(() {
                    _isSearchFieldFocused = hasFocus;
                  });
                },
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Search by name',
                    labelStyle: TextStyle(
                        color: _isSearchFieldFocused
                            ? AppColors.black
                            : AppColors.grey),
                    prefixIcon: Icon(Icons.search,
                        color: _isSearchFieldFocused
                            ? AppColors.black
                            : AppColors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                  ),
                  cursorColor: AppColors.blue,
                  style: TextStyle(color: AppColors.black),
                  onChanged: (value) {
                    _fetchContacts(search: value);
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Consumer<LoadingNotifier>(
                builder: (context, loadingNotifier, child) {
                  if (_isLoading) {
                    return Center();
                  }

                  return loadingNotifier.isLoading
                      ? Center()
                      : _contacts.isEmpty
                          ? _buildNoContactsView()
                          : ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: _contacts.length,
                              itemBuilder: (ctx, i) {
                                final profileImageUrl =
                                    _contacts[i].profileImageUrl;
                                final isNetworkImage =
                                    profileImageUrl?.startsWith('http') ??
                                        false;
                                return GestureDetector(
                                  onTap: () async {
                                    final result = await showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (context) => Padding(
                                        padding:
                                            const EdgeInsets.only(top: 50.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(25.0)),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height -
                                                50,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.25),
                                                  offset: Offset(0, -6),
                                                  blurRadius: 10,
                                                ),
                                              ],
                                            ),
                                            child: AddEditContactScreen(
                                              openApi: widget.openApi,
                                              contact: _contacts[i],
                                            ),
                                          ),
                                        ),
                                      ),
                                      backgroundColor: Colors.transparent,
                                    );

                                    if (result == true) {
                                      _fetchContacts();
                                    } else if (result is String) {
                                      _fetchContacts();
                                      _showSuccessMessage(context, result);
                                    }
                                  },
                                  child: Container(
                                    height: 70,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Row(
                                        children: [
                                          profileImageUrl?.isNotEmpty == true
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          17.0),
                                                  child: isNetworkImage
                                                      ? CachedNetworkImage(
                                                          imageUrl:
                                                              profileImageUrl!,
                                                          width: 34,
                                                          height: 34,
                                                          fit: BoxFit.cover,
                                                          placeholder: (context,
                                                                  url) =>
                                                              CircularProgressIndicator(),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Icon(Icons.error),
                                                        )
                                                      : Image.file(
                                                          File(
                                                              profileImageUrl!),
                                                          width: 34,
                                                          height: 34,
                                                          fit: BoxFit.cover,
                                                        ),
                                                )
                                              : CircleAvatar(
                                                  child: SvgPicture.asset(
                                                    'assets/images/contact.svg',
                                                    semanticsLabel: 'contact',
                                                    width: 34,
                                                    height: 34,
                                                  ),
                                                  backgroundColor:
                                                      Colors.transparent,
                                                ),
                                          SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${_contacts[i].firstName} ${_contacts[i].lastName}',
                                                style: TextStyle(
                                                    color: AppColors.black,
                                                    fontFamily: 'Nunito',
                                                    fontSize: 16,
                                                    letterSpacing: 0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    height: 1),
                                              ),
                                              Text(
                                                _contacts[i].phoneNumber ?? '',
                                                style: TextStyle(
                                                    color: AppColors.grey,
                                                    fontFamily: 'Nunito',
                                                    fontSize: 16,
                                                    letterSpacing: 0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    height: 1),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoContactsView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/images/contact.svg',
            semanticsLabel: 'contact',
            width: 60,
            height: 60,
          ),
          SizedBox(height: 20),
          Text(
            'No Contacts',
            style: TextStyle(
                color: AppColors.black,
                fontFamily: 'Nunito',
                fontSize: 24,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1),
          ),
          SizedBox(height: 10),
          Text(
            'Contacts you\'ve added will appear here.',
            style: TextStyle(
                color: AppColors.black,
                fontFamily: 'Nunito',
                fontSize: 16,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () async {
              final result = await showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25.0)),
                    child: Container(
                      height: MediaQuery.of(context).size.height - 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: Offset(0, -6),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: AddEditContactScreen(openApi: widget.openApi),
                    ),
                  ),
                ),
                backgroundColor: Colors.transparent,
              );

              if (result == true) {
                _fetchContacts();
              } else if (result is String) {
                _fetchContacts();
                _showSuccessMessage(context, result);
              }
            },
            child: Text(
              'Create New Contact',
              style: TextStyle(
                  color: AppColors.blue,
                  fontFamily: 'Nunito',
                  fontSize: 16,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
          ),
        ],
      ),
    );
  }
}
