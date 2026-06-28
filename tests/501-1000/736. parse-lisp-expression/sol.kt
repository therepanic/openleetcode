class Solution {
    fun evaluate(expression: String): Int {
        fun isnum(t: String): Boolean = t[0] == '-' || t[0].isDigit()
        
        fun lookup(v: String, env: MutableList<MutableMap<String, Int>>): Int {
            for (i in env.indices.reversed()) {
                if (env[i].containsKey(v)) return env[i][v]!!
            }
            return 0
        }
        
        fun toks(s: String): List<String> {
            val res = mutableListOf<String>()
            var i = 0
            val n = s.length
            var bal = 0
            var st = 0
            while (i < n) {
                val c = s[i]
                if (c == '(') bal++
                else if (c == ')') bal--
                else if (c == ' ' && bal == 0) {
                    if (st < i) res.add(s.substring(st, i))
                    st = i + 1
                }
                i++
            }
            if (st < n) res.add(s.substring(st))
            return res
        }
        
        fun evals(e: String, env: MutableList<MutableMap<String, Int>>): Int {
            if (e[0] != '(') {
                if (isnum(e)) return e.toInt()
                return lookup(e, env)
            }
            val inner = e.substring(1, e.length - 1)
            val parts = toks(inner)
            val op = parts[0]
            if (op == "add") return evals(parts[1], env) + evals(parts[2], env)
            if (op == "mult") return evals(parts[1], env) * evals(parts[2], env)
            
            val loc = mutableMapOf<String, Int>()
            env.add(loc)
            var i = 1
            while (i < parts.size - 1) {
                val v = parts[i]
                val value = evals(parts[i + 1], env)
                loc[v] = value
                i += 2
            }
            val ans = evals(parts.last(), env)
            env.removeAt(env.lastIndex)
            return ans
        }
        
        return evals(expression, mutableListOf())
    }
}
