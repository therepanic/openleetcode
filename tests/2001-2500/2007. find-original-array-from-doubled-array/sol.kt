class Solution {
    fun findOriginalArray(changed: IntArray): IntArray {
        if (changed.size % 2 != 0) return intArrayOf()
        
        val count = mutableMapOf<Int, Int>()
        for (num in changed) {
            count[num] = (count[num] ?: 0) + 1
        }
        changed.sort()
        val original = mutableListOf<Int>()
        
        for (num in changed) {
            if (count[num] == 0) continue
            if ((count[2 * num] ?: 0) == 0) return intArrayOf()
            original.add(num)
            count[num] = count[num]!! - 1
            count[2 * num] = count[2 * num]!! - 1
        }
        
        return original.toIntArray()
    }
}
