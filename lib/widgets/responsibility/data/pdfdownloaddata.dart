
class PdfDownloadData {

  String? download;
  String? yeardata;

  PdfDownloadData(
      {
        this.download,
        this.yeardata});

  PdfDownloadData.fromJson(Map<String, dynamic> json) {

    download = json['download'];
    yeardata = json['yeardata'];
  }
}
