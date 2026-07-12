class Solution {
    func totalFruit(_ fruits: [Int]) -> Int {
        var start = 0
        var maxLen = 0
        var fruitCount = [Int: Int]()
        
        for end in 0..<fruits.count {
            fruitCount[fruits[end], default: 0] += 1
            
            while fruitCount.count > 2 {
                let leftFruit = fruits[start]
                fruitCount[leftFruit]! -= 1
                if fruitCount[leftFruit] == 0 {
                    fruitCount.removeValue(forKey: leftFruit)
                }
                start += 1
            }
            
            maxLen = max(maxLen, end - start + 1)
        }
        
        return maxLen
    }
}
