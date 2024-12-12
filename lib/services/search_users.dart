import 'package:supabase_flutter/supabase_flutter.dart';

Future<Map<String, dynamic>> verificarUsuario(
    String email, String password) async {
  final supabase = Supabase.instance.client;

  try {
    final response = await supabase
        .from('users')
        .select()
        .eq('email', email)
        .eq('password', password)
        .single();

    return {'succes': true, 'message': response['name']};
  } catch (e) {
    return {'succes': false, 'message': 'Error de autenticacion'};
  }
}
