class Solution {
    func getMaximumConsecutive(_ coins: [Int]) -> Int {
        let sorted = coins.sorted()
        var maxConsecutive = 0
        
        for coin in sorted {
            if coin > maxConsecutive + 1 { break }
            maxConsecutive += coin
        }
        
        return maxConsecutive + 1
    }
}
