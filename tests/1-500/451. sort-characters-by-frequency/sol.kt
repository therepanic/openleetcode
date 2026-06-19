class Solution {
    fun frequencySort(s: String): String {
        val freq = s.groupingBy { it }.eachCount()
        return freq.entries
            .sortedByDescending { it.value }
            .joinToString("") { (char, count) -> char.toString().repeat(count) }
    }
}
