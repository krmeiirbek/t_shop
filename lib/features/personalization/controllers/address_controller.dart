import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repository/address/address_repository.dart';
import 'package:t_store/features/personalization/models/address_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';
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
  final addressRepository = Get.put(AddressRepository());
  final selectedAddress = AddressModel.empty().obs;

  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere((element) => element.selectedAddress, orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
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
      TLoaders.errorSnackBar(title: 'Error in selection', message: e.toString());
    }
  }

  Future<void> addNewAddresses() async {
    try {
      TFullScreenLoader.openLoadingDialog('Storing address...', TImages.loading);

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
      TLoaders.successSnackBar(title: 'Құттықтаймыз', message: 'Сіздің мекен-жайыңыз сәтті сақталды.');
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Address not found!', message: e.toString());
    }
  }

  Future<void> deleteAddresses(String addressId) async {
    try {
      await addressRepository.deleteAddress(addressId);
      refreshData.toggle();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Address not found!', message: e.toString());
    }
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
