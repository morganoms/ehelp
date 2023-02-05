import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'service_description.view_Model.g.dart';

class ServiceDescriptionViewModel = _ServiceDescriptionViewModelBase
    with _$ServiceDescriptionViewModel;

abstract class _ServiceDescriptionViewModelBase with Store {
  @observable
  List<XFile?> selectedImages = <XFile?>[].asObservable();

  @action
  void addImageToList(final XFile? newValue) => selectedImages.add(newValue);

  @action
  void addImageAllToList(final List<XFile?> newValue) =>
      selectedImages.addAll(newValue);

  @action
  void removeImageToList(final XFile? value) => selectedImages.remove(value);
}
