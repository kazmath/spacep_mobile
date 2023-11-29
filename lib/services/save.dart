import 'package:http/http.dart' as http;
import 'package:mobile_spacep/utils.dart';

Future<http.Response> save(String apikey) async {
  await http.get(
    Uri.http(
      Constantes.baseUrl,
      '/media/save',
      {'APIKEY': apikey},
    ),
  );
  return await http.get(
    Uri.http(
      Constantes.baseUrl,
      '/media/history',
    ),
  );
}
