class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var nums = nums
        var res = [[Int]]()

        func backtrack(_ i: Int) {
            if i == nums.count {
                res.append(nums)
                return
            }

            for j in i..<nums.count {
                nums.swapAt(i, j)
                backtrack(i + 1)
                nums.swapAt(i, j)
            }
        }

        backtrack(0)
        return res
    }
}
