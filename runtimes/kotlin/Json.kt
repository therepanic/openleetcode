object Json {
    fun toJson(obj: Any?): String {
        val seen = IdentityHashMap<Any, Boolean>()
        val sb = StringBuilder(256)
        write(obj, sb, seen)
        return sb.toString()
    }

    private fun write(obj: Any?, sb: StringBuilder, seen: IdentityHashMap<Any, Boolean>) {
        if (obj == null) {
            sb.append("null")
            return
        }
        if (obj is Boolean) {
            sb.append(if (obj) "true" else "false")
            return
        }
        if (obj is Number) {
            sb.append(obj)
            return
        }
        if (obj is Char) {
            quote(obj.toString(), sb)
            return
        }
        if (obj is CharSequence) {
            quote(obj.toString(), sb)
            return
        }
        if (obj is Enum<*>) {
            quote(obj.name, sb)
            return
        }
        if (obj is TemporalAccessor) {
            quote(obj.toString(), sb)
            return
        }
        if (obj is Date) {
            quote(obj.time.toString(), sb)
            return
        }
        if (seen.put(obj, true) != null) throw IllegalArgumentException("Cycle detected")
        try {
            if (obj is Map<*, *>) {
                sb.append('{')
                var first = true
                for ((k, v) in obj) {
                    if (!first) sb.append(',')
                    first = false
                    quote(k.toString(), sb)
                    sb.append(':')
                    write(v, sb, seen)
                }
                sb.append('}')
                return
            }
            if (obj is Iterable<*>) {
                sb.append('[')
                var first = true
                for (x in obj) {
                    if (!first) sb.append(',')
                    first = false
                    write(x, sb, seen)
                }
                sb.append(']')
                return
            }
            if (obj.javaClass.isArray) {
                sb.append('[')
                val n = Array.getLength(obj)
                for (i in 0 until n) {
                    if (i > 0) sb.append(',')
                    write(Array.get(obj, i), sb, seen)
                }
                sb.append(']')
                return
            }
            sb.append('{')
            var first = true
            for (f in allFields(obj.javaClass)) {
                val m = f.modifiers
                if (Modifier.isStatic(m) || Modifier.isTransient(m) || f.isSynthetic) continue
                if (f.name.startsWith("_")) continue
                f.isAccessible = true
                val v =
                    try {
                        f.get(obj)
                    } catch (e: Exception) {
                        continue
                    }
                if (!first) sb.append(',')
                first = false
                quote(f.name, sb)
                sb.append(':')
                write(v, sb, seen)
            }
            sb.append('}')
        } finally {
            seen.remove(obj)
        }
    }

    private fun allFields(c: Class<*>): List<Field> {
        val out = mutableListOf<Field>()
        var x: Class<*>? = c
        while (x != null && x != Any::class.java) {
            out.addAll(x.declaredFields)
            x = x.superclass
        }
        return out
    }

    private fun quote(s: String, sb: StringBuilder) {
        sb.append('"')
        for (ch in s) {
            when (ch) {
                '"' -> sb.append("\\\"")
                '\\' -> sb.append("\\\\")
                '\b' -> sb.append("\\b")
                '\u000C' -> sb.append("\\f")
                '\n' -> sb.append("\\n")
                '\r' -> sb.append("\\r")
                '\t' -> sb.append("\\t")
                else ->
                    if (ch < '\u0020') sb.append(String.format("\\u%04x", ch.code))
                    else sb.append(ch)
            }
        }
        sb.append('"')
    }
}
