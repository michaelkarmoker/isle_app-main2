import 'package:isletestapp/data/api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchRepo {
  final ApiClient apiClient;
  // final ChaShebaDatabase db;
  final SharedPreferences sharedPreferences;
  SearchRepo( {required this.apiClient,
    // required this.db,
    required this.sharedPreferences});


  /// Search Function
/*  Future<Response> getSearch({required String name,}) async {
    Response _response = await apiClient.postData(AppConstants.SEARCH_URL,{
      "name": name,
    });
    return _response;
  }

  /// local database functuion=============

  /// //insert
  Future<List<int>> addToBlogList(List<Blogs> blogList) async {
    return db.blogDao.insertBlogs(blogList);
  }

  Future<List<int>> addToCategoryList(List<Categories> categoryList) async {
    return db.categoryDao.insertCategory(categoryList);
  }

  /// fetch
  Future<List<Categories>> getHomeCategoryList() async {
    return db.categoryDao.getHomeCategories();
  }
  Future<List<BlogImages>> getBlogImagesList(String id) async {
    return db.blogImageDao.getBlogImagesByBlogId(id);
  }
  ///recent blog list
  Future<List<Blogs>> getRecentBlogsList() async {
    return db.blogDao.getRecentBlogs();
  }

  Future<List<Blogs>> getBlogBySearch(String key) async {
    return db.blogDao.getBlogBySearch(key);
  }

  //all blog list
  Future<List<Blogs>> getAllBlogsListOffline() async {
    return db.blogDao.getBlogs();
  }

  //all blog list by search
  Future<List<Blogs>> getAllBlogsListBySearchOffline() async {
    return db.blogDao.getBlogs();
  }

  ///all cate list
  Future<List<Categories>> getAllCateListOffline() async {
    return db.categoryDao.getCategories();
  }

  */


}
