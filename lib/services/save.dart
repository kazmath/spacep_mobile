import 'package:http/http.dart' as http;
import 'package:mobile_spacep/utils.dart';

Future<http.Response> save(String apikey) {
  return http.get(
    Uri.http(
      Constantes.baseUrl,
      '/media/save',
      {'APIKEY': apikey},
    ),
  );
}
