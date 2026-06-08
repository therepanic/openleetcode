class Solution {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        if matrix.isEmpty || matrix[0].isEmpty { return 0 }
        let cols = matrix[0].count
        var heights = Array(repeating: 0, count: cols)
        var ans = 0
        for row in matrix {
            for c in 0..<cols { heights[c] = row[c] == "1" ? heights[c] + 1 : 0 }
            ans = max(ans, largest(heights))
        }
        return ans
    }

    private func largest(_ heights: [Int]) -> Int {
        var stack: [Int] = []
        var best = 0
        for i in 0...heights.count {
            let cur = i == heights.count ? 0 : heights[i]
            while let last = stack.last, heights[last] > cur {
                let h = heights[stack.removeLast()]
                let left = stack.last ?? -1
                best = max(best, h * (i - left - 1))
            }
            stack.append(i)
        }
        return best
    }
}
