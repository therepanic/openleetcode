class Solution {
    fun videoStitching(clips: Array<IntArray>, time: Int): Int {
        clips.sortBy { it[0] }
        var end = 0
        var farthest = 0
        var res = 0
        var i = 0
        while (farthest < time) {
            val prevFarthest = farthest
            while (i < clips.size && clips[i][0] <= end) {
                farthest = maxOf(farthest, clips[i][1])
                i++
            }
            if (farthest == prevFarthest) {
                return -1
            }
            end = farthest
            res++
        }
        return res
    }
}
