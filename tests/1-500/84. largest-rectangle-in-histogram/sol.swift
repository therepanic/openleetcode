class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var stack: [Int] = []
        var ans = 0
        for i in 0...heights.count {
            let cur = i == heights.count ? 0 : heights[i]
            while let last = stack.last, heights[last] > cur {
                let h = heights[stack.removeLast()]
                let left = stack.last ?? -1
                ans = max(ans, h * (i - left - 1))
            }
            stack.append(i)
        }
        return ans
    }
}
