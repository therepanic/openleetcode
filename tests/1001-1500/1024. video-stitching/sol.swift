class Solution {
    func videoStitching(_ clips: [[Int]], _ time: Int) -> Int {
        let sortedClips = clips.sorted { $0[0] < $1[0] }
        var end = 0
        var farthest = 0
        var res = 0
        var i = 0
        while farthest < time {
            let prevFarthest = farthest
            while i < sortedClips.count && sortedClips[i][0] <= end {
                farthest = max(farthest, sortedClips[i][1])
                i += 1
            }
            if farthest == prevFarthest {
                return -1
            }
            end = farthest
            res += 1
        }
        return res
    }
}
