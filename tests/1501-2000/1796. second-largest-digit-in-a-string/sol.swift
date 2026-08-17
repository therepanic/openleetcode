class Solution {
    func secondHighest(_ s: String) -> Int {
        var digits = Set<Character>()
        for c in s {
            if c.isNumber {
                digits.insert(c)
            }
        }
        let ints = digits.map { Int(String($0))! }
        if ints.count > 1 {
            let max = ints.max()!
            let filtered = ints.filter { $0 != max }
            return filtered.max()!
        }
        return -1
    }
}
