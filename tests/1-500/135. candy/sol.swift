class Solution {
    func candy(_ ratings: [Int]) -> Int {
        var candies = Array(repeating: 1, count: ratings.count)
        for i in 1..<ratings.count where ratings[i] > ratings[i - 1] { candies[i] = candies[i - 1] + 1 }
        if ratings.count >= 2 { for i in stride(from: ratings.count - 2, through: 0, by: -1) where ratings[i] > ratings[i + 1] { candies[i] = Swift.max(candies[i], candies[i + 1] + 1) } }
        return candies.reduce(0, +)
    }
}
