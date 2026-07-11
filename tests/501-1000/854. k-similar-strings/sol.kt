import java.util.ArrayDeque

class Solution {
    fun kSimilarity(s1: String, s2: String): Int {
        val queue = ArrayDeque<String>()
        queue.offer(s1)
        val seen = HashSet<String>()
        var answ = 0
        
        while (queue.isNotEmpty()) {
            repeat(queue.size) {
                val string = queue.poll()
                if (string == s2) return answ
                
                var i = 0
                while (string[i] == s2[i]) i++
                
                for (j in i + 1 until string.length) {
                    if (string[i] == s2[j] && s2[j] != s1[j]) {
                        val new = string.substring(0, i) + string[j] +
                                 string.substring(i + 1, j) + string[i] +
                                 string.substring(j + 1)
                        if (new !in seen) {
                            seen.add(new)
                            queue.offer(new)
                        }
                    }
                }
            }
            answ++
        }
        return answ
    }
}
