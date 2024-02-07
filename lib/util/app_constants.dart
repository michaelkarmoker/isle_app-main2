import 'package:isletestapp/data/model/body/language_model.dart';
import 'package:isletestapp/util/images.dart';
import 'package:url_launcher/url_launcher.dart';


class AppConstants {
  static const String APP_NAME = 'Isle';
  static const int APP_VERSION = 1;

  ///Api End Point
  static const String BASE_URL = 'https://api.isle.softwarezoneltd.com/api';
  // static const String BASE_URL = 'https://api.isle.com.bd/api';
  // static const String BASE_URL = 'https://api.isle.softwarezoneltd.com/api';
   //static const String BASE_URL = 'http://v2.api.isle.softwarezoneltd.com/api';

  static const String REGISTRATION_URI = '/users/customers/signup';
  static const String LOGIN_URI = '/users/customers/signin';
  static const String GUEST_LOGIN_URI = '/guest/signin';
  static const String PROFILE_URI = '/users/customers';
  static const String REFER_CODE_URI = '/refer-code/customer';
  static const String FEEDBACK_URI = '/feedback/customer-feedback';
  static const String APPLY_REFER_CODE_URI = '/refer-code/use';
  static const String PROFILE_EDIT_URI = '/users/customers/me';
  static const String CREATE_NEW_ADDRESSBOOK_URI = '/users/customers/me/address';
  static const String USER_ADDRESSBOOK_URI = '/users/customers/me/address';
  static const String GENERAL_SETTING_PAGE_URI = '/isle/general-settings';
  static const String COLORS_URI = '/isle/colors';
  static const String FOOTER_BY_TYPES_URI = '/footer_page/type-wise';
  // static const String MAIN_PAGE_URI = '/pages/isle-pages';
  static const String MAIN_PAGE_URI = '/pages';
  static const String LOVING_BRANDS_PAGI_URI = '/loving-brands';
  static const String FEATURE_SLIDER_PAGI_URI = '/features';
  static const String FAQ_TYPE_PAGE_URI = '/faqs/faq-types';
  static const String FAQ_PAGE_URI = '/faqs';
  static const String ORDERS_RETURNS_URI = '/orders/client';

  static const String NESTED_SECTION_PAGE_URI = '/sections/page-sections';
  // static const String NESTED_BRANDS_PAGE_URI = '/brands/mega-menu';
  static const String NESTED_BRANDS_PAGE_URI = '/brands/mega-menu/page';
  static const String NESTED_BRANDS_PAGE_END_URI = '/client';
  static const String NESTED_CAT_SUBCAT_PAGE_URI = '/categories/page-categories';

  /// product
  static const String CATEGORY_PRODUCT_PAGE_URI = '/products';
  // static const String SECTION_PRODUCT_END_PAGE_URI = '/section-products';
  static const String sectionProductUrl = '/section-products';
  static const String sectionProductFilterTermUrl = '/section-products-filter-term';
  static const String categoryProductFilterTermUrl = '/category-products-filter-term';
  static const String subCategoryProductFilterTermUrl = '/sub-category-products-filter-term';
  static const String childCategoryProductFilterTermUrl = '/child-category-products-filter-term';
  static const String CATEGORY_PRODUCT_END_PAGE_URI = '/category-products';
  static const String brandProductListUrl = '/brand-products';
  static const String allBrand = '/brands';
  static const String ISLE_MEMBERSHIP_URI = '/isle-membership/isle-membership-section';
  static const String MEMBERSHIP_INFO_URI = '/login-reward-info';
  static const String MEMBERSHIP_BENIFIT_INFO_URI = '/membership-benefits';
  static const String NEWSLETTER_SUBSCRIBE_URI = '/newsletters';
  static const String TOP_BRAND_URI = '/top-brands';
  static const String SOCIAL_URI = '/socials';
  static const String subCategoryProductListData = '/sub-category-products';
  static const String childCategoryProductFilter = '/child-category-products';

  static const String PRODUCT_DETAILS_PAGE_URI = '/products';
  static const String YOU_MAY_ALSO_LIKE_PAGE_URI = '/products/96/also-like?child_cat=1&child_cat=2&page=1&page=1&brand=25';
  static const String PRODUCT_DETAILS_PRODUCT_REVIEW_URI = '/product-feedback/product';
  static const String PRODUCT_DETAILS_PRODUCT_REVIEW_END_URI = '/rating';
  static const String FOLLOW_WRITEUP_URI = '/follow';
  static const String ALL_DELIVERY_TYPE_URI = '/delivery-type';

  /// forgot password
  static const String GET_OTP_CODE_URI = '/users/customers/forgot-password';

  static const String ADD_TO_CART_URI = '/carts';
  static const String BAG_PAGE_CART_URI = '/carts/client';
  static const String PRODUCT_FEEDBACK_URI = '/orders/client';
  static const String VIEW_PRODUCT_FEEDBACK_URI = '/orders/order-details';
  static const String GET_WISHLIST_DATA_URI = '/wishlists/client';
  static const String CHECK_WISHLIST_URI = '/wishlists';
  static const String DELETE_WISH_URI = '/wishlists';
  static const String ALL_FAVOURITE_LIST_URI = '/follow-brand';
  static const String DELETE_FAVOURITE_URI = '/follow-brand';
  static const String DELETE_WARDROBE_URI = '/wardrobes';
  static const String DELETE_ADDRESSBOOK_URI = '/users/customers/me/address';
  static const String DELETE_WARDROBE_PRODUCT_URI = '/wardrobe-products';
  static const String ADD_TO_WISH_URI = '/wishlists';
  static const String CREATE_FEEDBACK_URI = '/feedback';
  static const String CREATE_PRODUCT_FEEDBACK_URI = '/product-feedback';
  static const String CREATE_WARDROBE_URI = '/wardrobes';
  static const String CREATE_WARDROBE_PRODUCT_URI = '/wardrobe-products';
  static const String WARDROBE_LIST_URI = '/wardrobes/client';
  /// discover
  static const String PROMOTION_BANNER_URI = '/promotion/page-promotion';
  static const String BRAND_PROMOTION_URI = '/promotion-brand/page-promotion_brand';

  /// home section
  static const String HOME_SLIDER_START_URI = '/homepage-sliders';
  static const String HOME_SLIDER_END_URI = '/page';
  static const String HOME_TOP_BANNER_URI = '/homepage-banners';
  static const String HOME_PAGE_ALL_DATA_START_URI = '/homepage-sections';
  static const String NEWIN_LAND_PRODUCT_END_URI = '/new-in';
  static const String MOSTPOPULAR_LAND_PRODUCT_END_URI = '/most-popular';
  static const String SHOP_THE_LOOK_URI = '/shop-the-look/implementation';
  static const String getMultisectionProduct = '/products/multiple-section-products';
  static const String getMultisectionProductFilter = '/products/multiple-section-products-filter-term';
  // static const String getMultisectionProductFilter = '/products/multiple-section-products?section_id=28&section_id=34&section_id=31&section_id=43&section_id=40';
  // static const String getMultisectionProductFilter = '/products/multiple-section-products?section_id={section_id}&status={status}&inventory={inventory}&brand_id={brand_id}&size_id={size_id}';

  static const String HOME_PAGE_ALL_DATA_END_URI = '/homepage';
  static const String HOME_HEADLINE_URI = '/scroll-bar-brands';
  static const String GET_DIVISION_URI = '/states';
 // static const String GET_DISTRICT_URI = '/districts';
   static const String GET_DISTRICT_URI = '/districts/state-districts';
  //static const String GET_THANA_URI = '/sub-districts';
   static const String GET_THANA_URI = '/sub-districts/district-subdistricts';
  static const String PLACE_ORDER_URI = '/orders';
  static const String NOTIFICATION_URI = '';
  static const String ABOUT_US_URI = '/about-us';
  static const String CAREER_URI = '/career';
  static const String TERMS_CONDITIONS_URI = '/terms-and-condition';
  static const String PRIVECY_COOKIES_URI = '/privacy-and-cookies-policy';
  static const String SHIPPING_DELIVERY_URI = '/privacy-and-cookies-policy';
  static const String PAYMENT_PRICING_URI = '/payment-footer';
  static const String COLLABORATE_URI = '/want-to-collaborate';
  static const String FIND_ITEMS_URI = '/how-to-find-items';
  static const String ORDER_PAY_URI = '/how-to-order-and-pay';
  static const String RETURN_REFUND_URI = '/return-and-refunds';
  static const String ORDER_DELIVERY_URI = '/order-and-delivery';
  static const String ENQUIRY_URI = '/enquiries/enquiry-type';
  static const String ENQUIRY_SUBMIT_URI = '/enquiries';
  static const String CONTACT_US_URI = '/contact-us';

/// about Isle reward
  static const String HOW_IT_WORK_URI = '/how-work';
  static const String MEMBERSHIP_TIER_URI = '/membership-tiers';
  static const String MY_REWARD_URI = '/reward-history';
  static const String REDEEM_REWARD_URI = '/redeem-history';
  static const String ABOUT_ISLE_MEMBERSHIP_BENEFIT_URI = '/isle-reward-rules';
  static const String ABOUT_ISLE_REDEEM_POINTS_URI = '/redeeming-points';
  static const String EXCLUSIVE_OFFER_URI = '/exclusive-offers';
  static const String MEMBER_TERMS_CONDITIONS_URI = '/members-terms-condition';


  static const String APPLYCOUPON_URI = '/coupons/apply';


  static const String ORDER_TRACK_URI = '/orders/order-packages';
  static const String MY_FAVORITE_BRANDS_URI = '/follow-brand';
  static const String MY_FAVORITE_BRANDS_END_URI = '/page';
///filter

  static const String FILTER_SECTION = '/section-products-filter-term';




  /// product
  static const String BRAND_PRODUCT_END_PAGE_URI = '/brand-products';
  static const String SUB_CATEGORY_PRODUCT_END_PAGE_URI = '/sub-category-products';
  static const String CHILD_CATEGORY_PRODUCT_END_PAGE_URI = '/child-category-products';





  static const int CONTINUESHOP = 1;
  ///Page Value
  static const int SECTION = 1;
  static const int SUBSECTION = 2;
  static const int CHILDSECTION = 3;
  static const int CATEGORY = 4;
  static const int SUBCATEGORY = 5;
  static const int CHILDCATEGORY = 6;
  static const int BRAND = 7;
  static const int AFFORD = 8;
  static const int NEW_IN = 9;
  static const int menShop = 10;
  static const int newIn = 10;
  static const int mostPopular = 11;
  static const int search = 12;
  static const int brandType = 13;

  static const int CLICKFROMWARDROBE = 1;

  /// section type home page
  static const String ILEPICKS = "isle-pick";
  static const String FEATURED = "featured";
  static const String LUXURY = "luxury";
  static const String DISCOVERBRAND = "discover-brand";
  static const String DISCOVERTREND = "discover-trend";
  static const String SHOPBYCATEGORY = "shop-by-category";
  static const String AFFORDABLEITEM = "affordable-item";
  static const String NEWIN = "new-in";
  static const String MOSTPOPULAR = "most-popular";
  static const String SHOPBYAGE = "age-wise";
  static const String OCCASION = "occasion";

///filter side list typ
  static const int BRAND_FILTER = 1;
  static const int COLORS_FILTER = 2;
  static const int DISCOUNT_FILTER = 3;
  static const int NEWIN_FILTER = 4;
  static const int PRICE_FILTER = 5;
  static const int SIZE_CLOTH_FILTER = 6;
  static const int SIZE_BAG_FILTER = 7;

  /// multi page
  static const int ABOUT = 1;
  static const int TERMS = 2;
  static const int PRIVECY = 3;
  static const int SHIPPING = 4;
  static const int PAYMENT = 5;
  static const int RETURN = 6;
  static const int ORDERDELIVERY = 7;
  static const int CAREER = 8;
  static const int COLLABORATE = 9;
  static const int FINDITEMS = 10;
  static const int ORDERPAY = 11;


  ///Page Value
  static const String RECENTORFERS = "recent";
  static const String PENDINGORDERS = "pending";
  static const String COMPELETEORDERS = "confirmed";
  static const String REJECTORDERS = "rejected";





  /// Filter
  static const String minPrice = "min_price";
  static const String maxPrice = "max_price";


  ///cart
  static const String ISLEDISCOUNT = 'islediscount';
  static const String COUPONDISCOUNT = 'brandDiscount';
  static const String ISLEDISCOUNTTEXT = 'islediscounttext';
  static const String COUPONDISCOUNTTEXT = 'brandDiscounttext';


  static const String USER_TYPE = 'user_type';
  static const String STUDENT="student";
  static const String TEACHER="teacher";
  // Shared Key
  static const String THEME = 'theme';
  static const String TOKEN = 'accessToken';
  static const String USERID = 'id';
  static const String REGIONID = 'region_id';
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';
  static const String CART_LIST = 'cart_list';
  static const String USER_PASSWORD = 'user_password';
  static const String USER_EMAIL = 'user_email';
  static const String IS_STUDENT = 'is_student';
  static const String USER_PHONE = 'user_phone';
  static const String USER_IMAGE = 'user_image';
  static const String STUDENT_ID = 'student_id';
  static const String STUDENT_MOBILE = 'student_mobile';
  static const String isLogInKey = 'Log_in';

  static const String USER_ADDRESS = 'user_address';
  static const String USER_NAME = 'user_name';
  static const String USER_FIRSTNAME = 'first_name';
  static const String USER_LASTNAME = 'last_name';
  static const String PHONE = 'phone';
  static const String USER_ID = 'id';
  static const String USER_LNAME = 'user_lname';
  static const String USER_COUNTRY_CODE = 'user_country_code';
  static const String NOTIFICATION = 'notification';
  static const String SEARCH_HISTORY = 'search_history';
  static const String INTRO = 'intro';
  static const String NOTIFICATION_COUNT = 'notification_count';
  static const String TOPIC = 'all_zone_customer';
  static const String ZONE_ID = 'zoneId';


//internet status code =========
  static const int BADGETWAY = 502;
  static const int SUCCESS = 200;

  static const int en = 0;
  static const int bn = 1;
  static const int fr = 2;

  static const List<String> LANGUAGECODEBYINDEX=["en","bn","fr"];

  ///question type
  static const String MCQ = "mcq";
  static const String LONG = "long";
  static const String GAPFILL = "gap_fill";
  static const String SHORT = "short";

  static const String WRITTEN = "written";

  static List<LanguageModel> languages = [
    LanguageModel(imageUrl: Images.english, languageName: 'English', countryCode: "UK",languageCode: "en"),
    LanguageModel(imageUrl: Images.bangla, languageName: 'বাংলা',countryCode: "BD",languageCode: "bn"),
    LanguageModel(imageUrl: Images.franch, languageName: 'français',countryCode: "FR",languageCode: "fr"),
  ];





  static const String stitbdsite= "https://stitbd.com/";
  static void launchUrls(
      {
        required String urls,
      }) async {
    await launchUrl(Uri.parse(urls.toString()),mode: LaunchMode.externalApplication);
    // if (await canLaunchUrl(Uri.parse(urls))) {
    //   await launchUrl(Uri.parse(urls.toString()),mode: LaunchMode.externalApplication);
    // } else {
    //   throw 'Could not launch ${urls.toString()}';
    // }

    //   await launchUrl(Uri.parse(url()));
  }

/// for send email
  static launchUrlsemail({required String urls}) async {
    await launch("mailto:$urls");
  }





}


