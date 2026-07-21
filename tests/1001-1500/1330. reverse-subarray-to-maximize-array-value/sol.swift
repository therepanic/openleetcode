class Solution {
    func maxValueAfterReverse(_ nums: [Int]) -> Int {
        if nums.count < 2 {
            return 0
        }
        
        var maxMin = Int.min
        var minMin = Int.max
        var S = 0
        var boundary = Int.min
        
        for i in 0..<nums.count - 1 {
            let a = nums[i]
            let b = nums[i + 1]
            let distance = abs(a - b)
            boundary = max(boundary, max(abs(nums.last! - a), abs(nums[0] - b)) - distance)
            S += distance
            minMin = min(max(a, b), minMin)
            maxMin = max(min(a, b), maxMin)
        }
        
        return S + max(2 * (maxMin - minMin), boundary)
    }
}
