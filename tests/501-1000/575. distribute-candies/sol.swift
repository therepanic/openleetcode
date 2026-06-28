class Solution {
    func distributeCandies(_ candyType: [Int]) -> Int {
        let n = candyType.count
        let k = n / 2
        let set = Set(candyType)
        return min(k, set.count)
    }
}
