class Solution {
    fun minTimeToType(word: String): Int {
        var answer = 0
        var pointer = 'a'
        
        for (char in word) {
            val clockwise = Math.abs(char - pointer)
            val counterclockwise = 26 - clockwise
            answer += minOf(clockwise, counterclockwise) + 1
            pointer = char
        }
        
        return answer
    }
}
