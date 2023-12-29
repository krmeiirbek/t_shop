import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class TCloudHelperFunctions {
  static Widget? checkSingleRecordState<T>(AsyncSnapshot<T> snapshot) {
    const loader = Center(child: CircularProgressIndicator());
    if (snapshot.connectionState == ConnectionState.waiting) {
      return loader;
    }
    if (!snapshot.hasData || snapshot.data == null) {
      return const Center(
        child: Text(
          'Ешнәрсе табылмады',
        ),
      );
    }

    if (snapshot.hasError) {
      return const Center(
        child: Text(
          'Бірнәрсе дұрыс болмады',
        ),
      );
    }

    return null;
  }

  static Widget? checkMultiRecordState<T>({
    required AsyncSnapshot<List<T>> snapshot,
    Widget? loader,
    Widget? error,
    Widget? nothingFound,
  }) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return loader ?? const Center(child: CircularProgressIndicator());
    }
    if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
      return nothingFound ??
          const Center(
            child: Text(
              'Ешнәрсе табылмады',
            ),
          );
    }

    if (snapshot.hasError) {
      return error ??
          const Center(
            child: Text(
              'Бірнәрсе дұрыс болмады',
            ),
          );
    }

    return null;
  }

  static Future<String> getURLFromFilePathAndName(String path) async {
    try {
      if (path.isEmpty) return '';
      final ref = FirebaseStorage.instance.ref().child(path);
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatExceptions().message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Бірдеңе дұрыс болмады: $e';
    }
  }
}
