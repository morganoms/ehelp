// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_area.view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeAreaViewModel on _HomeAreaViewModelBase, Store {
  late final _$serviceSelectedAtom =
      Atom(name: '_HomeAreaViewModelBase.serviceSelected', context: context);

  @override
  String get serviceSelected {
    _$serviceSelectedAtom.reportRead();
    return super.serviceSelected;
  }

  @override
  set serviceSelected(String value) {
    _$serviceSelectedAtom.reportWrite(value, super.serviceSelected, () {
      super.serviceSelected = value;
    });
  }

  late final _$_HomeAreaViewModelBaseActionController =
      ActionController(name: '_HomeAreaViewModelBase', context: context);

  @override
  String setServiceSelected(String newValue) {
    final _$actionInfo = _$_HomeAreaViewModelBaseActionController.startAction(
        name: '_HomeAreaViewModelBase.setServiceSelected');
    try {
      return super.setServiceSelected(newValue);
    } finally {
      _$_HomeAreaViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
serviceSelected: ${serviceSelected}
    ''';
  }
}
