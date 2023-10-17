abstract class BaseApiServices{

  Future<dynamic> getGetAPiResponse(String url);

  Future<dynamic> getPostApiResponse(String url, dynamic data);

}