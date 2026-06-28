class Solution {
    fun numMatchingSubseq(s: String, words: Array<String>): Int {
        val n = s.length
        val mp = mutableMapOf<Char, MutableList<Int>>()
        for (i in s.indices) {
            val c = s[i]
            mp.computeIfAbsent(c) { mutableListOf() }.add(i)
        }
        for (c in 'a'..'z') {
            val list = mp.getOrDefault(c, mutableListOf())
            list.add(n)
            list.sort()
            mp[c] = list
        }
        
        fun found(word: String): Boolean {
            var curr = -1
            for (c in word) {
                if (curr >= n) return false
                val arr = mp[c]!!
                var idx = arr.binarySearch(curr + 1)
                if (idx < 0) idx = -idx - 1
                curr = arr[idx]
            }
            return curr < n
        }
        
        var cnt = 0
        for (word in words) {
            if (found(word)) cnt++
        }
        return cnt
    }
}
