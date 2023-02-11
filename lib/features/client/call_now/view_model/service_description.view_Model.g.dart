// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_description.view_Model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ServiceDescriptionViewModel on _ServiceDescriptionViewModelBase, Store {
  late final _$selectedImagesAtom = Atom(
      name: '_ServiceDescriptionViewModelBase.selectedImages',
      context: context);

  @override
  List<XFile?> get selectedImages {
    _$selectedImagesAtom.reportRead();
    return super.selectedImages;
  }

  @override
  set selectedImages(List<XFile?> value) {
    _$selectedImagesAtom.reportWrite(value, super.selectedImages, () {
      super.selectedImages = value;
    });
  }

  late final _$_ServiceDescriptionViewModelBaseActionController =
      ActionController(
          name: '_ServiceDescriptionViewModelBase', context: context);

  @override
  void addImageToList(XFile? newValue) {
    final _$actionInfo = _$_ServiceDescriptionViewModelBaseActionController
        .startAction(name: '_ServiceDescriptionViewModelBase.addImageToList');
    try {
      return super.addImageToList(newValue);
    } finally {
      _$_ServiceDescriptionViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void addImageAllToList(List<XFile?> newValue) {
    final _$actionInfo =
        _$_ServiceDescriptionViewModelBaseActionController.startAction(
            name: '_ServiceDescriptionViewModelBase.addImageAllToList');
    try {
      return super.addImageAllToList(newValue);
    } finally {
      _$_ServiceDescriptionViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void removeImageToList(XFile? value) {
    final _$actionInfo =
        _$_ServiceDescriptionViewModelBaseActionController.startAction(
            name: '_ServiceDescriptionViewModelBase.removeImageToList');
    try {
      return super.removeImageToList(value);
    } finally {
      _$_ServiceDescriptionViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedImages: ${selectedImages}
    ''';
  }
}
