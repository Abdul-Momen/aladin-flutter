import 'package:aladin/modules/address/controller/address_controller.dart';
import 'package:aladin/modules/address/view/screen/address_book.dart';
import 'package:aladin/states/data/prefs.dart';
import 'package:aladin/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants/color.dart';
import '../../../../constants/string.dart';
import '../../../../helper/helper.dart';
import '../../../../states/controller/country_controller.dart';
import '../../../../states/utils/methods.dart';
import '../../../../widget/custom_appbar.dart';
import '../../../../states/model/all_country_model.dart';

class AddEditAddressScreen extends StatefulWidget {
  static String routeName = "/editAddressBook";

  const AddEditAddressScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddEditAddressScreen> createState() => _AddEditAddressScreenState();
}

class _AddEditAddressScreenState extends State<AddEditAddressScreen> {
  final CountryController _countryController = Get.put(CountryController());

  //String dropdownvalue = 'Country';

  final AddressController addressController = Get.put(AddressController());

  TextEditingController searchController = TextEditingController();
//  final TextEditingController _fullNameCon = TextEditingController();
  TextEditingController phNumController = TextEditingController();
  TextEditingController countryLocationController = TextEditingController();
 // TextEditingController cityLocationController = TextEditingController();
  TextEditingController apartmentNoController = TextEditingController();
  TextEditingController extraDirectionController = TextEditingController();
  TextEditingController currentLocationController = TextEditingController();
  TextEditingController areaCon = TextEditingController();

  @override
  void initState() {
    _countryController.getAllCountry();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 60.h,
        color: Colors.white,
        title: "Add or Edit Address",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250.h,
              width: double.infinity,
              child: Stack(
                children: [
                  SizedBox(
                    height: 250.h,
                    width: MediaQuery.sizeOf(context).width,
                    child: Image.asset(
                      "assets/images/example_map.png",
                      fit: BoxFit.fill,
                    ),
                  ),
       /*           Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Container(
                      height: 54.h,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.blueGrey)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              onTap: () {
                                /// widget.productCon.getSearchAllProducts( q: "cool");
                              },
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal,
                              ),
                              decoration: InputDecoration(
                                  //  suffixIcon: Icon(Icons.search),
                                  prefixIcon: const Icon(Icons.menu),
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.only(left: 80.w),
                                    child: InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.search,
                                        color: Colors.black54,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  hintText: "Location",
                                  hintStyle:
                                      const TextStyle(height: 1.5, fontSize: 14)
                                  // hintText: '${LocaleKeys.app_bar.tr}',
                                  ),
                              onChanged: (value) {
                                *//* searchCon.clear();
                          showSearch(
                            context: context,
                            // delegate to customize the search bar
                            delegate: CustomSearchDelegate());

                          /// widget.productCon.getSearchAllProducts( q: "cool");*//*
                              },
                            ),
                          ),
                          addW(10),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border.symmetric(
                                    vertical: BorderSide(
                                        color: Colors.black, width: 0.3)),
                              ),
                              height: 54.h,
                              width: 53.h,
                              child: const Icon(
                                Icons.cancel,
                                color: Colors.grey,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 20.h),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: apartmentNoController,
                      onChanged: (value) {
                        print(value);
                      },
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Apartment/Villa Number',
                        prefixIcon: const Icon(Icons.home),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              6), //circular border for TextField.
                        ),
                      ),
                    ),
                  ),
                  addH(10),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: currentLocationController,
                      onChanged: (value) {
                        print(value);
                      },
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Address',
                        prefixIcon: const Icon(Icons.location_history_rounded),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              6), //circular border for TextField.
                        ),
                      ),
                    ),
                  ),
                  addH(10),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: phNumController,
                      onChanged: (value) {
                        print(value);
                      },
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        prefixIcon: const Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              6), //circular border for TextField.
                        ),
                      ),
                    ),
                  ),
                  addH(10),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 0.80),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Icon(Icons.location_on_outlined),
                              ),
                              Expanded(
                                child: Obx(() {
                                  if (_countryController
                                      .pAllCountryLoading.value) {
                                    return const Column(
                                      children: [
                                        Center(
                                          child: Text(''),
                                        ),
                                      ],
                                    );
                                  } else {
                                    String countryName = '';
                                    for (int i = 0;
                                        i <
                                            _countryController
                                                .allCountryModel
                                                .value
                                                .data!
                                                .countries
                                                .length;
                                        i++) {
                                      if (Preference.getCountryId() ==
                                          _countryController
                                              .allCountryModel
                                              .value
                                              .data!
                                              .countries[i]
                                              .countryId) {
                                        countryName = _countryController
                                                .allCountryModel
                                                .value
                                                .data!
                                                .countries[i]
                                                .countryName ??
                                            '';
                                      }
                                    }

                                    return Container(
                                      width: 270.w,
                                      height: 46.h,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.white.withOpacity(0.3),
                                          border: Border.all(
                                              width: 2,
                                              color: Colors.white.withOpacity(0.5),
                                              strokeAlign:
                                              BorderSide.strokeAlignCenter)),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          countryName,

                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    );

                                    DropdownButton<Country>(
                                      elevation: 0,
                                      value: _countryController
                                          .dropdownvalue.value,
                                      icon: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Icon(
                                            Icons.arrow_drop_down_outlined,
                                            size: 20,
                                            color: Colors.black),
                                      ),
                                      items: _countryController
                                          .allCountryModel
                                          .value
                                          .data!
                                          .countries
                                          .map(
                                            (map) =>
                                                DropdownMenuItem<Country>(
                                              value: map,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(
                                                        8.0),
                                                child: Text(
                                                  map.countryName ?? '',
                                                  style: const TextStyle(
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (Country? newValue) {
                                        //setState(() {
                                        _countryController.dropdownvalue
                                            .value = newValue!;
                                        // Preference.setCountryId(_countryController.dropdownvalue.value!.countryId??201);
                                        /*       Future.delayed( const Duration(seconds: 2),
                                              () {
                                            setState(() {
                                              Get.offAllNamed(HomeScreen.routeName);
                                            });
                                          },);*/
                                        //   });
                                      },
                                    );
                                  }
                                }),
                              ),

                              /*    Expanded(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    elevation: 0,
                                    value: dropdownvalue,
                                    icon: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Icon(Icons.keyboard_arrow_down),
                                    ),
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                          value: items, child: Text(items,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),));
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue = newValue!;
                                      });
                                    },
                                  ),
                                ),
                              ),*/
                            ],
                          ),
                        ),
                      ),
                      /*  addW(8.w),
                      Expanded(
                        child: SizedBox(
                          height: 50.h,
                          child: TextField(
                            controller: cityLocationController,
                            onChanged: (value) {
                              print(value);
                            },
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            decoration: InputDecoration(
                              hintText: 'City',
                              prefixIcon: const Icon(Icons.location_on_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    6), //circular border for TextField.
                              ),
                            ),
                          ),
                        ),
                      ),*/
                    ],
                  ),
                  addH(10),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: extraDirectionController,
                      onChanged: (value) {
                        print(value);
                      },
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Extra Directions',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        prefixIcon: const Icon(Icons.airline_stops),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              6), //circular border for TextField.
                        ),
                      ),
                    ),
                  ),
                  /*   addH(10),
                  SizedBox(
                    height : 50,
                    child: TextField(
                      controller: currentLocationController,
                      onChanged: (value) {
                        print(value);
                      },
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Current Location',
                        prefixIcon: Icon(Icons.my_location),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              6), //circular border for TextField.
                        ),
                      ),
                    ),
                  ),*/
                  addH(80),
                  CustomElevatedButton(
                    width: double.infinity,
                    height: 50.h,
                    onPressed: () {
                      if (apartmentNoController.text.isEmpty ||
                       //   _fullNameCon.text.isEmpty ||
                       //   cityLocationController.text.isEmpty ||
                          extraDirectionController.text.isEmpty) {
                        Methods.showSnackbar(
                            //  context: context,
                            msg: ConstantStrings.kEmptyFields);
                        return;
                      }

                      FocusManager.instance.primaryFocus?.unfocus();
                      if (phNumController.text.length < 5) {
                        Methods.showSnackbar(
                            //  context: context,
                            msg: 'Please enter a valid phone number');

                        return;
                      }

                      addressController.postAddAddress(
                          addressBookId: 0,
                          fullName: Preference.getFullName(),
                          mobileNumber: phNumController.text,
                          area: '',
                          apartmentNo: apartmentNoController.text,
                          extraDirection: extraDirectionController.text,
                          currentLocation: currentLocationController.text,
                          latitude: "",
                          longitude: "",
                          memberId: Preference.getMemberId(),
                          isDefault: true);

                      Get.defaultDialog(
                        title: "Adding..",
                        content: Obx(
                          () {
                            if (addressController.pAddAddressLoading.value) {
                              return  Column(
                                children: [
                                  Center(
                                    child: CircularProgressIndicator(
                                      color: ConstantColors.darkYellow,

                                    ),
                                  ),
                                ],
                              );
                            } else {
                              if (addressController.addAddressModel!.code ==
                                  200) {
                                Future.delayed(
                                  const Duration(seconds: 1),
                                  () {
                                    setState(() {
                                      addressController.getMemberAddress(
                                          memberId: Preference.getMemberId());
                                      Get.back();
                                      Get.back();
                                      Get.offAndToNamed(AddressBook.routeName);
                                    });
                                  },
                                );
                                return const Text('Saved');
                              } else {
                                return const Text('Failed to save address');
                              }
                            }
                          },
                        ),
                      );
                    },
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          ConstantColors.lightYellow,
                          ConstantColors.darkYellow
                        ]),
                    borderRadius: BorderRadius.circular(5),
                    child: Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
