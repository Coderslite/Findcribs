// ignore_for_file: avoid_print

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:findcribs/screens/listing_process/listing/components/rent/rent4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../../../../../controller/rent_listing_controller.dart';

class Rent3Stepper extends StatefulWidget {
  final String? propertyCategory;
  final String? houseType;
  final String? propertyAddress;
  final String? bedroom;
  final String? bathrooom;
  final String? livingroom;
  final String? kitchen;
  final String? currency;
  final String? rent;
  final String? rentalFee;
  final String? charge;
  final String? negotiable;
  final String? cautionFee;
  final String? serviceCharge;
  final String? legalFee;
  final String? agencyFee;
  const Rent3Stepper(
      {Key? key,
      this.propertyCategory,
      this.houseType,
      this.propertyAddress,
      this.bedroom,
      this.bathrooom,
      this.livingroom,
      this.kitchen,
      this.currency,
      this.rent,
      this.rentalFee,
      this.charge,
      this.negotiable,
      this.cautionFee,
      this.serviceCharge,
      this.legalFee,
      this.agencyFee})
      : super(key: key);

  @override
  State<Rent3Stepper> createState() => _Rent3StepperState();
}

class _Rent3StepperState extends State<Rent3Stepper> {
  static final _formKey3 = GlobalKey<FormBuilderState>();
  List facilities = [];
  String totalAreaOfLand = "0";
  String coveredByProperty = "0";

  RentListingController rentListingController =
      Get.put(RentListingController());
  @override
  void dispose() {
    _formKey3.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
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
                  InkWell(
                    onTap: () {
                      // Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder: (_) {
                      //   return Rent2();
                      // }));
                    },
                    child: const CircleAvatar(
                      radius: 12,
                      backgroundColor: Color(0XFF0072BA),
                      child: Text("2"),
                    ),
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
                      //   return Rent3();
                      // }));
                    },
                    child: const CircleAvatar(
                      radius: 12,
                      backgroundColor: Color(0XFF0072BA),
                      child: Text("3"),
                    ),
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
                      //   return Rent4();
                      // }));
                    },
                    child: const CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.grey,
                      child: Text(
                        "4",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: FormBuilder(
                    key: _formKey3,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 0.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("State"),
                          rentListingController.location.value == ''
                              ? FormBuilderDropdown(
                                  name: 'location',
                                  isExpanded: true,
                                  onChanged: (value) {
                                    rentListingController.location.value =
                                        value.toString();
                                  },
                                  items: [
                                    "Abia",
                                    "Adamawa",
                                    "Akwa-ibom",
                                    "Anambra",
                                    "Bauchi",
                                    "Bayelsa",
                                    "Benue",
                                    "Borno",
                                    "Cross River",
                                    "Delta",
                                    "Ebonyi",
                                    "Edo",
                                    "Ekiti",
                                    "Enugu",
                                    "Gombe",
                                    "Imo",
                                    "Jigawa",
                                    "Kaduna",
                                    "Kano",
                                    "Kastina",
                                    "Kebbi",
                                    "Kogi",
                                    "Kwara",
                                    "Lagos",
                                    "Nassarawa",
                                    "Niger",
                                    "Ogun",
                                    "Ondo",
                                    "Osun",
                                    "Oyo",
                                    "Plateau",
                                    "Rivers",
                                    "Sokoto",
                                    "Taraba",
                                    "Yobe",
                                    "Zamfara",
                                    "Abuja"
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
                                )
                              : FormBuilderDropdown(
                                  name: 'location',
                                  isExpanded: true,
                                  initialValue:
                                      rentListingController.location.value,
                                  onChanged: (value) {
                                    rentListingController.location.value =
                                        value.toString();
                                  },
                                  items: [
                                    "Abia",
                                    "Adamawa",
                                    "Akwa-ibom",
                                    "Anambra",
                                    "Bauchi",
                                    "Bayelsa",
                                    "Benue",
                                    "Borno",
                                    "Cross River",
                                    "Delta",
                                    "Ebonyi",
                                    "Edo",
                                    "Ekiti",
                                    "Enugu",
                                    "Gombe",
                                    "Imo",
                                    "Jigawa",
                                    "Kaduna",
                                    "Kano",
                                    "Kastina",
                                    "Kebbi",
                                    "Kogi",
                                    "Kwara",
                                    "Lagos",
                                    "Nassarawa",
                                    "Niger",
                                    "Ogun",
                                    "Ondo",
                                    "Osun",
                                    "Oyo",
                                    "Plateau",
                                    "Rivers",
                                    "Sokoto",
                                    "Taraba",
                                    "Yobe",
                                    "Zamfara",
                                    "Abuja"
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
                          const Text("Interior design"),
                          rentListingController.interiorDesign.value == ''
                              ? FormBuilderDropdown(
                                  name: 'interiorDesign',
                                  isExpanded: true,
                                  onChanged: (value) {
                                    rentListingController.interiorDesign.value =
                                        value.toString();
                                  },
                                  items: [
                                    "Furnished",
                                    "Semi-Furnished",
                                    "Unfurnished"
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
                                )
                              : FormBuilderDropdown(
                                  name: 'interiorDesign',
                                  isExpanded: true,
                                  initialValue: rentListingController
                                      .interiorDesign.value,
                                  onChanged: (value) {
                                    rentListingController.interiorDesign.value =
                                        value.toString();
                                  },
                                  items: [
                                    "Furnished",
                                    "Semi-Furnished",
                                    "Unfurnished"
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
                          const Text("Parking space"),
                          rentListingController.parkingSpace.value == ''
                              ? FormBuilderDropdown(
                                  name: 'space',
                                  isExpanded: true,
                                  onChanged: (value) {
                                    rentListingController.parkingSpace.value =
                                        value.toString();
                                  },
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
                                )
                              : FormBuilderDropdown(
                                  name: 'space',
                                  isExpanded: true,
                                  initialValue:
                                      rentListingController.parkingSpace.value,
                                  onChanged: (value) {
                                    rentListingController.parkingSpace.value =
                                        value.toString();
                                  },
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
                          const Text("Availability of running water"),
                          rentListingController.water.value == ''
                              ? FormBuilderDropdown(
                                  name: 'water',
                                  isExpanded: true,
                                  onChanged: (value) {
                                    rentListingController.water.value =
                                        value.toString();
                                  },
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
                                )
                              : FormBuilderDropdown(
                                  name: 'water',
                                  isExpanded: true,
                                  initialValue:
                                      rentListingController.water.value,
                                  onChanged: (value) {
                                    rentListingController.water.value =
                                        value.toString();
                                  },
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
                          const Text("Availability of electricity"),
                          rentListingController.water.value == ''
                              ? FormBuilderDropdown(
                                  name: 'electricity',
                                  isExpanded: true,
                                  onChanged: (value) {
                                    rentListingController.electricity.value =
                                        value.toString();
                                  },
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
                                )
                              : FormBuilderDropdown(
                                  name: 'electricity',
                                  isExpanded: true,
                                  initialValue:
                                      rentListingController.electricity.value,
                                  onChanged: (value) {
                                    rentListingController.electricity.value =
                                        value.toString();
                                  },
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
                          const Text("Facilities in the area(tick)"),
                          MultiSelectDialogField(
                            selectedColor: const Color(0XFF0072BA),
                            searchable: true,
                            dialogWidth: MediaQuery.of(context).size.width,
                            buttonIcon: const Icon(
                              Icons.check_box,
                              color: Color(0XFF0072BA),
                              size: 15,
                            ),
                            items: [
                              "Schools",
                              "Food",
                              "Market",
                              "Restaurant",
                              "Grocery Stores",
                              "Church",
                              "Cinema",
                              "Free Wifi",
                              "Swimming Pool",
                              "Gym Center",
                              "Recreational Centers",
                              "SPA",
                              "Saloon Centers",
                              "Security",
                              "Good Internet",
                              "Air-Conditioning",
                              "Furnished Interior",
                              "Secured Parking Space",
                              "Lounge",
                              "Walldrobe",
                              "Microwave",
                              "Trash Collection"
                            ].map((e) => MultiSelectItem(e, e)).toList(),
                            onConfirm: (List<String> selected) {
                              // print(selected);
                              setState(() {
                                facilities = selected;
                              });
                            },
                            onSaved: (newValue) {
                              setState(() {
                                facilities = newValue!;
                                rentListingController.facilities.value =
                                    newValue;
                              });
                            },
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
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
                                      left:
                                          MediaQuery.of(context).size.width / 5,
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
      ),
    );
  }

  handleNextScreen() async {
    if (_formKey3.currentState!.validate()) {
      _formKey3.currentState!.save();
      var formData = _formKey3.currentState!.value;
      print(formData);
      print(facilities);
      if (facilities.isEmpty) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
          width: 280,
          buttonsBorderRadius: const BorderRadius.all(
            Radius.circular(2),
          ),
          dismissOnTouchOutside: true,
          dismissOnBackKeyPress: false,
          headerAnimationLoop: false,
          animType: AnimType.bottomSlide,
          desc: "Please select the facilities in the area",
          showCloseIcon: true,
          btnOkOnPress: () {},
        ).show();
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return Rent4(
            propertyAddress: widget.propertyAddress,
            houseType: widget.houseType,
            propertyCategory: widget.propertyCategory,
            bedroom: widget.bedroom,
            bathrooom: widget.bathrooom,
            livingroom: widget.livingroom,
            kitchen: widget.kitchen,
            charge: widget.charge,
            currency: widget.currency,
            rent: widget.rent,
            rentalFee: widget.rentalFee,
            negotiable: widget.negotiable,
            legalFee: widget.legalFee,
            agencyFee: widget.agencyFee,
            serviceCharge: widget.serviceCharge,
            cautionFee: widget.cautionFee,
            location: formData['location'],
            area: formData['area'],
            water: formData['water'],
            covered: formData['covered'],
            interiorDesign: formData['interiorDesign'],
            space: formData['space'],
            electricity: formData['electricity'],
          );
        }));
      }
    }
  }
}
