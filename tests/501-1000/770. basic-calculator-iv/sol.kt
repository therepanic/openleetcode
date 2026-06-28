class Solution {
    fun basicCalculatorIV(expression: String, evalvars: Array<String>, evalints: IntArray): List<String> {
        val evalmap = mutableMapOf<String, Int>()
        for (i in evalvars.indices) evalmap[evalvars[i]] = evalints[i]

        val tokens = mutableListOf<String>()
        val buf = StringBuilder()
        for (ch in expression) {
            if (ch.isLetterOrDigit()) buf.append(ch)
            else {
                if (buf.isNotEmpty()) { tokens.add(buf.toString()); buf.clear() }
                if (ch in "+-*()") tokens.add(ch.toString())
            }
        }
        if (buf.isNotEmpty()) tokens.add(buf.toString())

        val vals = ArrayDeque<Map<String, Int>>()
        val ops = ArrayDeque<String>()
        val prec = mapOf("+" to 1, "-" to 1, "*" to 2)

        fun applyOp() {
            val op = ops.removeLast()
            val b = vals.removeLast()
            val a = vals.removeLast()
            vals.addLast(when(op) {
                "+" -> add(a, b)
                "-" -> sub(a, b)
                else -> mul(a, b)
            })
        }

        for (tok in tokens) {
            when {
                tok == "(" -> ops.addLast(tok)
                tok == ")" -> {
                    while (ops.isNotEmpty() && ops.last() != "(") applyOp()
                    ops.removeLast()
                }
                tok in prec -> {
                    while (ops.isNotEmpty() && ops.last() != "(" && prec[ops.last()]!! >= prec[tok]!!)
                        applyOp()
                    ops.addLast(tok)
                }
                else -> vals.addLast(parseToken(tok, evalmap))
            }
        }
        while (ops.isNotEmpty()) applyOp()
        val poly = vals.last()

        val items = poly.filter { it.value != 0 }
            .map { (k, v) ->
                val vars = if (k.isEmpty()) emptyArray() else k.split(",").toTypedArray()
                Pair(vars, v)
            }
            .sortedWith(compareByDescending<Pair<Array<String>, Int>> { it.first.size }.thenBy { it.first.joinToString("*") })

        return items.map { (vars, coeff) ->
            if (vars.isEmpty()) coeff.toString()
            else "$coeff*${vars.joinToString("*")}"
        }
    }

    private fun makeKey(vars: Array<String>): String = vars.sortedArray().joinToString(",")

    private fun combine(poly: Map<String, Int>): Map<String, Int> =
        poly.filterValues { it != 0 }

    private fun add(a: Map<String, Int>, b: Map<String, Int>): Map<String, Int> {
        val res = a.toMutableMap()
        for ((k, v) in b) res[k] = res.getOrDefault(k, 0) + v
        return combine(res)
    }

    private fun sub(a: Map<String, Int>, b: Map<String, Int>): Map<String, Int> {
        val res = a.toMutableMap()
        for ((k, v) in b) res[k] = res.getOrDefault(k, 0) - v
        return combine(res)
    }

    private fun mul(a: Map<String, Int>, b: Map<String, Int>): Map<String, Int> {
        val res = mutableMapOf<String, Int>()
        for ((k1, v1) in a) {
            val va = if (k1.isEmpty()) emptyArray() else k1.split(",").toTypedArray()
            for ((k2, v2) in b) {
                val vb = if (k2.isEmpty()) emptyArray() else k2.split(",").toTypedArray()
                val merged = va + vb
                val key = makeKey(merged)
                res[key] = res.getOrDefault(key, 0) + v1 * v2
            }
        }
        return combine(res)
    }

    private fun parseToken(tok: String, evalmap: Map<String, Int>): Map<String, Int> {
        val res = mutableMapOf<String, Int>()
        when {
            tok.toIntOrNull() != null -> res[""] = tok.toInt()
            tok in evalmap -> res[""] = evalmap[tok]!!
            else -> res[tok] = 1
        }
        return res
    }
}
