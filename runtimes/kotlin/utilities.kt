class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun toIntValue(value: Any?): Int = when (value) {
    null -> 0
    is Number -> value.toInt()
    else -> value.toString().toInt()
}

fun toLongValue(value: Any?): Long = when (value) {
    null -> 0L
    is Number -> value.toLong()
    else -> value.toString().toLong()
}

fun toDoubleValue(value: Any?): Double = when (value) {
    null -> 0.0
    is Number -> value.toDouble()
    else -> value.toString().toDouble()
}

fun toFloatValue(value: Any?): Float = toDoubleValue(value).toFloat()

fun toStringValue(value: Any?): String = value?.toString() ?: ""

fun toCharValue(value: Any?): Char = toStringValue(value).firstOrNull() ?: '\u0000'

fun toBoolValue(value: Any?): Boolean = when (value) {
    is Boolean -> value
    else -> value?.toString() == "true"
}

fun toIntArrayValue(value: Any?): IntArray =
    ((value as? List<*>) ?: emptyList<Any?>()).map { toIntValue(it) }.toIntArray()

fun toLongArrayValue(value: Any?): LongArray =
    ((value as? List<*>) ?: emptyList<Any?>()).map { toLongValue(it) }.toLongArray()

fun toDoubleArrayValue(value: Any?): DoubleArray =
    ((value as? List<*>) ?: emptyList<Any?>()).map { toDoubleValue(it) }.toDoubleArray()

fun toFloatArrayValue(value: Any?): FloatArray =
    ((value as? List<*>) ?: emptyList<Any?>()).map { toFloatValue(it) }.toFloatArray()

fun toStringArrayValue(value: Any?): Array<String> =
    ((value as? List<*>) ?: emptyList<Any?>()).map { toStringValue(it) }.toTypedArray()

fun toCharArrayValue(value: Any?): CharArray =
    ((value as? List<*>) ?: emptyList<Any?>()).map { toCharValue(it) }.toCharArray()

fun toBoolArrayValue(value: Any?): BooleanArray =
    ((value as? List<*>) ?: emptyList<Any?>()).map { toBoolValue(it) }.toBooleanArray()

fun toNullableIntArrayValue(value: Any?): Array<Int?> =
    ((value as? List<*>) ?: emptyList<Any?>()).map { if (it == null) null else toIntValue(it) }.toTypedArray()

fun toIntMatrixValue(value: Any?): Array<IntArray> =
    ((value as? List<*>) ?: emptyList<Any?>()).map { row -> toIntArrayValue(row) }.toTypedArray()

fun toLongMatrixValue(value: Any?): Array<LongArray> =
    ((value as? List<*>) ?: emptyList<Any?>()).map { row -> toLongArrayValue(row) }.toTypedArray()

fun toDoubleMatrixValue(value: Any?): Array<DoubleArray> =
    ((value as? List<*>) ?: emptyList<Any?>()).map { row -> toDoubleArrayValue(row) }.toTypedArray()

fun toFloatMatrixValue(value: Any?): Array<FloatArray> =
    ((value as? List<*>) ?: emptyList<Any?>()).map { row -> toFloatArrayValue(row) }.toTypedArray()

fun toStringMatrixValue(value: Any?): Array<Array<String>> =
    ((value as? List<*>) ?: emptyList<Any?>()).map { row -> toStringArrayValue(row) }.toTypedArray()

fun toBoolMatrixValue(value: Any?): Array<BooleanArray> =
    ((value as? List<*>) ?: emptyList<Any?>()).map { row -> toBoolArrayValue(row) }.toTypedArray()

fun toCharMatrixValue(value: Any?): Array<CharArray> =
    ((value as? List<*>) ?: emptyList<Any?>())
        .map { row -> toCharArrayValue(row) }
        .toTypedArray()

fun toTreeNode(arr: Array<Int?>): TreeNode? {
    if (arr.isEmpty() || arr[0] == null) return null
    val root = TreeNode(arr[0]!!)
    val queue: java.util.Queue<TreeNode> = java.util.LinkedList()
    queue.add(root)
    var i = 1
    while (i < arr.size && queue.isNotEmpty()) {
        val node = queue.poll() ?: break
        if (i < arr.size && arr[i] != null) {
            node.left = TreeNode(arr[i]!!)
            queue.add(node.left)
        }
        i++
        if (i < arr.size && arr[i] != null) {
            node.right = TreeNode(arr[i]!!)
            queue.add(node.right)
        }
        i++
    }
    return root
}

fun treeNodeToArray(root: TreeNode?): List<Int?> {
    val res = mutableListOf<Int?>()
    if (root == null) return res
    val queue: java.util.Queue<TreeNode?> = java.util.LinkedList()
    queue.add(root)
    while (queue.isNotEmpty()) {
        val node = queue.poll()
        if (node != null) {
            res.add(node.`val`)
            queue.add(node.left)
            queue.add(node.right)
        } else res.add(null)
    }
    while (res.isNotEmpty() && res.last() == null) res.removeAt(res.size - 1)
    return res
}

class ListNode(var `val`: Int) {
    var next: ListNode? = null
}

fun toListNode(arr: IntArray): ListNode? {
    if (arr.isEmpty()) return null
    val head = ListNode(arr[0])
    var cur = head
    for (i in 1 until arr.size) {
        cur.next = ListNode(arr[i])
        cur = cur.next!!
    }
    return head
}

fun toLinkedLists(arr: Array<IntArray>): Array<ListNode?> =
    Array(arr.size) { idx -> toListNode(arr[idx]) }

fun listNodeToArray(head: ListNode?): IntArray {
    val list = mutableListOf<Int>()
    var cur = head
    while (cur != null) {
        list.add(cur.`val`)
        cur = cur.next
    }
    return list.toIntArray()
}

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
                val n = java.lang.reflect.Array.getLength(obj)
                for (i in 0 until n) {
                    if (i > 0) sb.append(',')
                    write(java.lang.reflect.Array.get(obj, i), sb, seen)
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
