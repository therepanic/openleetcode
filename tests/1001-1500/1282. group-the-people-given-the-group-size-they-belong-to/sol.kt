class Solution {
    fun groupThePeople(groupSizes: IntArray): List<List<Int>> {
        val ans = mutableListOf<List<Int>>()
        val mp = mutableMapOf<Int, MutableList<Int>>()
        for (i in groupSizes.indices) {
            val v = groupSizes[i]
            val list = mp.getOrPut(v) { mutableListOf() }
            list.add(i)
            if (list.size == v) {
                ans.add(list.toList())
                mp[v] = mutableListOf()
            }
        }
        return ans
    }
}
