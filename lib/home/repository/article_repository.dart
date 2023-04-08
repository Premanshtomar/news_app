import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:news_app/home/models/headlines.dart';
import 'package:news_app/network/api_provider.dart';
import 'package:news_app/network/constant_urls.dart';
import 'package:news_app/network/network_exceptions.dart';
import 'package:news_app/network/repo_response.dart';
import 'package:news_app/utils/constants.dart';

class ArticleRepo {
  RestApiProvider provider = RestApiProvider();

  Future<RepoResponse<List<Article>>> fetchArticle(
      [country = 'in', page = 1, pageSize = 10]) async {
    try {
      var response = await provider.getApi(kUrlHeadlines, queryParams: {
        'country': country,
        'page': page.toString(),
        'pageSize': pageSize.toString(),
      });

      NewsResults headline =
          NewsResults.fromJson(response as Map<String, dynamic>);
      return RepoResponse(data: headline.articles);
    } on FetchDataException catch (e) {
      debugPrint(e.toString());
      return RepoResponse(error: e.message);
    } on BadRequestException catch (e) {
      debugPrint(e.toString());
      return RepoResponse(error: e.message);
    } on UnauthorisedException catch (e) {
      debugPrint(e.toString());
      return RepoResponse(error: e.message);
    } on InvalidInputException catch (e) {
      debugPrint(e.toString());
      return RepoResponse(error: e.message);
    } on SocketException catch (e) {
      return RepoResponse(error: e.message);
    } catch (e) {
      debugPrint(e.toString());
      return RepoResponse(error: kSomethingWentWrong);
    }
  }
}
