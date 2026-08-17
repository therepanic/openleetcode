class Solution {
    fun countMatches(items: List<List<String>>, ruleKey: String, ruleValue: String): Int {
        return countMatches(items.map { it.toTypedArray() }.toTypedArray(), ruleKey, ruleValue)
    }

    fun countMatches(items: Array<Array<String>>, ruleKey: String, ruleValue: String): Int {
        val keyMap = mapOf("type" to 0, "color" to 1, "name" to 2)
        var count = 0
        val idx = keyMap[ruleKey]!!
        for (item in items) {
            if (item[idx] == ruleValue) count++
        }
        return count
    }
}
