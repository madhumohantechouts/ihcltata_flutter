class Intro {
  String? brands;
  String? brandsfive;
  String? brandsfour;
  String? brandsone;
  String? brandsthree;
  String? brandstwo;
  String? carrer;
  String? carrerfour;
  String? carrerone;
  String? carrerthree;
  String? carrertwo;
  String? company;
  String? companyfour;
  String? companyone;
  String? companythree;
  String? companytwo;
  String? contact;
  String? contactone;
  String? development;
  String? developmentfour;
  String? developmentone;
  String? developmentthree;
  String? developmenttwo;
  String? investors;
  String? investorsOne;
  String? investorstwo;
  String? pressroom;
  String? pressroomone;
  String? pressroomtwo;
  String? responsibility;
  String? responsibilityone;
  String? responsibilitytwo;
  String? title;

  Intro(
      {this.brands,
      this.brandsfive,
      this.brandsfour,
      this.brandsone,
      this.brandsthree,
      this.brandstwo,
      this.carrer,
      this.carrerfour,
      this.carrerone,
      this.carrerthree,
      this.carrertwo,
      this.company,
      this.companyfour,
      this.companyone,
      this.companythree,
      this.companytwo,
      this.contact,
      this.contactone,
      this.development,
      this.developmentfour,
      this.developmentone,
      this.developmentthree,
      this.developmenttwo,
      this.investors,
      this.investorsOne,
      this.investorstwo,
      this.pressroom,
      this.pressroomone,
      this.pressroomtwo,
      this.responsibility,
      this.responsibilityone,
      this.responsibilitytwo,
      this.title});

  Intro.fromJson(Map<String, dynamic> json) {
    brands = json['brands'];
    brandsfive = json['brandsfive'];
    brandsfour = json['brandsfour'];
    brandsone = json['brandsone'];
    brandsthree = json['brandsthree'];
    brandstwo = json['brandstwo'];
    carrer = json['carrer'];
    carrerfour = json['carrerfour'];
    carrerone = json['carrerone'];
    carrerthree = json['carrerthree'];
    carrertwo = json['carrertwo'];
    company = json['company'];
    companyfour = json['companyfour'];
    companyone = json['companyone'];
    companythree = json['companythree'];
    companytwo = json['companytwo'];
    contact = json['contact'];
    contactone = json['contactone'];
    development = json['development'];
    developmentfour = json['developmentfour'];
    developmentone = json['developmentone'];
    developmentthree = json['developmentthree'];
    developmenttwo = json['developmenttwo'];
    investors = json['investors'];
    investorsOne = json['investorsOne'];
    investorstwo = json['investorstwo'];
    pressroom = json['pressroom'];
    pressroomone = json['pressroomone'];
    pressroomtwo = json['pressroomtwo'];
    responsibility = json['responsibility'];
    responsibilityone = json['responsibilityone'];
    responsibilitytwo = json['responsibilitytwo'];
    title = json['title'];
  }
}
