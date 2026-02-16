public final class Json {

	private Json() {
	}

	public static String toJson(Object obj) {
		IdentityHashMap<Object, Boolean> seen = new IdentityHashMap<>();
		StringBuilder sb = new StringBuilder(256);
		write(obj, sb, seen);
		return sb.toString();
	}

	private static void write(Object obj, StringBuilder sb, IdentityHashMap<Object, Boolean> seen) {
		if (obj == null) {
			sb.append("null");
			return;
		}
		if (obj instanceof Boolean) {
			sb.append(((Boolean) obj) ? "true" : "false");
			return;
		}
		if (obj instanceof Number) {
			sb.append(obj);
			return;
		}
		if (obj instanceof Character) {
			quote(String.valueOf(obj), sb);
			return;
		}
		if (obj instanceof CharSequence) {
			quote(obj.toString(), sb);
			return;
		}

		if (obj instanceof Enum) {
			quote(((Enum<?>) obj).name(), sb);
			return;
		}

		if (obj instanceof TemporalAccessor) {
			quote(obj.toString(), sb);
			return;
		}
		if (obj instanceof Date) {
			quote(String.valueOf(((Date) obj).getTime()), sb);
			return;
		}
		if (seen.put(obj, Boolean.TRUE) != null) {
			throw new IllegalArgumentException("Cycle detected while encoding to json");
		}
		try {
			if (obj instanceof Map<?, ?>) {
				sb.append('{');
				boolean first = true;
				for (Map.Entry<?, ?> e : ((Map<?, ?>) obj).entrySet()) {
					if (!first) {
						sb.append(',');
					}
					first = false;
					String key = String.valueOf(e.getKey());
					quote(key, sb);
					sb.append(':');
					write(e.getValue(), sb, seen);
				}
				sb.append('}');
				return;
			}
			if (obj instanceof Iterable<?>) {
				sb.append('[');
				boolean first = true;
				for (Object x : (Iterable<?>) obj) {
					if (!first) {
						sb.append(',');
					}
					first = false;
					write(x, sb, seen);
				}
				sb.append(']');
				return;
			}
			Class<?> c = obj.getClass();
			if (c.isArray()) {
				sb.append('[');
				int n = Array.getLength(obj);
				for (int i = 0; i < n; i++) {
					if (i > 0) {
						sb.append(',');
					}
					write(Array.get(obj, i), sb, seen);
				}
				sb.append(']');
				return;
			}
			sb.append('{');
			boolean first = true;
			for (Field f : allFields(c)) {
				int m = f.getModifiers();
				if (Modifier.isStatic(m) || Modifier.isTransient(m) || f.isSynthetic()) {
					continue;
				}
				String name = f.getName();
				if (name.startsWith("_")) {
					continue;
				}
				Object v;
				try {
					f.setAccessible(true);
					v = f.get(obj);
				}
				catch (Exception ex) {
					continue;
				}

				if (!first) {
					sb.append(',');
				}
				first = false;
				quote(name, sb);
				sb.append(':');
				write(v, sb, seen);
			}
			sb.append('}');
		}
		finally {
			seen.remove(obj);
		}
	}

	private static List<Field> allFields(Class<?> c) {
		ArrayList<Field> out = new ArrayList<>();
		for (Class<?> x = c; x != null && x != Object.class; x = x.getSuperclass()) {
			Field[] fs = x.getDeclaredFields();
			Collections.addAll(out, fs);
		}
		return out;
	}

	private static void quote(String s, StringBuilder sb) {
		sb.append('"');
		for (int i = 0; i < s.length(); i++) {
			char ch = s.charAt(i);
			switch (ch) {
				case '"':
					sb.append("\\\"");
					break;
				case '\\':
					sb.append("\\\\");
					break;
				case '\b':
					sb.append("\\b");
					break;
				case '\f':
					sb.append("\\f");
					break;
				case '\n':
					sb.append("\\n");
					break;
				case '\r':
					sb.append("\\r");
					break;
				case '\t':
					sb.append("\\t");
					break;
				default:
					if (ch < 0x20) {
						sb.append(String.format("\\u%04x", (int) ch));
					}
					else {
						sb.append(ch);
					}
			}
		}
		sb.append('"');
	}
}
