// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'for_you_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ForYouStore on _ForYouStore, Store {
  final _$isHideOptionAtom = Atom(name: '_ForYouStore.isHideOption');

  @override
  bool get isHideOption {
    _$isHideOptionAtom.context.enforceReadPolicy(_$isHideOptionAtom);
    _$isHideOptionAtom.reportObserved();
    return super.isHideOption;
  }

  @override
  set isHideOption(bool value) {
    _$isHideOptionAtom.context.conditionallyRunInAction(() {
      super.isHideOption = value;
      _$isHideOptionAtom.reportChanged();
    }, _$isHideOptionAtom, name: '${_$isHideOptionAtom.name}_set');
  }

  final _$isLoadingAtom = Atom(name: '_ForYouStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$isShowBottomSheetAtom = Atom(name: '_ForYouStore.isShowBottomSheet');

  @override
  bool get isShowBottomSheet {
    _$isShowBottomSheetAtom.context.enforceReadPolicy(_$isShowBottomSheetAtom);
    _$isShowBottomSheetAtom.reportObserved();
    return super.isShowBottomSheet;
  }

  @override
  set isShowBottomSheet(bool value) {
    _$isShowBottomSheetAtom.context.conditionallyRunInAction(() {
      super.isShowBottomSheet = value;
      _$isShowBottomSheetAtom.reportChanged();
    }, _$isShowBottomSheetAtom, name: '${_$isShowBottomSheetAtom.name}_set');
  }

  final _$_ForYouStoreActionController = ActionController(name: '_ForYouStore');

  @override
  void setHideOption(dynamic value) {
    final _$actionInfo = _$_ForYouStoreActionController.startAction();
    try {
      return super.setHideOption(value);
    } finally {
      _$_ForYouStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(dynamic value) {
    final _$actionInfo = _$_ForYouStoreActionController.startAction();
    try {
      return super.setLoading(value);
    } finally {
      _$_ForYouStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShowBottomSheet(dynamic value) {
    final _$actionInfo = _$_ForYouStoreActionController.startAction();
    try {
      return super.setShowBottomSheet(value);
    } finally {
      _$_ForYouStoreActionController.endAction(_$actionInfo);
    }
  }
}
