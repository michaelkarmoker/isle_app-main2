import 'package:get/get.dart';
import 'package:isletestapp/data/repository/search/search_repo.dart';




class SearchController extends GetxController implements GetxService {
  final SearchRepo searchRepo;
  SearchController({required this.searchRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;
/*  SearchResponse ?searchResponse=null;
  List<Blogs> blogsList=[];*/


  /// Search Function
/*
  Future<void> getSearch({
    required String name,
  }) async {
    _isLoading = true;
    update();
    if(await InternetCheck.checkUserConnection()) {
      Response response = await searchRepo.getSearch(
        name: name,
      );
      if (response.statusCode == 200) {
        searchResponse = SearchResponse.fromJson(response.body);
        blogsList = searchResponse!.blogs!;
        if(blogsList.length>0){
          searchRepo.addToBlogList(blogsList);
        }

      } else {
        ApiChecker.checkApi(response);
      }
    }else{

      blogsList=await searchRepo.getBlogBySearch("%"+name+"%");
      if(blogsList.length>0){
        for(int i=0;i<blogsList.length;i++){
          blogsList[i].blogImages=await searchRepo.getBlogImagesList(blogsList[i].id.toString());
        }

      }
    }
    _isLoading = false;
    update();
  }
*/



}
