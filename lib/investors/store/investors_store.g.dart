// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investors_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InvestorsStore on Investors, Store {
  final _$corporateActionListAtom = Atom(name: 'Investors.corporateActionList');

  @override
  List<CorporateActionJSON> get corporateActionList {
    _$corporateActionListAtom.reportRead();
    return super.corporateActionList;
  }

  @override
  set corporateActionList(List<CorporateActionJSON> value) {
    _$corporateActionListAtom.reportWrite(value, super.corporateActionList, () {
      super.corporateActionList = value;
    });
  }

  final _$extractCorporateActionAsyncAction =
      AsyncAction('Investors.extractCorporateAction');

  @override
  Future extractCorporateAction() {
    return _$extractCorporateActionAsyncAction
        .run(() => super.extractCorporateAction());
  }

  @override
  String toString() {
    return '''
corporateActionList: ${corporateActionList}
    ''';
  }
}
