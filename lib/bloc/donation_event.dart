part of 'donation_bloc.dart';

@immutable
abstract class DonationEvent {}

class RequestDonationEvent extends DonationEvent {
  final String title;
  final String description;
  final String phone;
  final String bankAccountNumber;
  final String address;
  final String imageFilePath;

  RequestDonationEvent({
    required this.title,
    required this.description,
    required this.phone,
    required this.bankAccountNumber,
    required this.address,
    required this.imageFilePath,
  });
}
