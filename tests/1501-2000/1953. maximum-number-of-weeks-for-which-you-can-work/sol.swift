class Solution {
    func numberOfWeeks(_ milestones: [Int]) -> Int {
        let total = milestones.reduce(0, +)
        let maxVal = milestones.max() ?? 0
        if maxVal <= total - maxVal {
            return total
        } else {
            return 2 * (total - maxVal) + 1
        }
    }
}
