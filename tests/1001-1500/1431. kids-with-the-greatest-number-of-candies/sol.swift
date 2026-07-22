class Solution {
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        let currentMax = candies.max()!
        var result: [Bool] = []
        for candyCount in candies {
            if candyCount + extraCandies >= currentMax {
                result.append(true)
            } else {
                result.append(false)
            }
        }
        return result
    }
}
