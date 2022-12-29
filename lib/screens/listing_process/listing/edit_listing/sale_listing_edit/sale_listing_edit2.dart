// ignore_for_file: avoid_print

import 'package:findcribs/screens/listing_process/listing/edit_listing/sale_listing_edit/sale_listing_edit3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EditSale2 extends StatefulWidget {
  final String? propertyCategory;
  final String? houseType;
  final String? propertyAddress;
  final String? interiorDesign;
  final String? bedroom;
  final String? bathrooom;
  final String? livingroom;
  final String? kitchen;
  const EditSale2(
      {Key? key,
      this.propertyCategory,
      this.houseType,
      this.propertyAddress,
      this.bedroom,
      this.bathrooom,
      this.livingroom,
      this.kitchen,
      this.interiorDesign})
      : super(key: key);

  @override
  State<EditSale2> createState() => _EditSale2State();
}

class _EditSale2State extends State<EditSale2> {
  static final _formKey2 = GlobalKey<FormBuilderState>();
  bool otherChargesIncluded = true;

  int selecteSaleFee = 0;
  String rentalFee = '0';
  int cauFee = 0;
  int serCharge = 0;
  int rentFee = 0;
  int totalPrice = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    List salesFee = [
      selecteSaleFee == 0
          ? Container(
              decoration: const BoxDecoration(
                color: Color(0XFF0072BA),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
              ),
              child: const Center(
                child: Text(
                  "2",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5))),
              child: const Center(
                child: Text(
                  "2",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
      selecteSaleFee == 1
          ? Container(
              decoration: const BoxDecoration(
                color: Color(0XFF0072BA),
                borderRadius: BorderRadius.only(
                    // topLeft: Radius.circular(5),
                    // bottomLeft: Radius.circular(5),
                    ),
              ),
              child: const Center(
                child: Text(
                  "5",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : Container(
              decoration: const BoxDecoration(
                  // color: const Color(0XFF0072BA),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5))),
              child: const Center(
                child: Text(
                  "5",
                  style: TextStyle(
                      // color: Colors.white,
                      ),
                ),
              ),
            ),
      selecteSaleFee == 2
          ? Container(
              decoration: const BoxDecoration(
                color: Color(0XFF0072BA),
                borderRadius: BorderRadius.only(
                    // topLeft: Radius.circular(5),
                    // bottomLeft: Radius.circular(5),
                    ),
              ),
              child: const Center(
                child: Text(
                  "10",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : Container(
              decoration: const BoxDecoration(
                  // color: const Color(0XFF0072BA),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5))),
              child: const Center(
                child: Text(
                  "10",
                  style: TextStyle(
                      // color: Colors.white,
                      ),
                ),
              ),
            ),
      selecteSaleFee == 3
          ? Container(
              decoration: const BoxDecoration(
                color: Color(0XFF0072BA),
                borderRadius: BorderRadius.only(
                    // topLeft: Radius.circular(5),
                    // bottomLeft: Radius.circular(5),
                    ),
              ),
              child: const Center(
                child: Text(
                  "15",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : Container(
              decoration: const BoxDecoration(
                  // color: const Color(0XFF0072BA),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5))),
              child: const Center(
                child: Text(
                  "15",
                  style: TextStyle(
                      // color: Colors.white,
                      ),
                ),
              ),
            ),
      selecteSaleFee == 4
          ? Container(
              decoration: const BoxDecoration(
                color: Color(0XFF0072BA),
                borderRadius: BorderRadius.only(
                    // topLeft: Radius.circular(5),
                    // bottomLeft: Radius.circular(5),
                    ),
              ),
              child: const Center(
                child: Text(
                  "20",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : Container(
              decoration: const BoxDecoration(
                  // color: const Color(0XFF0072BA),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5))),
              child: const Center(
                child: Text(
                  "20",
                  style: TextStyle(
                      // color: Colors.white,
                      ),
                ),
              ),
            ),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: const Color(0XFFF0F7F8),
                      ),
                      child: SvgPicture.asset(
                        "assets/svgs/arrow_back.svg",
                      ),
                    ),
                  ),
                  const Text(
                    "Edit Listing for Sale",
                    style: TextStyle(fontSize: 18),
                  ),
                  const Text(""),
                ],
              ),
              const SizedBox(height: 20),
             
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    // Navigator.pushReplacement(context,
                    //     MaterialPageRoute(builder: (_) {
                    //   return ListPropertyScreen1(
                    //     tab: 1,
                    //   );
                    // }));
                  },
                  child: const CircleAvatar(
                    radius: 12,
                    backgroundColor: Color(0XFF0072BA),
                    child: Text("1"),
                  ),
                ),
                Container(
                  color: Colors.grey,
                  height: 1,
                  width: size.width / 5,
                ),
                const CircleAvatar(
                  radius: 12,
                  backgroundColor: Color(0XFF0072BA),
                  child: Text("2"),
                ),
                Container(
                  color: Colors.grey,
                  height: 1,
                  width: size.width / 5,
                ),
                InkWell(
                  onTap: () {
                    // Navigator.pushReplacement(context,
                    //     MaterialPageRoute(builder: (_) {
                    //   return Sale3();
                    // }));
                  },
                  child: const CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.grey,
                    child: Text(
                      "3",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey,
                  height: 1,
                  width: size.width / 5,
                ),
                const CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.grey,
                  child: Text(
                    "4",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: FormBuilder(
                  key: _formKey2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Parking space"),
                        FormBuilderDropdown(
                          name: 'space',
                          isExpanded: true,
                          initialValue: "Yes",
                          items: [
                            "Yes",
                            "No",
                          ].map((option) {
                            return DropdownMenuItem(
                              value: option,
                              child: Text(option),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("Property Document Available ?"),
                        FormBuilderDropdown(
                          name: 'propertyDoc',
                          isExpanded: true,
                          initialValue: "Yes",
                          items: [
                            "Yes",
                            "No",
                          ].map((option) {
                            return DropdownMenuItem(
                              value: option,
                              child: Text(option),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("Currency Type"),
                        FormBuilderDropdown(
                          name: 'currency',
                          isExpanded: true,
                          initialValue: "Naira",
                          items: [
                            "Naira",
                            "Dollar",
                          ].map((option) {
                            return DropdownMenuItem(
                              value: option,
                              child: Text(option),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("Sale Price"),
                        FormBuilderTextField(
                          name: 'salesPrice',
                          // maxLength: 300,
                          keyboardType: TextInputType.number,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.numeric(context)
                          ]),
                          onChanged: (value) {
                            if (value!.isEmpty) {
                              setState(() {
                                rentFee = 0;
                              });
                            } else {
                              setState(() {
                                rentFee = int.parse(value);
                                rentalFee = value;
                              });
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("Negotiable"),
                        FormBuilderDropdown(
                          name: 'negotiable',
                          isExpanded: true,
                          initialValue: "Yes",
                          items: [
                            "Yes",
                            "No",
                          ].map((option) {
                            return DropdownMenuItem(
                              value: option,
                              child: Text(option),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("Other charges included Above?"),
                        FormBuilderDropdown(
                          name: 'charge',
                          isExpanded: true,
                          initialValue: "No",
                          items: [
                            "Yes",
                            "No",
                          ].map((option) {
                            return DropdownMenuItem(
                              value: option,
                              child: Text(option),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value == 'Yes') {
                              setState(() {
                                otherChargesIncluded = false;
                              });
                            } else {
                              setState(() {
                                otherChargesIncluded = true;
                              });
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        otherChargesIncluded
                            ? Column(
                                children: [
                                  // Row(
                                  //   children: const [
                                  //     Text("Caution fee"),
                                  //     Icon(
                                  //       Icons.info,
                                  //       color: Color(0XFF8A99B1),
                                  //     )
                                  //   ],
                                  // ),
                                  // FormBuilderTextField(
                                  //   name: 'cautionFee',
                                  //   // maxLength: 300,
                                  //   keyboardType: TextInputType.number,
                                  //   validator: FormBuilderValidators.compose([
                                  //     FormBuilderValidators.required(context),
                                  //     FormBuilderValidators.numeric(context)
                                  //   ]),
                                  //   onChanged: (value) {
                                  //     if (value!.isEmpty) {
                                  //       setState(() {
                                  //         cauFee = 0;
                                  //       });
                                  //     } else {
                                  //       setState(() {
                                  //         cauFee = int.parse(value);
                                  //         cautionFee = value;
                                  //       });
                                  //     }
                                  //   },
                                  //   decoration: InputDecoration(
                                  //     border: OutlineInputBorder(
                                  //       borderRadius: BorderRadius.circular(5),
                                  //       borderSide: const BorderSide(),
                                  //     ),
                                  //   ),
                                  // ),

                                  Row(
                                    children: const [
                                      Text("Seller's commission (%)"),
                                      Icon(
                                        Icons.info,
                                        color: Color(0XFF8A99B1),
                                      )
                                    ],
                                  ),
                                  Container(
                                    height: 32,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        // style: BorderStyle.none,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: List.generate(
                                        salesFee.length,
                                        (index) {
                                          return InkWell(
                                            onTap: () {
                                              selectedSaleFee(index);
                                            },
                                            child: SizedBox(
                                              width: size.width / 12,
                                              child: salesFee[index],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // Row(
                                  //   children: const [
                                  //     Text("Agency fee (%)"),
                                  //     Icon(
                                  //       Icons.info,
                                  //       color: Color(0XFF8A99B1),
                                  //     )
                                  //   ],
                                  // ),
                                  // Container(
                                  //   height: 32,
                                  //   decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(5),
                                  //     border: Border.all(
                                  //       // style: BorderStyle.none,
                                  //       color: Colors.grey,
                                  //     ),
                                  //   ),
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.spaceBetween,
                                  //     children: List.generate(
                                  //       rentAgencyFees.length,
                                  //       (index) {
                                  //         return InkWell(
                                  //           onTap: () {
                                  //             selectedRentAgencyFee(index);
                                  //           },
                                  //           child: SizedBox(
                                  //             width: size.width / 12,
                                  //             child: rentAgencyFees[index],
                                  //           ),
                                  //         );
                                  //       },
                                  //     ),
                                  //   ),
                                  // ),
                                  // const SizedBox(
                                  //   height: 20,
                                  // ),
                                  // Row(
                                  //   children: const [
                                  //     Text("Service Charge"),
                                  //     Icon(
                                  //       Icons.info,
                                  //       color: Color(0XFF8A99B1),
                                  //     )
                                  //   ],
                                  // ),
                                  // FormBuilderTextField(
                                  //   // maxLength: 300,
                                  //   name: 'serviceCharge',
                                  //   validator: FormBuilderValidators.compose([
                                  //     FormBuilderValidators.required(context),
                                  //     FormBuilderValidators.numeric(context)
                                  //   ]),
                                  //   // maxLength: 300,
                                  //   keyboardType: TextInputType.number,
                                  //   onChanged: (value) {
                                  //     if (value!.isEmpty) {
                                  //       setState(() {
                                  //         serCharge = 0;
                                  //       });
                                  //     } else {
                                  //       setState(() {
                                  //         serCharge = int.parse(value);
                                  //         serviceCharge = value;
                                  //       });
                                  //     }
                                  //   },
                                  //   decoration: InputDecoration(
                                  //     border: OutlineInputBorder(
                                  //       borderRadius: BorderRadius.circular(5),
                                  //       borderSide: const BorderSide(),
                                  //     ),
                                  //   ),
                                  // ),
                                  // const SizedBox(
                                  //   height: 20,
                                  // ),
                                ],
                              )
                            : Container(),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text("Total Price"),
                        //     Text(
                        //       "N" +
                        //           ((cauFee + serCharge + rentFee) +
                        //                   (rentFee *
                        //                       selecteRentLegalFee /
                        //                       100) +
                        //                   (rentFee * selecteRentAgencyFee))
                        //               .toString(),
                        //       style: TextStyle(
                        //         color: Color(0XFF0072BA),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Detailed description of property"),
                        FormBuilderTextField(
                          name: 'description',
                          maxLines: 5,
                          minLines: 3,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                          ]),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Material(
                              color: const Color(0XFF0072BA),
                              borderRadius: BorderRadius.circular(5),
                              child: MaterialButton(
                                onPressed: () {
                                  handleNextScreen();
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width / 5,
                                    right:
                                        MediaQuery.of(context).size.width / 5,
                                    top: 4.5,
                                    bottom: 4.5,
                                  ),
                                  child: const Text(
                                    "Save & Continue",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: "RedHatDisplay",
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  handleNextScreen() async {
    if (_formKey2.currentState!.validate()) {
      _formKey2.currentState!.save();
      print("clicked");
      var formData = _formKey2.currentState!.value;
      // String agencyFee = selecteRentAgencyFee == 0
      //     ? '5'
      //     : selecteRentAgencyFee == 1
      //         ? '10'
      //         : selecteRentAgencyFee == 2
      //             ? '15'
      //             : selecteRentAgencyFee == 3
      //                 ? '20'
      //                 : '25';

      String saleFee = selecteSaleFee == 0
          ? '2'
          : selecteSaleFee == 1
              ? '5'
              : selecteSaleFee == 2
                  ? '10'
                  : selecteSaleFee == 3
                      ? '15'
                      : '20';

      print(formData);
      print("saleFee$saleFee");

      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return EditSale3(
          propertyAddress: widget.propertyAddress,
          houseType: widget.houseType,
          propertyCategory: widget.propertyCategory,
          bedroom: widget.bedroom,
          bathrooom: widget.bathrooom,
          livingroom: widget.livingroom,
          kitchen: widget.kitchen,
          charge: formData['charge'],
          currency: formData['currency'],
          negotiable: formData['negotiable'],
          propertyDoc: formData['propertyDoc'],
          space: formData['space'],
          salesPrice: formData['salesPrice'],
          description: formData['description'],
          sellerFee: selecteSaleFee == 0
              ? '2'
              : selecteSaleFee == 1
                  ? '5'
                  : selecteSaleFee == 2
                      ? '10'
                      : selecteSaleFee == 3
                          ? '15'
                          : '20',
          interiorDesign: widget.interiorDesign,
        );
      }));
    }
  }

  selectedSaleFee(index) {
    setState(() {
      selecteSaleFee = index;
    });
  }
}
