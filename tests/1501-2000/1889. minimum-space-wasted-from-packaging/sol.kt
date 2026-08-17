class Solution {
    fun minWastedSpace(packages: IntArray, boxes: Array<IntArray>): Int {
        packages.sort()
        val n = packages.size
        val totalPackageSum = packages.sum().toLong()
        
        var minGrossArea = Long.MAX_VALUE
        
        for (supplierBoxes in boxes) {
            supplierBoxes.sort()
            if (supplierBoxes.last() < packages[n - 1]) continue
            
            var grossArea = 0L
            var lowIdx = 0
            
            for (b in supplierBoxes) {
                val highIdx = upperBound(packages, b, lowIdx)
                val count = highIdx - lowIdx
                if (count > 0) {
                    grossArea += b.toLong() * count
                    lowIdx = highIdx
                }
                if (lowIdx == n) break
            }
            
            minGrossArea = minOf(minGrossArea, grossArea)
        }
        
        if (minGrossArea == Long.MAX_VALUE) return -1
        return ((minGrossArea - totalPackageSum) % 1000000007L).toInt()
    }
    
    private fun upperBound(arr: IntArray, target: Int, lo: Int): Int {
        var l = lo
        var h = arr.size
        while (l < h) {
            val mid = l + (h - l) / 2
            if (arr[mid] <= target) l = mid + 1
            else h = mid
        }
        return l
    }
}
