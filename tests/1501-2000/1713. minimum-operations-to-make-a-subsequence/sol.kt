class Solution {
    fun minOperations(target: IntArray, arr: IntArray): Int {
        val targetIndexMap = target.withIndex().associate { it.value to it.index }
        
        val transformedArr = mutableListOf<Int>()
        for (num in arr) {
            if (targetIndexMap.containsKey(num)) {
                transformedArr.add(targetIndexMap[num]!!)
            }
        }
        
        val lis = mutableListOf<Int>()
        for (index in transformedArr) {
            var pos = lis.binarySearch(index)
            if (pos < 0) pos = -pos - 1
            if (pos == lis.size) {
                lis.add(index)
            } else {
                lis[pos] = index
            }
        }
        
        return target.size - lis.size
    }
}
