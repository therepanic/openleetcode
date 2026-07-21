class Solution {
    func movesToMakeZigzag(_ nums: [Int]) -> Int {
        let n = nums.count
        
        func findValleys(_ mode: Int) -> Int {
            var res = 0
            for i in 0..<n {
                if i % 2 == mode {
                    let left = i - 1 >= 0 ? nums[i - 1] : Int.max
                    let right = i + 1 < n ? nums[i + 1] : Int.max
                    let minNeighbor = min(left, right)
                    if nums[i] >= minNeighbor {
                        res += nums[i] - (minNeighbor - 1)
                    }
                }
            }
            return res
        }
        
        return min(findValleys(0), findValleys(1))
    }
}
