class Solution {
    func average(_ salary: [Int]) -> Double {
        let max = salary.max()!
        let min = salary.min()!
        var total = 0.0
        var count = 0
        for s in salary {
            if s != max && s != min {
                total += Double(s)
                count += 1
            }
        }
        return total / Double(count)
    }
}
