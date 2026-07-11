class Solution {
    func fairCandySwap(_ aliceSizes: [Int], _ bobSizes: [Int]) -> [Int] {
        let sumA = aliceSizes.reduce(0, +)
        let sumB = bobSizes.reduce(0, +)
        let diff = (sumB - sumA) / 2
        let setB = Set(bobSizes)
        for a in aliceSizes {
            if setB.contains(a + diff) {
                return [a, a + diff]
            }
        }
        return []
    }
}
