class Solution {
    func getMinDistance(_ nums: [Int], _ target: Int, _ start: Int) -> Int {
        if nums[start] == target {
            return 0
        }
        
        let n = nums.count
        var d = 1
        
        while true {
            if start - d >= 0 && nums[start - d] == target {
                return d
            }
            
            if start + d < n && nums[start + d] == target {
                return d
            }
            
            d += 1
        }
    }
}
