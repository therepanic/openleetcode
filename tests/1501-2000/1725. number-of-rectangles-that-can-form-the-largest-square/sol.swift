class Solution {
    func countGoodRectangles(_ rectangles: [[Int]]) -> Int {
        let maxLen = rectangles.map { $0.min()! }.max()!
        return rectangles.filter { $0.min()! == maxLen }.count
    }
}
