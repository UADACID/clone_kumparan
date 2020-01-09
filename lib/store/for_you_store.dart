import 'package:mobx/mobx.dart';

part 'for_you_store.g.dart';

class ForYouStore extends _ForYouStore with _$ForYouStore {}

abstract class _ForYouStore with Store {
  @observable
  bool isHideOption = false;

  @observable
  bool isLoading = true;

  @observable
  bool isShowBottomSheet = false;

  @action
  void setHideOption(value) {
    isHideOption = value;
  }

  @action
  void setLoading(value){
    isLoading = value;
  }

  @action
  void setShowBottomSheet(value){
    isShowBottomSheet = value;
  }
}