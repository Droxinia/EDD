// ignore_for_file: non_constant_identifier_names

class DonationModel {
  final String Title;
  final String Description;
  final int Phone;
  final int Bank_Account;
  final String Address;

  DonationModel(
      {required this.Address,
      required this.Bank_Account,
      required this.Description,
      required this.Phone,
      required this.Title});

  factory DonationModel.fromjson(Map<String, dynamic> json) {
    return DonationModel(
        Address: json["Address"],
        Bank_Account: json["Bank_Account"],
        Description: json["Description"],
        Phone: json["Phone"],
        Title: json["Title"]);
  }
}
