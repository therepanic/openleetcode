class Solution {
    fun findRestaurant(list1: Array<String>, list2: Array<String>): Array<String> {
        val mp = mutableMapOf<String, Int>()
        mp[list1[0]] = Int.MIN_VALUE
        for (i in 1 until list1.size) {
            mp[list1[i]] = -i
        }
        if (!mp.containsKey(list2[0])) {
            mp[list2[0]] = Int.MIN_VALUE
        } else {
            if (mp[list2[0]] != Int.MIN_VALUE) {
                mp[list2[0]] = kotlin.math.abs(mp[list2[0]]!!)
            } else {
                mp[list2[0]] = 0
            }
        }
        for (i in 1 until list2.size) {
            if (mp.containsKey(list2[i])) {
                if (mp[list2[i]] != Int.MIN_VALUE) {
                    mp[list2[i]] = kotlin.math.abs(mp[list2[i]]!!) + i
                } else {
                    mp[list2[i]] = i
                }
            } else {
                mp[list2[i]] = -i
            }
        }
        var minVal = Int.MAX_VALUE
        for (v in mp.values) {
            if (v >= 0) {
                minVal = minOf(minVal, v)
            }
        }
        val ans = mutableListOf<String>()
        for ((key, value) in mp) {
            if (value >= 0 && value == minVal) {
                ans.add(key)
            }
        }
        return ans.toTypedArray()
    }
}
