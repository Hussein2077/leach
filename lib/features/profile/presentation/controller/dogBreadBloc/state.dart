import 'dart:io';

import 'package:equatable/equatable.dart';

class BaseBreadState extends Equatable {
  final DateTime? selectedDate;
  final bool? isMale;
  final List<File> pickedImages;
  final File? passportImageFile;
  final bool? isPureBredSelected;
  final String? selectKind;
  final String? selectSecondKind;
  final int? sizeSelectedIndex;
  final bool? breedingExperience;
  final bool? neuteredSpayed;
  final bool? breedingAvailable;

  const BaseBreadState({
    this.selectedDate,
    this.isMale,
    this.pickedImages = const [],
    this.passportImageFile,
    this.isPureBredSelected=true,
    this.sizeSelectedIndex,
    this.breedingExperience = true,
    this.selectKind,
    this.selectSecondKind,
    this.neuteredSpayed = true,
    this.breedingAvailable  = true,
  });

  @override
  List<Object?> get props => [
    selectedDate,
    isMale,
    pickedImages,
    passportImageFile,
    isPureBredSelected,
    sizeSelectedIndex,
    breedingExperience,
    selectKind,
    selectSecondKind  ,
    neuteredSpayed,
    breedingAvailable
  ];

  BaseBreadState copyWith({
    DateTime? selectedDate,
    bool? isMale,
    List<File>? pickedImages,
    File? passportImageFile,
    bool? isPureBredSelected,
    String? weight,
    int? sizeSelectedIndex,
    bool? breedingExperience,
    String? selectKind,
    String? selectSecondKind,
      bool? neuteredSpayed,
      bool? breedingAvailable,
  }) {
    return BaseBreadState(
      selectedDate: selectedDate ?? this.selectedDate,
      isMale: isMale ?? this.isMale,
      pickedImages: pickedImages ?? this.pickedImages,
      passportImageFile: passportImageFile ?? this.passportImageFile,
      isPureBredSelected: isPureBredSelected ?? this.isPureBredSelected,
      sizeSelectedIndex: sizeSelectedIndex ?? this.sizeSelectedIndex,
      breedingExperience: breedingExperience ?? this.breedingExperience,
      selectKind: selectKind ?? this.selectKind,
      selectSecondKind: selectSecondKind ?? this.selectSecondKind,
      neuteredSpayed: neuteredSpayed ?? this.neuteredSpayed,
      breedingAvailable: breedingAvailable ?? this.breedingAvailable
    );
  }
}
