import 'package:supabase_flutter/supabase_flutter.dart';

Future<Map<String, dynamic>> agregarDatos(
    String name, String email, String password) async {
  final supabase = Supabase.instance.client;

  try {
    await supabase.from('users').insert({
      'name': name,
      'email': email,
      'password': password,
    });
    return {'message': 'Usuario agregado'};
  } catch (e) {
    return {'message': 'Error al agregar usuario'};
  }
}
