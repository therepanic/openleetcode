class Solution {
    fun canBeEqual(target: IntArray, arr: IntArray): Boolean {
        val counts = IntArray(1001)
        
        for (i in target.indices) {
            counts[target[i]]++
            counts[arr[i]]--
        }
        
        return counts.all { it == 0 }
    }
}
