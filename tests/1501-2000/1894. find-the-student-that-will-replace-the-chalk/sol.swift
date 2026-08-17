class Solution {
    func chalkReplacer(_ chalk: [Int], _ k: Int) -> Int {
        let total = chalk.reduce(0, +)
        var remaining = k % total
        for (i, amount) in chalk.enumerated() {
            if remaining < amount { return i }
            remaining -= amount
        }
        return 0
    }
}
