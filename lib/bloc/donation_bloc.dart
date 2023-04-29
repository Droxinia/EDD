import 'package:bloc/bloc.dart';
import 'package:edd/Components/Repo/Reporepository.dart';
import 'package:equatable/equatable.dart';

part 'donation_event.dart';
part 'donation_state.dart';

class DonationBloc extends Bloc<DonationEvent, DonationState> {
  final DONATIONRepository donationRepository;
  DonationBloc({required this.donationRepository}) : super(InitialState()) {
    on<Create>((event, emit) async {
      emit(Donationadding());
      await Future.delayed(const Duration(seconds: 1));
      try {
        await donationRepository.create(
            Title: event.Title,
            Description: event.Description,
            Phone: event.Phone,
            Bank_Account: event.Bank_Account,
            Address: event.Address);
        emit(Donationadded());
      } catch (e) {
        emit(Donationerror(e.toString()));
      }
    });
  }
}
