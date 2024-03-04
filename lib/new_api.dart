import 'package:dio/dio.dart';
import 'package:kapil11/user.dart';
import 'package:retrofit/retrofit.dart';

part 'new_api.g.dart';

@RestApi(baseUrl: "https://www.drdistributors.co.in/drd-live/flutter_api/Api01/")
abstract class MyApiService {
  factory MyApiService(Dio dio, {String baseUrl}) = _MyApiService;

  @POST("/get_login_api")
  @FormUrlEncoded()
  Future<UserResponse> get_login_api(
            @Field("api_key") String api_key,
            @Field("user_name") String user_name,
            @Field("user_password") String user_password,
            @Field("firebase_token") String firebase_token);
}