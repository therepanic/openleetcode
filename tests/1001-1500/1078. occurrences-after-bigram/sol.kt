class Solution {
    fun findOcurrences(text: String, first: String, second: String): Array<String> {
        val words = text.split(" ")
        val result = mutableListOf<String>()
        for (i in 0 until words.size - 2) {
            if (words[i] == first && words[i + 1] == second) {
                result.add(words[i + 2])
            }
        }
        return result.toTypedArray()
    }
}
