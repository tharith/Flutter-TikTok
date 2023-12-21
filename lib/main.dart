import 'package:flutter/material.dart';
import 'package:flutter_for_tiktok/scratch_card.dart';
import 'package:flutter_for_tiktok/screens/AdvanceSearch.dart';
import 'package:flutter_for_tiktok/screens/CardAnimation.dart';
import 'package:flutter_for_tiktok/screens/CheckInternetConnectionScreen.dart';
import 'package:flutter_for_tiktok/screens/CircleSeekBarScreen.dart';
import 'package:flutter_for_tiktok/screens/Contact.dart';
import 'package:flutter_for_tiktok/screens/CropImage.dart';
import 'package:flutter_for_tiktok/screens/DayNightTime.dart';
import 'package:flutter_for_tiktok/screens/DownloadFile.dart';
import 'package:flutter_for_tiktok/screens/DragAndDrop.dart';
import 'package:flutter_for_tiktok/screens/Filter.dart';
import 'package:flutter_for_tiktok/screens/MenuNavigationBarAnimation/MenuAnimation.dart';
import 'package:flutter_for_tiktok/screens/PhoneNationalCode.dart';
import 'package:flutter_for_tiktok/screens/ProgressIndicator.dart';
import 'package:flutter_for_tiktok/screens/RatingStarScreen.dart';
import 'package:flutter_for_tiktok/screens/ReadMore.dart';
import 'package:flutter_for_tiktok/screens/SampleCreditCard.dart';
import 'package:flutter_for_tiktok/screens/SaveFileToPhone.dart';
import 'package:flutter_for_tiktok/screens/Search.dart';
import 'package:flutter_for_tiktok/screens/SharePlus.dart';
import 'package:flutter_for_tiktok/screens/StepperScreen.dart';
import 'package:flutter_for_tiktok/screens/Testing.dart';
import 'package:flutter_for_tiktok/screens/foldingCell.dart';
import 'package:flutter_for_tiktok/screens/sliderGradient.dart';
import 'package:flutter_for_tiktok/screens/toDoList.dart';
import 'package:flutter_for_tiktok/views/state_mixin_screen.dart';
import 'package:flutter_for_tiktok/views/wall_street_journal.dart';

import 'screens/AddItemScreen.dart';
import 'screens/StrengthPassword.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: SampleCreditCard(),
    )
  );
}