part of 'donation_bloc.dart';

abstract class DonationState extends Equatable {
  const DonationState();

  @override
  List<Object> get props => [];
}

class DonationInitial extends DonationState {}

class InitialState extends DonationState {
  @override
  List<Object> get props => [];
}

class Donationadding extends DonationState {
  @override
  List<Object> get props => [];
}

class Donationadded extends DonationState {
  @override
  List<Object> get props => [];
}

class Donationerror extends DonationState {
  final String error;

  const Donationerror(this.error);

  @override
  List<Object> get props => [];
}
