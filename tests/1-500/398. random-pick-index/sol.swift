class Solution {
    var dict: [Int: [Int]] = [:]

    init(_ nums: [Int]) {
        for (i, v) in nums.enumerated() {
            dict[v, default: []].append(i)
        }
    }
    
    func pick(_ target: Int) -> Int {
        let indices = dict[target]!
        return indices.randomElement()!
    }
}
