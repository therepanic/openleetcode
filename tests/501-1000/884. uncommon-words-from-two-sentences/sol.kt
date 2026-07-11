class Solution {
    fun uncommonFromSentences(s1: String, s2: String): Array<String> {
        val words = (s1.split(" ") + s2.split(" "))
        val count = words.groupingBy { it }.eachCount()
        return count.filter { it.value == 1 }.keys.toTypedArray()
    }
}
