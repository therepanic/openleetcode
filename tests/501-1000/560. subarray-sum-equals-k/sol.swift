class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var subNum = [0: 1]
        var total = 0
        var count = 0
        
        for n in nums {
            total += n
            
            if let val = subNum[total - k] {
                count += val
            }
            
            subNum[total, default: 0] += 1
        }
        
        return count
    }
}
