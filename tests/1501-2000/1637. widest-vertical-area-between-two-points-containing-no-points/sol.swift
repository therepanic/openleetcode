class Solution {
    func maxWidthOfVerticalArea(_ points: [[Int]]) -> Int {
        var maxWidth = 0
        let sorted = points.sorted { $0[0] < $1[0] }
        for i in 0..<(sorted.count - 1) {
            let width = sorted[i+1][0] - sorted[i][0]
            maxWidth = max(maxWidth, width)
        }
        return maxWidth
    }
}
