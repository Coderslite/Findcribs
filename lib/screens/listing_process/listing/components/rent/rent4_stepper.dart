// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:findcribs/components/constants.dart';
import 'package:findcribs/screens/listing_process/listing/listing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../controller/rent_listing_controller.dart';
import '../../../../homepage/home_root.dart';

class Rent4Stepper extends StatefulWidget {
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
  final String? location;
  final String? area;
  final String? covered;
  final String? interiorDesign;
  final String? space;
  final String? water;
  final String? electricity;
  final String? cautionFee;
  final String? serviceCharge;
  final String? legalFee;
  final String? agencyFee;
  const Rent4Stepper(
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
      this.location,
      this.area,
      this.covered,
      this.interiorDesign,
      this.space,
      this.water,
      this.electricity,
      this.cautionFee,
      this.serviceCharge,
      this.legalFee,
      this.agencyFee})
      : super(key: key);

  @override
  State<Rent4Stepper> createState() => _Rent4StepperState();
}

class _Rent4StepperState extends State<Rent4Stepper> {
  final ImagePicker _picker = ImagePicker();
  static final _formKey4 = GlobalKey<FormBuilderState>();
  List myImages = [];
  List<File> files = [];
  List<File> newfiles = [];

  bool isLoading = false;
  bool isSaving = false;
  @override
  void dispose() {
    super.dispose();
    _formKey4.currentState!.dispose();
  }

  RentListingController rentListingController =
      Get.put(RentListingController());

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
                      //   return const Rent2();
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
                      //   return const Rent3();
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
                  const CircleAvatar(
                    radius: 12,
                    backgroundColor: Color(0XFF0072BA),
                    child: Text("4"),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: FormBuilder(
                    key: _formKey4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Detailed description of property"),
                        rentListingController.description.value == ''
                            ? FormBuilderTextField(
                                name: 'description',
                                maxLines: 5,
                                minLines: 3,
                                maxLength: 250,
                                onChanged: (value) {
                                  rentListingController.description.value =
                                      value.toString();
                                },
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(context),
                                ]),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(),
                                  ),
                                ),
                              )
                            : FormBuilderTextField(
                                name: 'description',
                                maxLines: 5,
                                minLines: 3,
                                maxLength: 250,
                                initialValue:
                                    rentListingController.description.value,
                                onChanged: (value) {
                                  rentListingController.description.value =
                                      value.toString();
                                },
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
                          height: 20,
                        ),
                        const Text("Age restriction to rent ?"),
                        FormBuilderRadioGroup(
                          name: "ageRestriction",
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                          ]),
                          activeColor: const Color(0XFF0072BA),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          initialValue:
                              rentListingController.ageRestriction.value == 1
                                  ? "Yes"
                                  : "No",
                          onChanged: (value) {
                            if (value == 'Yes') {
                              setState(() {
                                rentListingController.ageRestriction.value = 1;
                              });
                            } else {
                              setState(() {
                                rentListingController.ageRestriction.value = 0;
                              });
                            }
                          },
                          options: const [
                            FormBuilderFieldOption(value: "Yes"),
                            FormBuilderFieldOption(value: "No"),
                          ],
                          // initialValue: _person.role,
                        ),
                        const Text("Property Media"),
                        InkWell(
                          onTap: () {
                            // handleGetImage();
                            setState(() {
                              getImage();
                            });
                          },
                          child: AnimatedContainer(
                            padding: const EdgeInsets.all(8),
                            height: rentListingController.newfiles.isEmpty
                                ? 50
                                : newfiles.length > 3
                                    ? 600
                                    : 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(),
                            ),
                            duration: const Duration(milliseconds: 500),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.camera_alt_outlined,
                                          color: Color(0XFF0072BA),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        // files == null
                                        //     ? const Text("select photo")
                                        //     : const Text("image Available now"),
                                      ],
                                    ),
                                    // files.isEmpty
                                    //     ? Image.asset("assets/images/avatar.png")
                                    //     : CircleAvatar(
                                    //         child: Image.file(
                                    //         files[0],
                                    //         fit: BoxFit.fitHeight,
                                    //       ))
                                  ],
                                ),
                                rentListingController.newfiles.isEmpty
                                    ? Container()
                                    : SizedBox(
                                        child: GridView.builder(
                                            shrinkWrap: true,
                                            itemCount: rentListingController
                                                .newfiles.length,
                                            physics: const ScrollPhysics(),
                                            gridDelegate:
                                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                                    maxCrossAxisExtent: 150,
                                                    crossAxisSpacing: 5,
                                                    mainAxisSpacing: 5),
                                            itemBuilder: (context, index) =>
                                                Stack(
                                                  children: [
                                                    Image.file(
                                                        rentListingController
                                                            .newfiles[index]),
                                                    Positioned(
                                                        child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          rentListingController
                                                              .newfiles
                                                              .removeAt(index);
                                                        });
                                                      },
                                                      child: const Icon(
                                                        Icons.cancel_rounded,
                                                        color: Colors.white,
                                                      ),
                                                    )),
                                                  ],
                                                )),
                                      ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                handleSave();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: const Color(0XFF0072BA),
                                    )),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.width / 35,
                                    bottom:
                                        MediaQuery.of(context).size.width / 35,
                                    left:
                                        MediaQuery.of(context).size.width / 11,
                                    right:
                                        MediaQuery.of(context).size.width / 11,
                                  ),
                                  child: isSaving
                                      ? const CircularProgressIndicator()
                                      : const Text(
                                          "Save",
                                          style: TextStyle(
                                            color: Color(0XFF0072BA),
                                            fontSize: 20,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            Material(
                              color: const Color(0XFF0072BA),
                              borderRadius: BorderRadius.circular(5),
                              child: MaterialButton(
                                onPressed: () {
                                  handlePublish();
                                  // print(newfiles.length);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.width / 35,
                                    bottom:
                                        MediaQuery.of(context).size.width / 35,
                                    left: MediaQuery.of(context).size.width / 9,
                                    right:
                                        MediaQuery.of(context).size.width / 9,
                                  ),
                                  child: isLoading
                                      ? const CircularProgressIndicator()
                                      : const Text(
                                          "Publish",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // handleGetImage() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     allowCompression: true,
  //     allowMultiple: true,
  //     type: FileType.image,
  //   );

  //   if (result != null) {
  //     if (mounted) {
  //       setState(() {
  //         files = result.paths.map((path) => File(path!)).toList();
  //         for (int y = 0; y < files.length; y++) {
  //           newfiles.add(files[y]);
  //         }
  //       });
  //     }
  //   } else {
  //     // User canceled the picker
  //   }
  // }

  getImage() async {
    final List<XFile> image = (await _picker.pickMultiImage());

    if (mounted) {
      setState(() {
        for (var img in image) {
          newfiles.add(File(img.path));
          rentListingController.newfiles.add(File(img.path));
        }
      });
    }
  }

  Future handlePublish() async {
    if (_formKey4.currentState!.validate()) {
      if (rentListingController.newfiles.isEmpty ||
          rentListingController.newfiles.length < 3) {
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
          title: 'Listing Failed',
          desc: "Require a minimum of 3 images",
          showCloseIcon: true,
          btnCancelOnPress: () {},
        ).show();
      } else if (rentListingController.newfiles.length > 5) {
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
          title: 'Listing Failed',
          desc: "You can only upload a maximum of 5 images",
          showCloseIcon: true,
          btnCancelOnPress: () {},
        ).show();
      } else {
        setState(() {
          isLoading = true;
        });
        _formKey4.currentState!.save();

        final prefs = await SharedPreferences.getInstance();

        var token = prefs.getString('token');
        final request =
            http.MultipartRequest('POST', Uri.parse("$baseUrl/listing"));
        // request.fields['age_restriction'] = '0';
        // request.fields['design_type'] = widget.houseType.toString();
        // request.fields['property_address'] = widget.propertyAddress.toString();
        // request.fields['bathroom'] = widget.bathrooom.toString();
        // request.fields['bedroom'] = widget.bedroom.toString();
        // request.fields['living_room'] = widget.livingroom.toString();
        // request.fields['currency'] = "NGN";
        // request.fields['kitchen'] = widget.kitchen.toString();
        // request.fields['rental_frequency'] = widget.rent.toString();
        // request.fields['rental_fee'] = widget.rentalFee.toString();
        // request.fields['other_charges'] = '0';
        // request.fields['caution_fee'] = widget.cautionFee.toString();
        // request.fields['legal_fee'] = widget.legalFee.toString();
        // request.fields['covered_by_property'] = widget.covered.toString();
        // request.fields['agency_fee'] = widget.agencyFee.toString();
        // request.fields['state'] = 'Delta';
        // request.fields['total_area_of_land'] = widget.area.toString();
        // request.fields['interior_design'] = widget.interiorDesign.toString();
        // request.fields['parking_space'] = '0';
        // request.fields['availability_of_water'] = '0';
        // request.fields['availability_of_electricity'] = '0';
        // request.fields['description'] = formData['description'];
        // request.fields['property_type'] = widget.propertyCategory.toString();
        // request.fields['property_category'] = 'rent';
        // request.fields['status'] = 'Active';
        // request.fields['location'] = widget.location.toString();

        request.fields['facilities'] =
            jsonEncode(rentListingController.facilities);
        request.fields['age_restriction'] =
            rentListingController.ageRestriction.value == 0 ? '0' : '1';
        request.fields['design_type'] =
            rentListingController.designType.value.toString();
        request.fields['property_address'] =
            rentListingController.propertyAddress.value.toString();
        request.fields['bathroom'] =
            rentListingController.bathroom.value.toString();
        request.fields['bedroom'] =
            rentListingController.bedroom.value.toString();
        request.fields['living_room'] =
            rentListingController.livingRoom.value.toString();
        request.fields['currency'] =
            rentListingController.currency.value.toString();
        request.fields['kitchen'] =
            rentListingController.kitchen.value.toString();
        request.fields['rental_frequency'] =
            rentListingController.rentFrequency.value.toString();
        request.fields['rental_fee'] =
            rentListingController.rentFee.value.toString();
        request.fields['other_charges'] =
            rentListingController.otherCharges.value.toString() == 'Yes'
                ? '1'
                : '0';
        request.fields['caution_fee'] =
            rentListingController.otherCharges.value == 'Yes'
                ? '0'
                : rentListingController.cautionFee.value.toString();
        request.fields['serviceCharge'] =
            rentListingController.otherCharges.value == 'Yes'
                ? '0'
                : rentListingController.serviceCharge.value.toString();
        request.fields['legal_fee'] =
            rentListingController.otherCharges.value == 'Yes'
                ? '0'
                : rentListingController.legalFee.value.toString();
        request.fields['covered_by_property'] =
            rentListingController.coveredBy.value.toString();
        request.fields['agency_fee'] =
            rentListingController.otherCharges.value == 'Yes'
                ? '0'
                : rentListingController.agencyFee.value.toString();
        request.fields['state'] =
            rentListingController.location.value.toString();
        request.fields['total_area_of_land'] =
            rentListingController.totalArea.value.toString();
        request.fields['interior_design'] =
            rentListingController.interiorDesign.value.toString();
        request.fields['parking_space'] =
            rentListingController.parkingSpace.toString() == 'Yes' ? '1' : '0';

        request.fields['availability_of_water'] =
            rentListingController.water.toString() == 'Yes' ? '1' : '0';

        request.fields['availability_of_electricity'] =
            rentListingController.electricity.toString() == 'Yes' ? '1' : '0';

        request.fields['description'] =
            rentListingController.description.value.toString();
        request.fields['property_category'] =
            rentListingController.propertyCategory.toString();
        request.fields['property_type'] = "rent";
        request.fields['status'] = 'Active';
        request.fields['location'] = rentListingController.location.toString();
        request.fields['negotiable'] =
            rentListingController.negotiable.value == 1 ? '1' : '0';
        request.headers['Authorization'] = "$token";

        // List<http.MultipartFile> newList = files.cast<http.MultipartFile>();

        // for (var img in files) {
        //   if (img != null) {
        //     var multipartFile = await http.MultipartFile.fromPath(
        //       'images',
        //       img.path,
        //     );
        //     newList.add(multipartFile);
        //   }
        // }
        // request.files.addAll(newList);
        for (var file in rentListingController.newfiles) {
          final httpImage =
              await http.MultipartFile.fromPath('images', file.path);
          request.files.add(httpImage);
          print(httpImage);
        }

        var response = await request.send();
        final respStr = await response.stream.bytesToString();
        print(respStr);
        if (response.statusCode == 200) {
          // var responseData = await response.stream.toBytes();
          // var result = String.fromCharCodes(responseData);
          // print(result);
          setState(() {
            isLoading = false;
          });
          AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              borderSide: const BorderSide(
                color: Colors.green,
                width: 2,
              ),
              width: MediaQuery.of(context).size.width / 1.2,
              buttonsBorderRadius: const BorderRadius.all(
                Radius.circular(2),
              ),
              dismissOnTouchOutside: false,
              dismissOnBackKeyPress: false,
              headerAnimationLoop: false,
              animType: AnimType.bottomSlide,
              title: 'Published  successfully!',
              desc: "You can check your profile page to edit few info!",
              btnCancel: GestureDetector(
                onTap: () {
                  Get.off(HomePageRoot(navigateIndex: 0));
                },
                child: const Text(
                  "Go Home",
                  style: TextStyle(color: mobileButtonColor, fontSize: 14),
                ),
              ),
              btnOk: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: mobileButtonColor),
                  onPressed: () {
                    Get.off(ListPropertyScreen1(tab: 1));
                  },
                  child: const Text(
                    "List Another",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ))).show();
          rentListingController.handleResetInformation();
        } else if (response.statusCode == 500) {
          var msg = jsonDecode(respStr);
          print(msg['message']);
          setState(() {
            isLoading = false;
          });
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
            title: 'Listing Failed',
            desc: "something went wrong",
            showCloseIcon: true,
            btnCancelOnPress: () {},
          ).show();
        } else {
          setState(() {
            isLoading = false;
          });
          var msg = jsonDecode(respStr);
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
            title: 'Listing Failed',
            desc: msg['message'].toString(),
            showCloseIcon: true,
            btnCancelOnPress: () {},
          ).show();
        }
      }
    }
  }

  Future handleSave() async {
    if (_formKey4.currentState!.validate()) {
      if (rentListingController.newfiles.isEmpty ||
          rentListingController.newfiles.length < 3) {
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
          title: 'Listing Failed',
          desc: "Require a minimum of 3 images",
          showCloseIcon: true,
          btnCancelOnPress: () {},
        ).show();
      } else if (rentListingController.newfiles.length > 5) {
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
          title: 'Listing Failed',
          desc: "You can only upload a maximum of 5 images",
          showCloseIcon: true,
          btnCancelOnPress: () {},
        ).show();
      } else {
        setState(() {
          isSaving = true;
        });

        final prefs = await SharedPreferences.getInstance();

        var token = prefs.getString('token');
        final request =
            http.MultipartRequest('POST', Uri.parse("$baseUrl/listing"));
        // request.fields['age_restriction'] = '0';
        // request.fields['design_type'] = widget.houseType.toString();
        // request.fields['property_address'] = widget.propertyAddress.toString();
        // request.fields['bathroom'] = widget.bathrooom.toString();
        // request.fields['bedroom'] = widget.bedroom.toString();
        // request.fields['living_room'] = widget.livingroom.toString();
        // request.fields['currency'] = "NGN";
        // request.fields['kitchen'] = widget.kitchen.toString();
        // request.fields['rental_frequency'] = widget.rent.toString();
        // request.fields['rental_fee'] = widget.rentalFee.toString();
        // request.fields['other_charges'] = '0';
        // request.fields['caution_fee'] = widget.cautionFee.toString();
        // request.fields['legal_fee'] = widget.legalFee.toString();
        // request.fields['covered_by_property'] = widget.covered.toString();
        // request.fields['agency_fee'] = widget.agencyFee.toString();
        // request.fields['state'] = 'Delta';
        // request.fields['total_area_of_land'] = widget.area.toString();
        // request.fields['interior_design'] = widget.interiorDesign.toString();
        // request.fields['parking_space'] = '0';
        // request.fields['availability_of_water'] = '0';
        // request.fields['availability_of_electricity'] = '0';
        // request.fields['description'] = formData['description'];
        // request.fields['property_type'] = widget.propertyCategory.toString();
        // request.fields['property_category'] = 'rent';
        // request.fields['status'] = 'Active';
        // request.fields['location'] = widget.location.toString();
        request.fields['facilities'] =
            jsonEncode(rentListingController.facilities);
        request.fields['age_restriction'] =
            rentListingController.ageRestriction.value == 0 ? '0' : '1';
        request.fields['design_type'] =
            rentListingController.designType.value.toString();
        request.fields['property_address'] =
            rentListingController.propertyAddress.value.toString();
        request.fields['bathroom'] =
            rentListingController.bathroom.value.toString();
        request.fields['bedroom'] =
            rentListingController.bedroom.value.toString();
        request.fields['living_room'] =
            rentListingController.livingRoom.value.toString();
        request.fields['currency'] =
            rentListingController.currency.value.toString();
        request.fields['kitchen'] =
            rentListingController.kitchen.value.toString();
        request.fields['rental_frequency'] =
            rentListingController.rentFrequency.value.toString();
        request.fields['rental_fee'] =
            rentListingController.rentFee.value.toString();
        request.fields['other_charges'] =
            rentListingController.otherCharges.value.toString() == 'Yes'
                ? '1'
                : '0';
        request.fields['caution_fee'] =
            rentListingController.otherCharges.value == 'Yes'
                ? '0'
                : rentListingController.cautionFee.value.toString();
        request.fields['legal_fee'] =
            rentListingController.otherCharges.value == 'Yes'
                ? '0'
                : rentListingController.legalFee.value.toString();
        request.fields['covered_by_property'] =
            rentListingController.coveredBy.value.toString();
        request.fields['agency_fee'] =
            rentListingController.otherCharges.value == 'Yes'
                ? '0'
                : rentListingController.agencyFee.value.toString();
        request.fields['state'] =
            rentListingController.location.value.toString();
        request.fields['total_area_of_land'] =
            rentListingController.totalArea.value.toString();
        request.fields['interior_design'] =
            rentListingController.interiorDesign.value.toString();
        request.fields['parking_space'] =
            rentListingController.parkingSpace.toString() == 'Yes' ? '1' : '0';

        request.fields['availability_of_water'] =
            rentListingController.water.toString() == 'Yes' ? '1' : '0';

        request.fields['availability_of_electricity'] =
            rentListingController.electricity.toString() == 'Yes' ? '1' : '0';

        request.fields['description'] =
            rentListingController.description.value.toString();
        request.fields['property_category'] =
            rentListingController.propertyCategory.toString();
        request.fields['property_type'] = "rent";
        request.fields['status'] = 'Saved';
        request.fields['location'] = rentListingController.location.toString();
        request.fields['negotiable'] =
            rentListingController.negotiable.value == 1 ? '1' : '0';
        request.headers['Authorization'] = "$token";

        // List<http.MultipartFile> newList = files.cast<http.MultipartFile>();

        // for (var img in files) {
        //   if (img != null) {
        //     var multipartFile = await http.MultipartFile.fromPath(
        //       'images',
        //       img.path,
        //     );
        //     newList.add(multipartFile);
        //   }
        // }
        // request.files.addAll(newList);
        for (var file in rentListingController.newfiles) {
          final httpImage =
              await http.MultipartFile.fromPath('images', file.path);
          request.files.add(httpImage);
          print(httpImage);
        }

        var response = await request.send();
        final respStr = await response.stream.bytesToString();
        print(respStr);
        if (response.statusCode == 200) {
          // var responseData = await response.stream.toBytes();
          // var result = String.fromCharCodes(responseData);
          // print(result);
          setState(() {
            isSaving = false;
          });
          rentListingController.handleResetInformation();

          AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              borderSide: const BorderSide(
                color: Colors.green,
                width: 2,
              ),
              width: MediaQuery.of(context).size.width / 1.2,
              buttonsBorderRadius: const BorderRadius.all(
                Radius.circular(2),
              ),
              dismissOnTouchOutside: false,
              dismissOnBackKeyPress: false,
              headerAnimationLoop: false,
              animType: AnimType.bottomSlide,
              title: 'Saved to draft  successfully!',
              desc: "You can check your profile page to edit and publish!",
              btnCancel: GestureDetector(
                onTap: () {
                  Get.off(HomePageRoot(navigateIndex: 0));
                },
                child: const Text(
                  "Go Home",
                  style: TextStyle(color: mobileButtonColor, fontSize: 14),
                ),
              ),
              btnOk: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: mobileButtonColor),
                  onPressed: () {
                    Get.off(ListPropertyScreen1(tab: 1));
                  },
                  child: const Text(
                    "List Another",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ))).show();
        } else if (response.statusCode == 500) {
          var msg = jsonDecode(respStr);
          print(msg['message']);
          setState(() {
            isSaving = false;
          });
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
            title: 'Listing Failed',
            desc: "something went wrong",
            showCloseIcon: true,
            btnCancelOnPress: () {},
          ).show();
        } else {
          setState(() {
            isSaving = false;
          });
          var msg = jsonDecode(respStr);
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
            title: 'Listing Failed',
            desc: msg['message'].toString(),
            showCloseIcon: true,
            btnCancelOnPress: () {},
          ).show();
        }
      }
    }
  }
}
