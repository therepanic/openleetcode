class Solution {
    func findLucky(_ arr: [Int]) -> Int {
        var freq = [Int: Int]()
        for num in arr {
            freq[num, default: 0] += 1
        }
        
        var lucky = -1
        for (num, count) in freq {
            if num == count {
                lucky = max(lucky, num)
            }
        }
        
        return lucky
    }
}
