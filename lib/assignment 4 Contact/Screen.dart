import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'Home screen/Screen end.dart';

class Screen extends StatefulWidget {
  final bool returnContact;
  Screen({
    this.returnContact = false,
  });

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final TextEditingController nameController =
  TextEditingController();
  final TextEditingController emailController =
  TextEditingController();
  final TextEditingController phoneController =
  TextEditingController();
  File? selectedImage;
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }
  @override
  void dispose() {
    nameFocus.dispose();
    emailFocus.dispose();
    phoneFocus.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final keyboardHeight =
        MediaQuery.of(context).viewInsets.bottom;
    final keyboardOpen = keyboardHeight > 0;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff29384D),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/imeges.png",
              width: 150,
              height: 150,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding:EdgeInsets.only(top: 200),
              child: Image.asset(
                "assets/images/bc633c130c6133f154761730443a8c96f70622fe.gif",

                width: 500,
                height: 400,
              ),
            ),
          ),

          Positioned(
            bottom: keyboardHeight,
            left: 0,
            right: 0,

            child: Container(

              height: keyboardOpen ? 420 : 520,

              padding: EdgeInsets.all(20),

              decoration: BoxDecoration(
                color:Color(0xff34465D),

                borderRadius: BorderRadius.circular(40),
              ),

              child: Column(
                children: [

                  Row(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      GestureDetector(
                        onTap: pickImage,

                        child: Container(
                          width: 140,
                          height: 140,

                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(16),

                            border: Border.all(
                              color:
                               Color(0xffFFF1D4),

                              width: 2,
                            ),
                          ),

                          child: selectedImage == null

                              ? Icon(
                            Icons.photo_library_outlined,

                            color:
                            Color(0xffFFF1D4),

                            size: 50,
                          )

                              : ClipRRect(
                            borderRadius:
                            BorderRadius.circular(14),

                            child: Image.file(
                              selectedImage!,

                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),

                    SizedBox(width: 20),

                      Expanded(
                        child: SizedBox(
                          height: 140,

                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: [

                              ValueListenableBuilder(
                                valueListenable:
                                nameController,
                                builder:
                                    (context, value, child) {

                                  return Text(
                                    nameController.text.isEmpty
                                        ? "User Name"
                                        : nameController.text,

                                    style:
                                     TextStyle(
                                      color:
                                      Color(0xffFFF1D4),

                                      fontSize: 16,
                                    ),
                                  );
                                },
                              ),

                              SizedBox(height: 6),

                              Container(
                                width: double.infinity,
                                height: 2,

                                color:
                                Color(0xffFFF1D4),
                              ),

                              SizedBox(height: 12),

                              // Email
                              ValueListenableBuilder(
                                valueListenable:
                                emailController,

                                builder:
                                    (context, value, child) {

                                  return Text(
                                    emailController.text.isEmpty
                                        ? "example@email.com"
                                        : emailController.text,

                                    style:
                                   TextStyle(
                                      color:
                                      Color(0xffFFF1D4),

                                      fontSize: 16,
                                    ),
                                  );
                                },
                              ),

                              SizedBox(height: 6),

                              Container(
                                width: double.infinity,
                                height: 2,

                                color:
                                 Color(0xffFFF1D4),
                              ),

                               SizedBox(height: 12),

                              ValueListenableBuilder(
                                valueListenable:
                                phoneController,

                                builder:
                                    (context, value, child) {

                                  return Text(
                                    phoneController.text.isEmpty
                                        ? "+200000000000"
                                        : phoneController.text,

                                    style:
                                   TextStyle(
                                      color:
                                      Color(0xffFFF1D4),

                                      fontSize: 16,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // TextFields
                  Expanded(
                    child: Column(
                      children: [

                        // User Name
                        SizedBox(
                          width: double.infinity,
                          height: 60,

                          child: TextField(

                            controller:
                            nameController,

                            focusNode:
                            nameFocus,

                            textInputAction:
                            TextInputAction.next,

                            onSubmitted: (_) {

                              FocusScope.of(context)
                                  .requestFocus(emailFocus);
                            },

                            decoration:
                            InputDecoration(

                              hintText:
                              "Enter User Name",

                              hintStyle:
                              const TextStyle(
                                color:
                                Color(0xffFFF1D4),
                              ),

                              contentPadding:
                              const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),

                              enabledBorder:
                              OutlineInputBorder(

                                borderRadius:
                                BorderRadius.circular(15),

                                borderSide:
                                BorderSide(
                                  color:
                                  Color(0xffFFF1D4),

                                  width: 2,
                                ),
                              ),

                              focusedBorder:
                              OutlineInputBorder(

                                borderRadius:
                                BorderRadius.circular(15),

                                borderSide:
                               BorderSide(
                                  color:
                                  Color(0xffFFF1D4),

                                  width: 2,
                                ),
                              ),
                            ),

                            style:  TextStyle(
                              color:
                              Color(0xffFFF1D4),
                            ),
                          ),
                        ),

                        SizedBox(height: 10),

                        SizedBox(
                          width: double.infinity,
                          height: 60,

                          child: TextField(

                            controller:
                            emailController,

                            focusNode:
                            emailFocus,

                            keyboardType:
                            TextInputType.emailAddress,

                            textInputAction:
                            TextInputAction.next,

                            onSubmitted: (_) {

                              FocusScope.of(context)
                                  .requestFocus(phoneFocus);
                            },

                            decoration:
                            InputDecoration(

                              hintText:
                              "Enter User Email",

                              hintStyle:
                              TextStyle(
                                color:
                                Color(0xffFFF1D4),
                              ),

                              contentPadding:
                               EdgeInsets.symmetric(
                                horizontal: 16,
                              ),

                              enabledBorder:
                              OutlineInputBorder(

                                borderRadius:
                                BorderRadius.circular(15),

                                borderSide:
                                 BorderSide(
                                  color:
                                  Color(0xffFFF1D4),

                                  width: 2,
                                ),
                              ),

                              focusedBorder:
                              OutlineInputBorder(

                                borderRadius:
                                BorderRadius.circular(15),

                                borderSide:
                                BorderSide(
                                  color:
                                  Color(0xffFFF1D4),

                                  width: 2,
                                ),
                              ),
                            ),

                            style: TextStyle(
                              color:
                              Color(0xffFFF1D4),
                            ),
                          ),
                        ),

                         SizedBox(height: 10),

                        // Phone
                        SizedBox(
                          width: double.infinity,
                          height: 60,

                          child: TextField(

                            controller:
                            phoneController,

                            focusNode:
                            phoneFocus,

                            keyboardType:
                            TextInputType.phone,

                            textInputAction:
                            TextInputAction.done,

                            onSubmitted: (_) {

                              FocusScope.of(context)
                                  .unfocus();
                            },

                            decoration:
                            InputDecoration(

                              hintText:
                              "Enter User Phone",

                              hintStyle:
                              TextStyle(
                                color:
                                Color(0xffFFF1D4),
                              ),

                              contentPadding:
                              EdgeInsets.symmetric(
                                horizontal: 16,
                              ),

                              enabledBorder:
                              OutlineInputBorder(

                                borderRadius:
                                BorderRadius.circular(15),

                                borderSide:
                              BorderSide(
                                  color:
                                  Color(0xffFFF1D4),

                                  width: 2,
                                ),
                              ),

                              focusedBorder:
                              OutlineInputBorder(

                                borderRadius:
                                BorderRadius.circular(15),

                                borderSide:
                                BorderSide(
                                  color:
                                  Color(0xffFFF1D4),

                                  width: 2,
                                ),
                              ),
                            ),

                            style:  TextStyle(
                              color:
                              Color(0xffFFF1D4),
                            ),
                          ),
                        ),

                        // Enter User
                        if (!keyboardOpen) ...[

                          SizedBox(height: 15),

                          SizedBox(
                            width: double.infinity,
                            height: 60,

                            child: ElevatedButton(

                              onPressed: () {

                                if (widget.returnContact) {

                                  Navigator.pop(
                                    context,
                                    {
                                      "name":
                                      nameController.text,

                                      "email":
                                      emailController.text,

                                      "phone":
                                      phoneController.text,

                                      "image":
                                      selectedImage,
                                    },
                                  );

                                } else {

                                  Navigator.push(
                                    context,

                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ScreevEnd(
                                            name:
                                            nameController.text,

                                            email:
                                            emailController.text,

                                            phone:
                                            phoneController.text,

                                            image:
                                            selectedImage,
                                          ),
                                    ),
                                  );
                                }
                              },

                              style:
                              ElevatedButton.styleFrom(

                                backgroundColor:
                                Color(0xffFFF1D4),

                                shape:
                                RoundedRectangleBorder(

                                  borderRadius:
                                  BorderRadius.circular(15),
                                ),
                              ),

                              child: Text(
                                "Enter User",

                                style: TextStyle(
                                  color:
                                  Color(0xff29384D),

                                  fontSize: 16,
                                ),
                              ),
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
        ],
      ),
    );
  }
}