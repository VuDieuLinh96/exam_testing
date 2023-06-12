import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() async {
  late Dio dio;
  late DioAdapter dioAdapter;

  Response<dynamic> response;

  group('GetClientConfig', () {
    const baseUrl = 'http://192.168.26.157/';

    const dataGetClientConfig = <String, dynamic>{
      "clientid": "RN6HIGES7X",
      "clientsecret": "C5CdtCvME5tcmUHQZQwdzWqU9ucWUZ",
    };

    setUp(() {
      dio = Dio(BaseOptions(baseUrl: baseUrl));
      dioAdapter = DioAdapter(
        dio: dio,
        matcher: const FullHttpRequestMatcher(),
      );
    });

    test('signs in user and fetches account information', () async {
      const getClientConfigRoute = 'sso/clientconfig/getClientConfig';
      const loginRoute = '/sso/oauth/token';

      const loginData = <String, dynamic>{
        'username': '032C003930',
        'password': 'test@example.com',
        'client_id': 'RN6HIGES7X',
        'client_secret': 'C5CdtCvME5tcmUHQZQwdzWqU9ucWUZ',
        'grant_type': 'password',
      };

      dioAdapter
        ..onPost(
          getClientConfigRoute,
          (server) => server.throws(
            401,
            DioError(
              requestOptions: RequestOptions(
                path: getClientConfigRoute,
              ),
            ),
          ),
        )
        ..onPost(
          getClientConfigRoute,
          (server) => server.reply(200, {'message': 'Success!'}),
          data: dataGetClientConfig,
        )
        ..onPost(
          loginRoute,
          (server) => server.reply(200, {'message': 'Success!'}),
          data: loginData,
        );

      expect(
        () async => await dio.post(getClientConfigRoute),
        throwsA(isA<DioError>()),
      );

      response = await dio.post(
        getClientConfigRoute,
        data: dataGetClientConfig,
      );

      print("GetClientConfig ${response.data}");

      expect(response.data, {'message': 'Success!'});

      response = await dio.post(
        loginRoute,
        data: loginData,
      );

      expect(response.data, {'message': 'Success!'});
    });
  });
}
