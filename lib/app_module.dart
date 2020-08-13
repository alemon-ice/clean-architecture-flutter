import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myFirst/modules/search/domain/usecases/search_by_text.dart';
import 'package:myFirst/modules/search/external/datasources/github_datasource.dart';
import 'package:myFirst/modules/search/infra/repositories/search_repository_impl.dart';

import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => GithubDatasource(i())),
        Bind((i) => SearchRepositoryImpl(i())),
        Bind((i) => SearchByTextImpl(i())),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => throw UnimplementedError();
}
