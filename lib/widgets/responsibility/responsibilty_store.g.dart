// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responsibilty_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResponsibiltyStore on _ResponsibiltyStore, Store {
  final _$titleAtom = Atom(name: '_ResponsibiltyStore.title');

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

  final _$descripAtom = Atom(name: '_ResponsibiltyStore.descrip');

  @override
  String get descrip {
    _$descripAtom.reportRead();
    return super.descrip;
  }

  @override
  set descrip(String value) {
    _$descripAtom.reportWrite(value, super.descrip, () {
      super.descrip = value;
    });
  }

  final _$getDescriptionAsyncAction =
      AsyncAction('_ResponsibiltyStore.getDescription');

  @override
  Future getDescription() {
    return _$getDescriptionAsyncAction.run(() => super.getDescription());
  }

  @override
  String toString() {
    return '''
title: ${title},
descrip: ${descrip}
    ''';
  }
}
