/// statusCode : 200
/// status : "success"
/// message : "general settings get successfully"
/// data : {"id":7,"setting_name":"general-settings","name":"ISLE","tag_line":" ","email":"customercare@isle.com.bd","phone":"+88 01896 475 767","meta_tags":"ISLE","meta_description":"ISLE","logo":"/public/uploads/isle-black-logo-B1XZLpydr.png","footer_logo":"/public/uploads/isle-logo-w-3JgOW8dq0.webp","favicon":"/public/uploads/favicon-isle-4MosSpcqh.svg","copy_right":"<p>A FMC-CBN JV Initiative. All rights are reserved - 2024</p>","customer_care":"+88 01896 475 767","primary_color":"#ae8a0a","secondary_color":"#151a1e","secondary_men_color":"isle","secondary_women_color":"isle","secondary_kids_color":"isle","secondary_alt_color":"#5c5e5a","google_play_status":true,"google_play_logo":"/public/uploads/dddss-wIFxXYVKA.png","google_play_link":"Et nulla ex lorem ut","app_store_status":true,"app_store_logo":"/public/uploads/ffff-oVylCFzNEX.png","app_store_link":"","app_mobile_photo":"/public/uploads/app-U3xuOod2Tj.webp","footer_app_link_title":"FMC Trade License No : TRAD/DNCC/034393/2022","text_field_1":"CBN Trade License No : TRAD/DNCC/013664/2023","text_field_1_url":"","text_field_2":"","text_field_2_url":"","text_field_3":"","text_field_3_url":"","created_at":"2023-11-15T00:17:00.000Z","updated_at":"2024-02-07T05:56:10.000Z"}

class GeneralSettingResponse {
  GeneralSettingResponse({
    this.statusCode,
    this.status,
    this.message,
    this.data,});

  GeneralSettingResponse.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? statusCode;
  String? status;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// id : 7
/// setting_name : "general-settings"
/// name : "ISLE"
/// tag_line : " "
/// email : "customercare@isle.com.bd"
/// phone : "+88 01896 475 767"
/// meta_tags : "ISLE"
/// meta_description : "ISLE"
/// logo : "/public/uploads/isle-black-logo-B1XZLpydr.png"
/// footer_logo : "/public/uploads/isle-logo-w-3JgOW8dq0.webp"
/// favicon : "/public/uploads/favicon-isle-4MosSpcqh.svg"
/// copy_right : "<p>A FMC-CBN JV Initiative. All rights are reserved - 2024</p>"
/// customer_care : "+88 01896 475 767"
/// primary_color : "#ae8a0a"
/// secondary_color : "#151a1e"
/// secondary_men_color : "isle"
/// secondary_women_color : "isle"
/// secondary_kids_color : "isle"
/// secondary_alt_color : "#5c5e5a"
/// google_play_status : true
/// google_play_logo : "/public/uploads/dddss-wIFxXYVKA.png"
/// google_play_link : "Et nulla ex lorem ut"
/// app_store_status : true
/// app_store_logo : "/public/uploads/ffff-oVylCFzNEX.png"
/// app_store_link : ""
/// app_mobile_photo : "/public/uploads/app-U3xuOod2Tj.webp"
/// footer_app_link_title : "FMC Trade License No : TRAD/DNCC/034393/2022"
/// text_field_1 : "CBN Trade License No : TRAD/DNCC/013664/2023"
/// text_field_1_url : ""
/// text_field_2 : ""
/// text_field_2_url : ""
/// text_field_3 : ""
/// text_field_3_url : ""
/// created_at : "2023-11-15T00:17:00.000Z"
/// updated_at : "2024-02-07T05:56:10.000Z"

class Data {
  Data({
    this.id,
    this.settingName,
    this.name,
    this.tagLine,
    this.email,
    this.phone,
    this.metaTags,
    this.metaDescription,
    this.logo,
    this.footerLogo,
    this.favicon,
    this.copyRight,
    this.customerCare,
    this.primaryColor,
    this.secondaryColor,
    this.secondaryMenColor,
    this.secondaryWomenColor,
    this.secondaryKidsColor,
    this.secondaryAltColor,
    this.googlePlayStatus,
    this.googlePlayLogo,
    this.googlePlayLink,
    this.appStoreStatus,
    this.appStoreLogo,
    this.appStoreLink,
    this.appMobilePhoto,
    this.footerAppLinkTitle,
    this.textField1,
    this.textField1Url,
    this.textField2,
    this.textField2Url,
    this.textField3,
    this.textField3Url,
    this.createdAt,
    this.updatedAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    settingName = json['setting_name'];
    name = json['name'];
    tagLine = json['tag_line'];
    email = json['email'];
    phone = json['phone'];
    metaTags = json['meta_tags'];
    metaDescription = json['meta_description'];
    logo = json['logo'];
    footerLogo = json['footer_logo'];
    favicon = json['favicon'];
    copyRight = json['copy_right'];
    customerCare = json['customer_care'];
    primaryColor = json['primary_color'];
    secondaryColor = json['secondary_color'];
    secondaryMenColor = json['secondary_men_color'];
    secondaryWomenColor = json['secondary_women_color'];
    secondaryKidsColor = json['secondary_kids_color'];
    secondaryAltColor = json['secondary_alt_color'];
    googlePlayStatus = json['google_play_status'];
    googlePlayLogo = json['google_play_logo'];
    googlePlayLink = json['google_play_link'];
    appStoreStatus = json['app_store_status'];
    appStoreLogo = json['app_store_logo'];
    appStoreLink = json['app_store_link'];
    appMobilePhoto = json['app_mobile_photo'];
    footerAppLinkTitle = json['footer_app_link_title'];
    textField1 = json['text_field_1'];
    textField1Url = json['text_field_1_url'];
    textField2 = json['text_field_2'];
    textField2Url = json['text_field_2_url'];
    textField3 = json['text_field_3'];
    textField3Url = json['text_field_3_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? settingName;
  String? name;
  String? tagLine;
  String? email;
  String? phone;
  String? metaTags;
  String? metaDescription;
  String? logo;
  String? footerLogo;
  String? favicon;
  String? copyRight;
  String? customerCare;
  String? primaryColor;
  String? secondaryColor;
  String? secondaryMenColor;
  String? secondaryWomenColor;
  String? secondaryKidsColor;
  String? secondaryAltColor;
  bool? googlePlayStatus;
  String? googlePlayLogo;
  String? googlePlayLink;
  bool? appStoreStatus;
  String? appStoreLogo;
  String? appStoreLink;
  String? appMobilePhoto;
  String? footerAppLinkTitle;
  String? textField1;
  String? textField1Url;
  String? textField2;
  String? textField2Url;
  String? textField3;
  String? textField3Url;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['setting_name'] = settingName;
    map['name'] = name;
    map['tag_line'] = tagLine;
    map['email'] = email;
    map['phone'] = phone;
    map['meta_tags'] = metaTags;
    map['meta_description'] = metaDescription;
    map['logo'] = logo;
    map['footer_logo'] = footerLogo;
    map['favicon'] = favicon;
    map['copy_right'] = copyRight;
    map['customer_care'] = customerCare;
    map['primary_color'] = primaryColor;
    map['secondary_color'] = secondaryColor;
    map['secondary_men_color'] = secondaryMenColor;
    map['secondary_women_color'] = secondaryWomenColor;
    map['secondary_kids_color'] = secondaryKidsColor;
    map['secondary_alt_color'] = secondaryAltColor;
    map['google_play_status'] = googlePlayStatus;
    map['google_play_logo'] = googlePlayLogo;
    map['google_play_link'] = googlePlayLink;
    map['app_store_status'] = appStoreStatus;
    map['app_store_logo'] = appStoreLogo;
    map['app_store_link'] = appStoreLink;
    map['app_mobile_photo'] = appMobilePhoto;
    map['footer_app_link_title'] = footerAppLinkTitle;
    map['text_field_1'] = textField1;
    map['text_field_1_url'] = textField1Url;
    map['text_field_2'] = textField2;
    map['text_field_2_url'] = textField2Url;
    map['text_field_3'] = textField3;
    map['text_field_3_url'] = textField3Url;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}






/*
class GeneralSettingResponse {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  GeneralSettingResponse(
      {this.statusCode, this.status, this.message, this.data});

  GeneralSettingResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? settingName;
  String? name;
  String? tagLine;
  String? email;
  String? phone;
  String? metaTags;
  String? metaDescription;
  String? logo;
  String? footerLogo;
  String? favicon;
  String? copyRight;
  String? customerCare;
  String? primaryColor;
  String? secondaryColor;
  String? secondaryMenColor;
  String? secondaryWomenColor;
  String? secondaryKidsColor;
  String? secondaryAltColor;
  bool? googlePlayStatus;
  String? googlePlayLogo;
  String? googlePlayLink;
  bool? appStoreStatus;
  String? appStoreLogo;
  String? appStoreLink;
  String? appMobilePhoto;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.settingName,
        this.name,
        this.tagLine,
        this.email,
        this.phone,
        this.metaTags,
        this.metaDescription,
        this.logo,
        this.footerLogo,
        this.favicon,
        this.copyRight,
        this.customerCare,
        this.primaryColor,
        this.secondaryColor,
        this.secondaryMenColor,
        this.secondaryWomenColor,
        this.secondaryKidsColor,
        this.secondaryAltColor,
        this.googlePlayStatus,
        this.googlePlayLogo,
        this.googlePlayLink,
        this.appStoreStatus,
        this.appStoreLogo,
        this.appStoreLink,
        this.appMobilePhoto,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    settingName = json['setting_name'];
    name = json['name'];
    tagLine = json['tag_line'];
    email = json['email'];
    phone = json['phone'];
    metaTags = json['meta_tags'];
    metaDescription = json['meta_description'];
    logo = json['logo'];
    footerLogo = json['footer_logo'];
    favicon = json['favicon'];
    copyRight = json['copy_right'];
    customerCare = json['customer_care'];
    primaryColor = json['primary_color'];
    secondaryColor = json['secondary_color'];
    secondaryMenColor = json['secondary_men_color'];
    secondaryWomenColor = json['secondary_women_color'];
    secondaryKidsColor = json['secondary_kids_color'];
    secondaryAltColor = json['secondary_alt_color'];
    googlePlayStatus = json['google_play_status'];
    googlePlayLogo = json['google_play_logo'];
    googlePlayLink = json['google_play_link'];
    appStoreStatus = json['app_store_status'];
    appStoreLogo = json['app_store_logo'];
    appStoreLink = json['app_store_link'];
    appMobilePhoto = json['app_mobile_photo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['setting_name'] = this.settingName;
    data['name'] = this.name;
    data['tag_line'] = this.tagLine;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['meta_tags'] = this.metaTags;
    data['meta_description'] = this.metaDescription;
    data['logo'] = this.logo;
    data['footer_logo'] = this.footerLogo;
    data['favicon'] = this.favicon;
    data['copy_right'] = this.copyRight;
    data['customer_care'] = this.customerCare;
    data['primary_color'] = this.primaryColor;
    data['secondary_color'] = this.secondaryColor;
    data['secondary_men_color'] = this.secondaryMenColor;
    data['secondary_women_color'] = this.secondaryWomenColor;
    data['secondary_kids_color'] = this.secondaryKidsColor;
    data['secondary_alt_color'] = this.secondaryAltColor;
    data['google_play_status'] = this.googlePlayStatus;
    data['google_play_logo'] = this.googlePlayLogo;
    data['google_play_link'] = this.googlePlayLink;
    data['app_store_status'] = this.appStoreStatus;
    data['app_store_logo'] = this.appStoreLogo;
    data['app_store_link'] = this.appStoreLink;
    data['app_mobile_photo'] = this.appMobilePhoto;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}








class SystemSettingResponse {
  int? statusCode;
  String? status;
  String? message;
  List<Data>? data;

  SystemSettingResponse(
      {this.statusCode, this.status, this.message, this.data});

  SystemSettingResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? tagLine;
  String? email;
  String? phone;
  String? metaTags;
  String? metaDescription;
  String? logo;
  String? footerLogo;
  String? favicon;
  String? copyRight;
  String? customerCare;
  String? primaryColor;
  String? secondaryColor;
  String? secondaryMenColor;
  String? secondaryWomenColor;
  String? secondaryKidsColor;
  String? secondaryAltColor;
  bool? googlePlayStatus;
  String? googlePlayLogo;
  String? googlePlayLink;
  bool? appStoreStatus;
  String? appStoreLogo;
  String? appStoreLink;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.tagLine,
        this.email,
        this.phone,
        this.metaTags,
        this.metaDescription,
        this.logo,
        this.footerLogo,
        this.favicon,
        this.copyRight,
        this.customerCare,
        this.primaryColor,
        this.secondaryColor,
        this.secondaryMenColor,
        this.secondaryWomenColor,
        this.secondaryKidsColor,
        this.secondaryAltColor,
        this.googlePlayStatus,
        this.googlePlayLogo,
        this.googlePlayLink,
        this.appStoreStatus,
        this.appStoreLogo,
        this.appStoreLink,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tagLine = json['tag_line'];
    email = json['email'];
    phone = json['phone'];
    metaTags = json['meta_tags'];
    metaDescription = json['meta_description'];
    logo = json['logo'];
    footerLogo = json['footer_logo'];
    favicon = json['favicon'];
    copyRight = json['copy_right'];
    customerCare = json['customer_care'];
    primaryColor = json['primary_color'];
    secondaryColor = json['secondary_color'];
    secondaryMenColor = json['secondary_men_color'];
    secondaryWomenColor = json['secondary_women_color'];
    secondaryKidsColor = json['secondary_kids_color'];
    secondaryAltColor = json['secondary_alt_color'];
    googlePlayStatus = json['google_play_status'];
    googlePlayLogo = json['google_play_logo'];
    googlePlayLink = json['google_play_link'];
    appStoreStatus = json['app_store_status'];
    appStoreLogo = json['app_store_logo'];
    appStoreLink = json['app_store_link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['tag_line'] = this.tagLine;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['meta_tags'] = this.metaTags;
    data['meta_description'] = this.metaDescription;
    data['logo'] = this.logo;
    data['footer_logo'] = this.footerLogo;
    data['favicon'] = this.favicon;
    data['copy_right'] = this.copyRight;
    data['customer_care'] = this.customerCare;
    data['primary_color'] = this.primaryColor;
    data['secondary_color'] = this.secondaryColor;
    data['secondary_men_color'] = this.secondaryMenColor;
    data['secondary_women_color'] = this.secondaryWomenColor;
    data['secondary_kids_color'] = this.secondaryKidsColor;
    data['secondary_alt_color'] = this.secondaryAltColor;
    data['google_play_status'] = this.googlePlayStatus;
    data['google_play_logo'] = this.googlePlayLogo;
    data['google_play_link'] = this.googlePlayLink;
    data['app_store_status'] = this.appStoreStatus;
    data['app_store_logo'] = this.appStoreLogo;
    data['app_store_link'] = this.appStoreLink;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}


*/
