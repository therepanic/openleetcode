class Solution {
    func frequencySort(_ nums: [Int]) -> [Int] {
        var freq: [Int: Int] = [:]
        for num in nums {
            freq[num, default: 0] += 1
        }
        return nums.sorted {
            if freq[$0]! != freq[$1]! {
                return freq[$0]! < freq[$1]!
            }
            return $0 > $1
        }
    }
}
