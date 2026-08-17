class Solution {
    fun areSentencesSimilar(sentence1: String, sentence2: String): Boolean {
        val s1 = sentence1.split(" ")
        val s2 = sentence2.split(" ")
        
        var l1 = 0
        var l2 = 0
        var r1 = s1.size - 1
        var r2 = s2.size - 1
        
        while (l1 <= r1 && l2 <= r2) {
            if (s1[l1] == s2[l2]) {
                l1++
                l2++
            } else if (s1[r1] == s2[r2]) {
                r1--
                r2--
            } else {
                return false
            }
        }
        
        return true
    }
}
