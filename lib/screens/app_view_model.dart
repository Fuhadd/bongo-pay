import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final idTypeProvider = StateProvider<String?>((ref) => null);
final userPhotoIdProvider = StateProvider<File?>((ref) => null);
final userPhotoFileProvider = StateProvider<PlatformFile?>((ref) => null);

final transferSelectedCurrencyProvider = StateProvider<String>((ref) => "CAD");
final transferReceipientSelectedCurrencyProvider =
    StateProvider<String>((ref) => "CAD");

final tradeSelectedCurrencyProvider = StateProvider<String>((ref) => "USD");
final tradeReceipientSelectedCurrencyProvider =
    StateProvider<String>((ref) => "EUR");

final rateProvider = StateProvider<int>((ref) => 0);
