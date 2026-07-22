class Solution {
    func maxEqualFreq(_ nums: [Int]) -> Int {
        var counts = [Int: Int]()
        var frequencyCounts = [Int: Int]()
        var best = 0

        for (i, value) in nums.enumerated() {
            let index = i + 1
            let previous = counts[value] ?? 0
            if previous > 0 {
                frequencyCounts[previous, default: 0] -= 1
                if frequencyCounts[previous] == 0 {
                    frequencyCounts.removeValue(forKey: previous)
                }
            }
            counts[value] = previous + 1
            let frequency = previous + 1
            frequencyCounts[frequency, default: 0] += 1

            if frequencyCounts.count == 1 {
                let (onlyFrequency, valueCount) = frequencyCounts.first!
                if onlyFrequency == 1 || valueCount == 1 {
                    best = index
                }
            } else if frequencyCounts.count == 2 {
                let sorted = frequencyCounts.keys.sorted()
                let low = sorted[0]
                let high = sorted[1]
                if (low == 1 && frequencyCounts[low] == 1) || (high == low + 1 && frequencyCounts[high] == 1) {
                    best = index
                }
            }
        }

        return best
    }
}
