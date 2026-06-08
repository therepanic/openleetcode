class Solution {
    fun groupAnagrams(strs: Array<String>): List<List<String>> {
        val groups = LinkedHashMap<String, MutableList<String>>()

        for (word in strs) {
            val chars = word.toCharArray()
            chars.sort()
            val key = String(chars)
            if (!groups.containsKey(key)) {
                groups[key] = mutableListOf()
            }
            groups[key]!!.add(word)
        }

        val res = mutableListOf<List<String>>()
        for (group in groups.values) {
            res.add(group)
        }
        return res
    }
}
