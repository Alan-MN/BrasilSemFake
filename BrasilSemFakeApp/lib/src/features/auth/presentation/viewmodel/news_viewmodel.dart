import 'package:basearch/src/features/auth/domain/model/news_verification.dart';
import 'package:basearch/src/features/auth/domain/usecase/news_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'news_viewmodel.g.dart';

class NewsViewModel = _NewsViewModelBase with _$NewsViewModel;

abstract class _NewsViewModelBase with Store {
  final _usecase = Modular.get<NewsUseCase>();
  final validator = NewsVerification();

  @observable
  String title = '';

  @observable
  String text = '';

  @action
  void setTitle(String value) {
    title = value;
  }

  String getTitle() {
    return title;
  }

  @action
  void setText(String value) {
    text = value;
  }

  String getText() {
    return text;
  }

  String? validateTitle(){
    return validator.titleVerification(title);
  }

  String? validateText(){
    return validator.textVerification(text);
  }

  void create() async {
    await _usecase.create(title, text);
  }
}

