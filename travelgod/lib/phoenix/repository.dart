import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travelgod/datatypes/data.dart';

part 'repository.g.dart';


@RestApi(baseUrl:"https://4a30-119-226-236-129.ngrok-free.app/")
abstract class Repository{
  factory Repository(Dio dio,{String baseUrl})=_Repository;
  @GET('/')
  Future<Test> test();

  @GET('/search')
  Future<Places> GetPlaces({
    @Query('tag') String? tag,
});

  @POST('/chat')
  Future<Chatreply> GetMessage({
    @Body() ChatMsg? message,
  });

  @GET('/describeimage')
  Future<String> GetImageplaces({
    @Query('url') String? url,
});
}




