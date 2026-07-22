class Solution {
    fun minSteps(s: String, t: String): Int {
        val dic = mutableMapOf<Char, Int>()
        for (ch in t) {
            dic[ch] = dic.getOrDefault(ch, 0) + 1
        }
        for (ch in s) {
            if (dic.containsKey(ch) && dic[ch]!! > 0) {
                dic[ch] = dic[ch]!! - 1
            }
        }
        return dic.values.sum()
    }
}
