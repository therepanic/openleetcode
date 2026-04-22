String toJson(Object? obj) {
  final seen = <Object>{};
  final sb = StringBuffer('\n');
  sb.write(_encode(obj, seen));
  return sb.toString();
}

String _encode(Object? obj, Set<Object> seen) {
  if (obj == null) return 'null';
  if (obj is bool) return obj ? 'true' : 'false';
  if (obj is int) return obj.toString();
  if (obj is double) {
    if (obj.isNaN || obj.isInfinite) return 'null';
    return obj.toString();
  }
  if (obj is String) return _quote(obj);
  if (obj is DateTime) return _quote(obj.toIso8601String());

  if (identical(seen, obj)) throw StateError('Cycle detected while encoding to json');
  if (seen.contains(obj)) throw StateError('Cycle detected while encoding to json');
  seen.add(obj);
  try {
    if (obj is Map) {
      final parts = <String>[];
      for (final e in obj.entries) {
        final k = e.key is String ? e.key as String : e.key.toString();
        parts.add('${_quote(k)}:${_encode(e.value, seen)}');
      }
      return '{${parts.join(',')}}';
    }

    if (obj is Iterable) {
      return '[${obj.map((x) => _encode(x, seen)).join(',')}]';
    }

    try {
      final mirror = reflect(obj);
      final classMirror = mirror.type;
      final parts = <String>[];
      for (final e in classMirror.declarations.entries) {
        final decl = e.value;
        if (decl is VariableMirror && !decl.isStatic && !decl.isPrivate) {
          final name = MirrorSystem.getName(e.key);
          if (name.startsWith('_')) continue;
          final value = mirror.getField(e.key).reflectee;
          parts.add('${_quote(name)}:${_encode(value, seen)}');
        }
      }
      return '{${parts.join(',')}}';
    } catch (_) {}

    return _quote(obj.toString());
  } finally {
    seen.remove(obj);
  }
}

String _quote(String s) {
  final buf = StringBuffer('"');
  for (final ch in s.runes) {
    switch (ch) {
      case 0x22: buf.write(r'\"'); break;
      case 0x5C: buf.write(r'\\'); break;
      case 0x08: buf.write(r'\b'); break;
      case 0x0C: buf.write(r'\f'); break;
      case 0x0A: buf.write(r'\n'); break;
      case 0x0D: buf.write(r'\r'); break;
      case 0x09: buf.write(r'\t'); break;
      default:
        if (ch < 0x20) {
          buf.write('\\u${ch.toRadixString(16).padLeft(4, '0')}');
        } else {
          buf.writeCharCode(ch);
        }
    }
  }
  buf.write('"');
  return buf.toString();
}
