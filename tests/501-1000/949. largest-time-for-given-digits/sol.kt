class Solution {
    fun largestTimeFromDigits(arr: IntArray): String {
        val permList = mutableListOf<IntArray>()
        permute(arr, 0, permList)
        
        var bestTime = -1
        var bestIdx = -1
        
        for (i in permList.indices) {
            val perm = permList[i]
            val hours = perm[0] * 10 + perm[1]
            val minutes = perm[2] * 10 + perm[3]
            
            if (hours < 24 && minutes < 60) {
                val currTime = hours * 60 + minutes
                if (currTime > bestTime) {
                    bestTime = currTime
                    bestIdx = i
                }
            }
        }
        
        if (bestIdx == -1) return ""
        
        val res = permList[bestIdx]
        return "${res[0]}${res[1]}:${res[2]}${res[3]}"
    }
    
    private fun permute(arr: IntArray, start: Int, result: MutableList<IntArray>) {
        if (start == arr.size) {
            result.add(arr.copyOf())
            return
        }
        for (i in start until arr.size) {
            swap(arr, start, i)
            permute(arr, start + 1, result)
            swap(arr, start, i)
        }
    }
    
    private fun swap(arr: IntArray, i: Int, j: Int) {
        val tmp = arr[i]
        arr[i] = arr[j]
        arr[j] = tmp
    }
}
