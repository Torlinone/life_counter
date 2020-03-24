import 'package:uuid/uuid.dart';

class UuidUtil {
  static final Uuid _uuid = Uuid();

  static Uuid get uuid => _uuid;

  static String Function({Map<String, dynamic> options}) get v1 => _uuid.v1;
}
