class Solution {
    fun scoreOfStudents(s: String, answers: IntArray): Int {
        val memo = HashMap<Pair<Int,Int>, Set<Int>>()
        
        fun fn(lo: Int, hi: Int): Set<Int> {
            val key = Pair(lo, hi)
            memo[key]?.let { return it }
            if (lo + 1 == hi) {
                val tmp = mutableSetOf(s[lo] - '0')
                memo[key] = tmp
                return tmp
            }
            val ans = mutableSetOf<Int>()
            var mid = lo + 1
            while (mid < hi) {
                for (x in fn(lo, mid)) {
                    for (y in fn(mid + 1, hi)) {
                        if (s[mid] == '+' && x + y <= 1000) ans.add(x + y)
                        else if (s[mid] == '*' && x * y <= 1000) ans.add(x * y)
                    }
                }
                mid += 2
            }
            memo[key] = ans
            return ans
        }
        
        // evaluate target respecting precedence
        val nums = java.util.ArrayDeque<Int>()
        val ops = java.util.ArrayDeque<Char>()
        for (i in s.indices) {
            val c = s[i]
            if (c.isDigit()) nums.addLast(c - '0')
            else if (c == '+' || c == '*') {
                while (ops.isNotEmpty() && precedence(ops.peekLast()) >= precedence(c)) {
                    apply(nums, ops.pollLast())
                }
                ops.addLast(c)
            }
        }
        while (ops.isNotEmpty()) apply(nums, ops.pollLast())
        val target = nums.pollLast()
        
        val cand = fn(0, s.length)
        var score = 0
        for (x in answers) {
            if (x == target) score += 5
            else if (cand.contains(x)) score += 2
        }
        return score
    }
    
    private fun precedence(c: Char): Int = if (c == '*') 2 else 1
    
    private fun apply(nums: java.util.ArrayDeque<Int>, op: Char) {
        val b = nums.pollLast()
        val a = nums.pollLast()
        if (op == '+') nums.addLast(a + b) else nums.addLast(a * b)
    }
}
