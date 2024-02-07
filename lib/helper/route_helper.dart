import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/view/screens/splash/splash.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String enroll = '/enroll';
  static const String assessmentform = '/assessmentform';
  static const String teacherpanel = '/teacherpanel';
  static const String studentpanel = '/studentpanel';
  /// teacher panel route
  static const String profileviewteacher = '/profileviewteacher';
  static const String profileviewfromteacher = '/profileviewfromteqcher';
  static const String homeworkteacher = '/homeworkteacher';
  static const String homeworkformteacher = '/homeworkformteacher';
  static const String homeworkdetailsteacher = '/homeworkdetailsteacher';
  static const String subhomeworkteacher = '/subhomeworkteacher';
  // static const String subhomeworkdetailsteacher = '/subhomeworkdetailsteacher';
  static const String assignmentteacher = '/assignmentteacher';
  static const String assignmentformteacher = '/assignmentformteacher';
  static const String assignmentdetailsteacher = '/assignmentdetailsteacher';
  static const String subassignmentteacher = '/subassignmentteacher';
  // static const String subassignmentdetailsteacher = '/subassignmentdetailsteacher';
  /// Student panel route
  static const String profileviewstudent = '/profileviewstudent';
  static const String profileviewfromstudent = '/profileviewfromstudent';
  static const String homeworkstudent = '/homeworkstudent';
  static const String homeworkdetailsstudent = '/homeworkdetailsstudent';
  static const String assignmentstudent = '/assignmentstudent';
  static const String assignmentdetailsstudent = '/assignmentdetailsstudent';
  /// UpComming Course route
  static const String coursedetails = '/coursedetails';
  /// Blog route
  static const String blog = '/blog';
  static const String blogdetails = '/blogdetails';
  /// FAQ route
  static const String faq = '/faq';
  ///About route
  static const String about = '/about';
  // ///Student Login route
  // static const String login = '/login';
  // ///Teacher Login route
  // static const String teacherlogin = '/teacherlogin';
  /// Forgot route
  static const String forgot = '/forgot';
  static const String forgott = '/forgott';

  static String getInitialRoute() => '$initial';
  static String getSplashRoute() => '$splash';
  static String getEnrollRoute() => '$enroll';
  static String getAssessmentRoute(String page) => '$assessmentform?page=$page';
  static String getTeacherPanelRoute() => '$teacherpanel';
  static String getStudentPanelRoute() => '$studentpanel';
  /// teacher panel route
  static String getProfileViewTeacherRoute() => '$profileviewteacher';
  static String getProfileFromTeacherRoute() => '$profileviewfromteacher';
  static String getHomeWorkTeacherRoute() => '$homeworkteacher';
  static String getHomeWorkFormTeacherRoute() => '$homeworkformteacher';
  static String getHomeWorkDetailsTeacherRoute() => '$homeworkdetailsteacher';
  static String getSubHomeWorkTeacherRoute() => '$subhomeworkteacher';
  // static String getSubHomeWorkDetailsTeacherRoute() => '$subhomeworkdetailsteacher';
  static String getAssignmentTeacherRoute() => '$assignmentteacher';
  static String getAssignmentFormTeacherRoute() => '$assignmentformteacher';
  static String getAssignmentDetailsTeacherRoute() => '$assignmentdetailsteacher';
  static String getSubAssignmentTeacherRoute() => '$subassignmentteacher';
  // static String getSubAssignmentDetailsTeacherRoute() => '$subassignmentdetailsteacher';
  /// Student panel route
  static String getProfileViewStudentRoute() => '$profileviewstudent';
  static String getProfileFromStudentRoute() => '$profileviewfromstudent';
  static String getHomeWorkStudentRoute() => '$homeworkstudent';
  static String getHomeWorkDetailsStudentRoute() => '$homeworkdetailsstudent';
  static String getAssignmentStudentRoute() => '$assignmentstudent';
  static String getAssignmentDetailsStudentRoute() => '$assignmentdetailsstudent';
  /// UpComming Course route
  static String getUpCommingCourseRoute() => '$coursedetails';
  /// Blog route
  static String getBlogRoute() => '$blog';
  static String getBlogDetailsRoute() => '$blogdetails';
  /// FAQ route
  static String getFAQRoute() => '$faq';
  /// About route
  static String getAboutRoute() => '$about';
  /// Student Login route
  // static String getLoginRoute() => '$login';
  /// Forgot route
  static String getForgotPassRoute() => '$forgot';
  static String getForgotPasstRoute() => '$forgott';



  static List<GetPage> routes = [
    /// home page route
    ///
   GetPage(name: splash, page: () => SplashScreen()),

/*   GetPage(name: initial, page: () => Home()),
    GetPage(name: enroll, page: () => AdmissionForm()),
    GetPage(name: assessmentform, page: () => AssesmentForm(grade:Get.parameters['page']! )),
    GetPage(name: teacherpanel, page: () => TeacherPanelScreen()),
    GetPage(name: studentpanel, page: () => StudentPanelScreen()),
    /// teacher panel route
    GetPage(name: profileviewteacher, page: () => TeacherProfileView()),
    GetPage(name: profileviewfromteacher, page: () => TProfileEditForm()),
    GetPage(name: homeworkteacher, page: () => THomeWorkView()),
    GetPage(name: homeworkformteacher, page: () => TeacherHomeWorkForm()),
    // GetPage(name: homeworkdetailsteacher, page: () => THomeWorkDetailsPage()),
    GetPage(name: subhomeworkteacher, page: () => SubmitHomeWorkView()),
    // GetPage(name: subhomeworkdetailsteacher, page: () => SubmitHomeWorkDetailsPage()),
    GetPage(name: assignmentteacher, page: () => TAssignmentView()),
    // GetPage(name: assignmentformteacher, page: () => AssignmentForm()),
    // GetPage(name: assignmentdetailsteacher, page: () => TAssignmentDetailsPage()),
    GetPage(name: subassignmentteacher, page: () => SubmitAssignmentView()),
    // GetPage(name: subassignmentdetailsteacher, page: () => SubmitAssignmentDetailsPage()),
    /// student panel route
    GetPage(name: profileviewstudent, page: () => ProfileView()),
    GetPage(name: profileviewfromstudent, page: () => ProfileEditForm()),
    GetPage(name: homeworkstudent, page: () => HomeWorkView()),
    // GetPage(name: homeworkdetailsstudent, page: () => HomeWorkDetailsPage()),
    GetPage(name: assignmentstudent, page: () => AssignmentView()),
    // GetPage(name: assignmentdetailsstudent, page: () => AssignmentDetailsPage()),
    /// UpComming Course route
    // GetPage(name: coursedetails, page: () => BlogDetailsPage()),
    /// Blog route
    // GetPage(name: blog, page: () => CustomBlog()),
    // GetPage(name: blogdetails, page: () => BlogDetailsPage()),
    /// FAQ route
    GetPage(name: faq, page: () => FAQ()),
    /// About Route
    GetPage(name: about, page: () => About()),
    /// Student Login route
    // GetPage(name: login, page: ()=>Login()),
    /// Teacher Login route
    // GetPage(name: teacherlogin, page: ()=>TeacherLogin()),
    /// Forgot route
    GetPage(name: forgot, page: ()=>ForgotPass()),
    GetPage(name: forgott, page: ()=>ForgotPasst())*/


  ];

}
