class Solution {
    func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
        let n = nums.count
        var posOf1s = [-1]
        var total = 0
        var count = 0
        
        if goal == 0 {
            for num in nums {
                if num == 0 {
                    count += 1
                    total += count
                } else {
                    count = 0
                }
            }
            return total
        }
        
        for (i, num) in nums.enumerated() {
            if num == 1 {
                posOf1s.append(i)
            }
        }
        posOf1s.append(n)
        
        for i in 1..<(posOf1s.count - goal) {
            let leftChoices = posOf1s[i] - posOf1s[i - 1]
            let rightChoices = posOf1s[i + goal] - posOf1s[i + goal - 1]
            total += leftChoices * rightChoices
        }
        
        return total
    }
}
