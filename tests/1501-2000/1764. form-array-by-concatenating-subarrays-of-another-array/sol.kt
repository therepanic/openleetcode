class Solution {
    fun canChoose(groups: Array<IntArray>, nums: IntArray): Boolean {
        var i = 0
        for (group in groups) {
            var found = false
            while (i + group.size <= nums.size) {
                var match = true
                for (j in group.indices) {
                    if (nums[i + j] != group[j]) {
                        match = false
                        break
                    }
                }
                if (match) {
                    i += group.size
                    found = true
                    break
                } else {
                    i++
                }
            }
            if (!found) return false
        }
        return true
    }
}
