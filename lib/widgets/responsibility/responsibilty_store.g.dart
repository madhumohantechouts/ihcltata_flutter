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

  final _$bannerListAtom = Atom(name: '_ResponsibiltyStore.bannerList');

  @override
  List<Result> get bannerList {
    _$bannerListAtom.reportRead();
    return super.bannerList;
  }

  @override
  set bannerList(List<Result> value) {
    _$bannerListAtom.reportWrite(value, super.bannerList, () {
      super.bannerList = value;
    });
  }

  final _$dataListAtom = Atom(name: '_ResponsibiltyStore.dataList');

  @override
  List<CorporateSocialResponsibilityData> get dataList {
    _$dataListAtom.reportRead();
    return super.dataList;
  }

  @override
  set dataList(List<CorporateSocialResponsibilityData> value) {
    _$dataListAtom.reportWrite(value, super.dataList, () {
      super.dataList = value;
    });
  }

  final _$impactListAtom = Atom(name: '_ResponsibiltyStore.impactList');

  @override
  List<InititaivesImpactData> get impactList {
    _$impactListAtom.reportRead();
    return super.impactList;
  }

  @override
  set impactList(List<InititaivesImpactData> value) {
    _$impactListAtom.reportWrite(value, super.impactList, () {
      super.impactList = value;
    });
  }

  final _$pdfListAtom = Atom(name: '_ResponsibiltyStore.pdfList');

  @override
  List<PdfDownloadData> get pdfList {
    _$pdfListAtom.reportRead();
    return super.pdfList;
  }

  @override
  set pdfList(List<PdfDownloadData> value) {
    _$pdfListAtom.reportWrite(value, super.pdfList, () {
      super.pdfList = value;
    });
  }

  final _$getDescriptionAsyncAction =
      AsyncAction('_ResponsibiltyStore.getDescription');

  @override
  Future<dynamic> getDescription() {
    return _$getDescriptionAsyncAction.run(() => super.getDescription());
  }

  final _$getBannerAsyncAction = AsyncAction('_ResponsibiltyStore.getBanner');

  @override
  Future<dynamic> getBanner() {
    return _$getBannerAsyncAction.run(() => super.getBanner());
  }

  final _$getResDataAsyncAction = AsyncAction('_ResponsibiltyStore.getResData');

  @override
  Future<dynamic> getResData() {
    return _$getResDataAsyncAction.run(() => super.getResData());
  }

  final _$getImpactAsyncAction = AsyncAction('_ResponsibiltyStore.getImpact');

  @override
  Future<dynamic> getImpact() {
    return _$getImpactAsyncAction.run(() => super.getImpact());
  }

  final _$getPdfAsyncAction = AsyncAction('_ResponsibiltyStore.getPdf');

  @override
  Future getPdf() {
    return _$getPdfAsyncAction.run(() => super.getPdf());
  }

  @override
  String toString() {
    return '''
title: ${title},
descrip: ${descrip},
bannerList: ${bannerList},
dataList: ${dataList},
impactList: ${impactList},
pdfList: ${pdfList}
    ''';
  }
}
