part of 'donation_bloc.dart';

@immutable
//abstract class DonationState {}

class DonationState {
  final List<Donation> donations;

  DonationState({
    required this.donations,
  });

  factory DonationState.initial() {
    return DonationState(donations: []);
  }
}
