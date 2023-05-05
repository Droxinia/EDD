import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Components/model.dart';

part 'donation_event.dart';
part 'donation_state.dart';

class DonationBloc extends Bloc<DonationEvent, DonationState> {
  DonationBloc() : super(DonationState.initial());

  @override
  Stream<DonationState> mapEventToState(DonationEvent event) async* {
    if (event is RequestDonationEvent) {
      // Upload image to Firebase Storage and get download URL
      final String imageUrl = await _uploadImageToStorage(event.imageFilePath);

      // Save donation data to Firebase Cloud Firestore
      final newDonation = Donation(
        title: event.title,
        description: event.description,
        phone: event.phone,
        bankAccountNumber: event.bankAccountNumber,
        address: event.address,
        imageUrl: imageUrl,
      );
      await _saveDonationToFirestore(newDonation);

      // Update the state with the new donation
      final List<Donation> updatedDonations = state.donations + [newDonation];
      yield DonationState(donations: updatedDonations);
    }
  }

  Future<String> _uploadImageToStorage(String filePath) async {
    // TODO: Implement uploading image to Firebase Storage and getting download URL
    return 'https://via.placeholder.com/300x250.png?text=Sample+Image';
  }

  Future<void> _saveDonationToFirestore(Donation donation) async {
    // TODO: Implement saving donation data to Firebase Cloud Firestore
    await Future.delayed(Duration(seconds: 1));
  }
}
