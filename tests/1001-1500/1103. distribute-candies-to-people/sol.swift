class Solution {
    func distributeCandies(_ candies: Int, _ num_people: Int) -> [Int] {
        var res = Array(repeating: 0, count: num_people)
        var give = 1
        var i = 0
        var remaining = candies

        while remaining > 0 {
            res[i % num_people] += min(give, remaining)
            remaining -= give
            give += 1
            i += 1
        }

        return res
    }
}
