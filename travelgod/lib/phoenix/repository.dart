import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travelgod/datatypes/data.dart';

part 'repository.g.dart';


@RestApi(baseUrl:"http://10.0.2.2:8000/")
abstract class Repository{
  factory Repository(Dio dio,{String baseUrl})=_Repository;
  @GET('/')
  Future<Test> test();
}



