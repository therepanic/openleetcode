class Solution {
    func findDiagonalOrder(_ nums: [[Int]]) -> [Int] {
        var l: [(Int, Int, Int)] = []
        for i in 0..<nums.count {
            for j in 0..<nums[i].count {
                l.append((i + j, i, j))
            }
        }

        var h: [Int: [Int]] = [:]
        for (sum, i, j) in l {
            h[sum, default: []].append(nums[i][j])
        }

        var result: [Int] = []
        for key in h.keys.sorted() {
            result.append(contentsOf: h[key]!.reversed())
        }
        return result
    }
}
