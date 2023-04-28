// ignore_for_file: non_constant_identifier_names

part of 'donation_bloc.dart';

abstract class DonationEvent extends Equatable {
  const DonationEvent();

  @override
  List<Object> get props => [];
}

class Create extends DonationEvent {
  final String Name;
  final String Description;
  final int Phone;
  final int Bank_Account;
  final String Address;

  const Create(
      this.Name, this.Address, this.Bank_Account, this.Description, this.Phone);
}