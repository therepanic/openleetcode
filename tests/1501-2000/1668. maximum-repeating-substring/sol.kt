class Solution {
    fun maxRepeating(sequence: String, word: String): Int {
        var temp = word
        var res = 0
        while (sequence.contains(temp)) {
            res++
            temp += word
        }
        return res
    }
}
