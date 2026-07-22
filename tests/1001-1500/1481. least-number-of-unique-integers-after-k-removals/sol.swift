class Solution {
    func findLeastNumOfUniqueInts(_ arr: [Int], _ k: Int) -> Int {
        var counts: [Int: Int] = [:]
        for num in arr {
            counts[num, default: 0] += 1
        }
        var remaining = counts.count
        var tempK = k
        let frequencies = counts.values.sorted()
        for count in frequencies {
            if tempK < count {
                break
            }
            tempK -= count
            remaining -= 1
        }
        return remaining
    }
}
