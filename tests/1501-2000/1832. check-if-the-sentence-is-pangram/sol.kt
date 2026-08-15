class Solution {
    fun checkIfPangram(sentence: String): Boolean {
        if (sentence.length < 26) return false
        
        for (i in 0 until 26) {
            if ((97+i).toChar() !in sentence) return false
        }
        return true
    }
}
