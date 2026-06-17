class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var freq = [Int: (count: Int, first: Int)]()
        for (index, value) in nums.enumerated() {
            if var data = freq[value] {
                data.count += 1
                freq[value] = data
            } else {
                freq[value] = (1, index)
            }
        }
        let sorted = freq.sorted {
            if $0.value.count != $1.value.count { return $0.value.count > $1.value.count }
            return $0.value.first < $1.value.first
        }
        return Array(sorted.prefix(k).map { $0.key })
    }
}
