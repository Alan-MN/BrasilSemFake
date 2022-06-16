// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsViewModel on _NewsViewModelBase, Store {
  final _$titleAtom = Atom(name: '_NewsViewModelBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$textAtom = Atom(name: '_NewsViewModelBase.text');

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  final _$_NewsViewModelBaseActionController =
      ActionController(name: '_NewsViewModelBase');

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_NewsViewModelBaseActionController.startAction(
        name: '_NewsViewModelBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_NewsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setText(String value) {
    final _$actionInfo = _$_NewsViewModelBaseActionController.startAction(
        name: '_NewsViewModelBase.setText');
    try {
      return super.setText(value);
    } finally {
      _$_NewsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
text: ${text}
    ''';
  }
}
