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

  final _$financialResultListAtom = Atom(name: 'Investors.financialResultList');

  @override
  List<FinancialResultJSON> get financialResultList {
    _$financialResultListAtom.reportRead();
    return super.financialResultList;
  }

  @override
  set financialResultList(List<FinancialResultJSON> value) {
    _$financialResultListAtom.reportWrite(value, super.financialResultList, () {
      super.financialResultList = value;
    });
  }

  final _$agmListAtom = Atom(name: 'Investors.agmList');

  @override
  List<AGMJSON> get agmList {
    _$agmListAtom.reportRead();
    return super.agmList;
  }

  @override
  set agmList(List<AGMJSON> value) {
    _$agmListAtom.reportWrite(value, super.agmList, () {
      super.agmList = value;
    });
  }

  final _$companyAnnouncementsListAtom =
      Atom(name: 'Investors.companyAnnouncementsList');

  @override
  List<CompanyAnnouncementsJSON> get companyAnnouncementsList {
    _$companyAnnouncementsListAtom.reportRead();
    return super.companyAnnouncementsList;
  }

  @override
  set companyAnnouncementsList(List<CompanyAnnouncementsJSON> value) {
    _$companyAnnouncementsListAtom
        .reportWrite(value, super.companyAnnouncementsList, () {
      super.companyAnnouncementsList = value;
    });
  }

  final _$companyInformationListAtom =
      Atom(name: 'Investors.companyInformationList');

  @override
  List<CompanyInformationJSON> get companyInformationList {
    _$companyInformationListAtom.reportRead();
    return super.companyInformationList;
  }

  @override
  set companyInformationList(List<CompanyInformationJSON> value) {
    _$companyInformationListAtom
        .reportWrite(value, super.companyInformationList, () {
      super.companyInformationList = value;
    });
  }

  final _$carouselImagesListAtom = Atom(name: 'Investors.carouselImagesList');

  @override
  List<CarouselImages> get carouselImagesList {
    _$carouselImagesListAtom.reportRead();
    return super.carouselImagesList;
  }

  @override
  set carouselImagesList(List<CarouselImages> value) {
    _$carouselImagesListAtom.reportWrite(value, super.carouselImagesList, () {
      super.carouselImagesList = value;
    });
  }

  final _$extractCorporateActionAsyncAction =
      AsyncAction('Investors.extractCorporateAction');

  @override
  Future<dynamic> extractCorporateAction() {
    return _$extractCorporateActionAsyncAction
        .run(() => super.extractCorporateAction());
  }

  final _$extractFinancialResultAsyncAction =
      AsyncAction('Investors.extractFinancialResult');

  @override
  Future<dynamic> extractFinancialResult() {
    return _$extractFinancialResultAsyncAction
        .run(() => super.extractFinancialResult());
  }

  final _$extractAGMAsyncAction = AsyncAction('Investors.extractAGM');

  @override
  Future<dynamic> extractAGM() {
    return _$extractAGMAsyncAction.run(() => super.extractAGM());
  }

  final _$extractCompanyAnnouncementsAsyncAction =
      AsyncAction('Investors.extractCompanyAnnouncements');

  @override
  Future<dynamic> extractCompanyAnnouncements() {
    return _$extractCompanyAnnouncementsAsyncAction
        .run(() => super.extractCompanyAnnouncements());
  }

  final _$extractCompanyInfoAsyncAction =
      AsyncAction('Investors.extractCompanyInfo');

  @override
  Future<dynamic> extractCompanyInfo() {
    return _$extractCompanyInfoAsyncAction
        .run(() => super.extractCompanyInfo());
  }

  final _$extractCarouselAsyncAction = AsyncAction('Investors.extractCarousel');

  @override
  Future<dynamic> extractCarousel() {
    return _$extractCarouselAsyncAction.run(() => super.extractCarousel());
  }

  @override
  String toString() {
    return '''
corporateActionList: ${corporateActionList},
financialResultList: ${financialResultList},
agmList: ${agmList},
companyAnnouncementsList: ${companyAnnouncementsList},
companyInformationList: ${companyInformationList},
carouselImagesList: ${carouselImagesList}
    ''';
  }
}
