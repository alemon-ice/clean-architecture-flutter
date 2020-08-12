import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myFirst/modules/search/domain/entities/result_search.dart';
import 'package:myFirst/modules/search/domain/errors/errors.dart';
import 'package:myFirst/modules/search/infra/datasources/search_datasource.dart';
import 'package:myFirst/modules/search/infra/models/result_search_model.dart';
import 'package:myFirst/modules/search/infra/repositories/search_repository_impl.dart';

class SearchDatasourseMock extends Mock implements SearchDatasource {}

main() {
  final datasource = SearchDatasourseMock();
  final repository = SearchRepositoryImpl(datasource);

  test('deve retornar uma lista de ResultSearch', () async {
    when(datasource.getSearch(any))
        .thenAnswer((_) async => <ResultSearchModel>[]);

    final result = await repository.search("alemon");

    expect(result | null, isA<List<ResultSearch>>());
  });

  test('deve retornar um DatasourceError se o Datasource falhar', () async {
    when(datasource.getSearch(any)).thenThrow(Exception());

    final result = await repository.search("alemon");

    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
