import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/features/profile/presentation/controller/dogBreadBloc/state.dart';

class DogBreadCubit extends Cubit<DogBreadState> {
  DogBreadCubit() : super(const DogBreadState());

  void selectDate(DateTime date) {
    emit(state.copyWith(selectedDate: date, weight: null));
  }

  void selectGender(bool isMale) {
    emit(state.copyWith(isMale: isMale));
  }

  void pickImages(List<File> images) {
    emit(state.copyWith(pickedImages: images));
  }

  void pickPassportImage(File image) {
    emit(state.copyWith(passportImageFile: image));
  }

  void updateWeight(String weight) {
    emit(state.copyWith(weight: weight));
  }

  void selectSize(int? sizeIndex) {
    emit(state.copyWith(sizeSelectedIndex: sizeIndex));
  }

  void updateBreedingExperience(bool experience) {
    emit(state.copyWith(breedingExperience: experience));
  }

  void togglePureBred(bool isPureBred) {
    emit(state.copyWith(isPureBredSelected: isPureBred));
  }

  void setPureBredSelected(bool isPureBredSelected) {
    emit(state.copyWith(isPureBredSelected: isPureBredSelected));
  }

  void setBreedingExperience(bool experience) {
    emit(state.copyWith(breedingExperience: experience));
  }

  void setNeuteredSpayed(bool neuteredSpayed) {
    emit(state.copyWith(neuteredSpayed: neuteredSpayed));
  }

  void setBreedingAvailable(bool  breedingAvailable) {
    emit(state.copyWith(breedingAvailable: breedingAvailable));
  }

  void setKind(String kind) {
    emit(state.copyWith(selectKind: kind));
  }

  void setSecondKind(String secondKind) {
    emit(state.copyWith(selectSecondKind: secondKind));
  }
}
