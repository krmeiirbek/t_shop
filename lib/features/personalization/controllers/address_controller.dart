import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/data/repository/address/address_repository.dart';
import 'package:t_store/features/personalization/models/address_model.dart';
import 'package:t_store/features/personalization/screens/address/add_new_address.dart';
import 'package:t_store/features/personalization/screens/address/widgets/single_address.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final houseNumber = TextEditingController();
  final cityOrVillage = TextEditingController();
  final district = TextEditingController();
  final addressFormKey = GlobalKey<FormState>();

  final refreshData = true.obs;
  final isLoading = false.obs;
  final addressRepository = Get.put(AddressRepository());
  final selectedAddress = AddressModel.empty().obs;

  @override
  void onInit() async {
    isLoading.value = true;
    await getAllUserAddresses();
    isLoading.value = false;
    super.onInit();
  }

  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere((element) => element.selectedAddress, orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      TLoaders.errorSnackBar(title: addressNotFoundText.tr, message: e.toString());
      return [];
    }
  }

  Future<void> selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
        title: '',
        onWillPop: () async {
          return false;
        },
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const Center(child: CircularProgressIndicator()),
      );
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(selectedAddress.value.id, false);
      }

      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;
      await addressRepository.updateSelectedField(selectedAddress.value.id, true);
      Get.back();
    } catch (e) {
      TLoaders.errorSnackBar(title: errorInSelectionText.tr, message: e.toString());
    }
  }

  Future<void> addNewAddresses() async {
    try {
      TFullScreenLoader.openLoadingDialog(storingAddressText.tr, TImages.loading);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (!addressFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        cityOrVillage: cityOrVillage.text.trim(),
        district: district.text.trim(),
        houseNumber: houseNumber.text.trim(),
        selectedAddress: true,
      );
      final id = await addressRepository.addAddress(address);

      address.id = id;
      await selectAddress(address);
      TFullScreenLoader.stopLoading();
      refreshData.toggle();
      resetFormFields();
      Navigator.of(Get.overlayContext!).pop();
      TLoaders.successSnackBar(title: congratulationsText.tr, message: yourAddressHasBeenSuccessfullySavedText.tr);
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: addressNotFoundText.tr, message: e.toString());
    }
  }

  Future<void> deleteAddresses(String addressId) async {
    try {
      await addressRepository.deleteAddress(addressId);
      refreshData.toggle();
    } catch (e) {
      TLoaders.errorSnackBar(title: addressNotFoundText.tr, message: e.toString());
    }
  }

  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => Container(
        padding: EdgeInsets.all(TSizes.lg),
        child: Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TSectionHeading(title: selectAddressText.tr, showActionButton: false),
              Expanded(
                child: Obx(
                  () => FutureBuilder(
                    key: Key(refreshData.value.toString()),
                    future: getAllUserAddresses(),
                    builder: (_, snapshot) {
                      final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                      if (response != null) return response;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => TSingleAddress(
                          address: snapshot.data![index],
                          onTap: () async {
                            await selectAddress(snapshot.data![index]);
                            Get.back();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const AddNewAddressScreen()),
              child: Text(addNewAddressText.tr),
            ),
          ),
        ),
      ),
    );
  }

  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    houseNumber.clear();
    cityOrVillage.clear();
    district.clear();
    addressFormKey.currentState!.reset();
  }

  @override
  void dispose() {
    name.dispose();
    phoneNumber.dispose();
    street.dispose();
    houseNumber.dispose();
    cityOrVillage.dispose();
    district.dispose();
    super.dispose();
  }
}
