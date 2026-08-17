import 'package:pgd_physics/models/course.dart';
import 'package:pgd_physics/data/phy701_content.dart';
import 'package:pgd_physics/data/phy702_content.dart';
import 'package:pgd_physics/data/phy703_content.dart';
import 'package:pgd_physics/data/phy704_content.dart';
import 'package:pgd_physics/data/phy705_content.dart';
import 'package:pgd_physics/data/phy706_content.dart';
import 'package:pgd_physics/data/phy707_content.dart';
import 'package:pgd_physics/data/phy708_content.dart';
import 'package:pgd_physics/data/phy709_content.dart';
import 'package:pgd_physics/data/phy710_content.dart';
import 'package:pgd_physics/data/phy712_content.dart';
import 'package:pgd_physics/data/phy799_content.dart';

/// Complete PGD Physics (Electronics) curriculum – ABUAD
List<Course> getSampleCourses() {
  return [
    // First Semester
    buildPhy701(),
    buildPhy703(),
    buildPhy705(),
    buildPhy707(),
    buildPhy709(),

    // Second Semester
    buildPhy702(),
    buildPhy704(),
    buildPhy706(),
    buildPhy708(),
    buildPhy710(),
    buildPhy712(),

    // Project
    buildPhy799(),
  ];
}
