class Solution {
    func countQuadruplets(_ nums: [Int]) -> Int {
        var res = 0
        let n = nums.count
        for w in 0..<n {
            for x in (w+1)..<n {
                for y in (x+1)..<n {
                    for z in (y+1)..<n {
                        if nums[w] + nums[x] + nums[y] == nums[z] {
                            res += 1
                        }
                    }
                }
            }
        }
        return res
    }
}
