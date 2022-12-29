import 'package:findcribs/models/house_list_model.dart';
import 'package:findcribs/screens/agent_profile/components/business_detail/listings/active_listing/category/single_property_status.dart';
import 'package:findcribs/service/active_list_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:progress_indicators/progress_indicators.dart';

class ActiveListingForSale extends StatefulWidget {
  const ActiveListingForSale({Key? key}) : super(key: key);

  @override
  State<ActiveListingForSale> createState() => _ActiveListingForSaleState();
}

class _ActiveListingForSaleState extends State<ActiveListingForSale> {
  late Future<List<HouseListModel>> propertyList;
  List<HouseListModel> filteredList = [];
  List<HouseListModel> firstList = [];
  bool isLoading = true;
  // late Future<List<FavouriteStoryListModel>> storyList;
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
  @override
  void initState() {
    super.initState();
    propertyList = getActivePropertyList();
    // storyList = getFavouriteStoryList();
    propertyList.then((value) {
      // print(value);
      setState(() {
        firstList = filteredList = value;
        isLoading = false;
        handleFilter('Active');
      });
    });
  }

  handleFilter(String value) {
    setState(() {
      filteredList = firstList.where((element) {
        return element.status!.toLowerCase() == value.toLowerCase() &&
            element.propertyType!.toLowerCase() == 'sale' &&
            element.propertyCategory!.toLowerCase() != 'estate market';
      }).toList();
      // print(filteredList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CollectionSlideTransition(
                    children: const <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 12,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 12,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.yellow,
                        radius: 12,
                      ),
                    ],
                  ),
                  FadingText('Loading...'),
                ],
              ),
            )
          : filteredList.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/opps.png"),
                      const Text(
                        "Opps!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text("No Item Available"),
                    ],
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    int salesPrice =
                        int.parse(filteredList[index].rentalFee.toString());
                    int cautionFee =
                        int.parse(filteredList[index].cautionFee.toString());
                    int legalFee =
                        int.parse(filteredList[index].legalFee.toString());
                    int agencyFee =
                        int.parse(filteredList[index].agencyFee.toString());
                    int totalprice = (salesPrice +
                        (cautionFee) +
                        (salesPrice * legalFee) ~/ 100 +
                        (salesPrice * agencyFee) ~/ 100);
                    var formatter = NumberFormat("#,###");
                    var formatedPrice = formatter.format(totalprice);
                    return SinglePropertyStatus(
                      viewCount: filteredList[index].viewCount.toString(),
                      likeCOunt: filteredList[index].likeCount.toString(),
                      image: filteredList[index].image,
                      currency: filteredList[index].currency,
                      propertyAddress: filteredList[index].propertyAddress,
                      propertyLocation: filteredList[index].state,
                      id: filteredList[index].id.toString(),
                      formattedPrice: formatedPrice,
                      status: 'Active',
                      isPromoted: filteredList[index].isPromoted,
                      category: 'sale',
                      propertyName: filteredList[index].propertyName.toString(),
                    );
                  }),
    );
  }
}
