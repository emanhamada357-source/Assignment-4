import 'package:flutter/material.dart';
import '../Screen.dart';
import 'dart:io';
class ScreevEnd extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final File? image;
  const ScreevEnd({
    required this.image,
    required this.name,
    required this.email,
    required this.phone,
    super.key,
  });
  @override
  State<ScreevEnd> createState() => _ScreevEndState();
}

class _ScreevEndState extends State<ScreevEnd> {
  List<Map<String, dynamic>> contacts = [];
  @override
  void initState() {
    super.initState();
    contacts.add({
      "name": widget.name,
      "email": widget.email,
      "phone": widget.phone,
      "image": widget.image,
    });
  }
  Future<void> addContact() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Screen(
          returnContact: true,
        ),
      ),
    );
    if (result != null) {
      setState(() {
        contacts.add(result);
      });
    }
  }
  void deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }
  void deleteAll() {
    setState(() {
      contacts.clear();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Positioned(
            top: 170,
            left: 0,
            right: 0,
            bottom: 0,

            child: GridView.builder(
              padding:  EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.62,
              ),
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return Container(
                  decoration: BoxDecoration(
                    color:  Color(0xff34465D),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          contact["image"] == null
                              ? Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Color(0xff34465D),
                              borderRadius:
                              BorderRadius.only(
                                topLeft:
                                Radius.circular(20),
                                topRight:
                                Radius.circular(20),
                              ),
                            ),
                            child: Icon(
                              Icons.person,
                              color:
                              Color(0xffFFF1D4),
                              size: 100,
                            ),
                          )
                              : ClipRRect(
                            borderRadius:
                            BorderRadius.only(
                              topLeft:
                              Radius.circular(20),
                              topRight:
                              Radius.circular(20),
                            ),

                            child: Image.file(
                              contact["image"],
                              width: double.infinity,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            left: 8,

                            child: Container(
                              padding:
                             EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),

                              decoration: BoxDecoration(
                                color:
                                 Color(0xffFFF1D4),

                                borderRadius:
                                BorderRadius.circular(8),
                              ),
                              child: Text(
                                contact["name"],
                                style:  TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,

                          padding:
                           EdgeInsets.all(10),

                          decoration:
                          BoxDecoration(
                            color: Color(0xffFFF1D4),
                            borderRadius:
                            BorderRadius.only(
                              bottomLeft:
                              Radius.circular(20),
                              bottomRight:
                              Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                   Icon(
                                    Icons.email,
                                    color: Colors.black,
                                    size: 19,
                                  ),
                                   SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      contact["email"],
                                      style:
                                      TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                               SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    color: Colors.black,
                                    size: 19,
                                  ),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      contact["phone"],
                                      style:
                                      TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              SizedBox(
                                width: double.infinity,
                                height: 35,

                                child: ElevatedButton(
                                  onPressed: () {
                                    deleteContact(index);
                                  },
                                  style:
                                  ElevatedButton.styleFrom(
                                    backgroundColor:
                                    Colors.red,

                                    padding:
                                    EdgeInsets.zero,

                                    shape:
                                    RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius
                                          .circular(8),
                                    ),
                                  ),

                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .center,
                                    children: [
                                      Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "Delete",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            mini: true,
            backgroundColor: Colors.red,
            onPressed: deleteAll,
            child:  Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
           SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor:
            Color(0xffFFF1D4),
            onPressed: addContact,
            child: Icon(
              Icons.add,
              color: Color(0xff29384D),
            ),
          ),
        ],
      ),
    );
  }
}