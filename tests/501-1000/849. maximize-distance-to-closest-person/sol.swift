class Solution {
    func maxDistToClosest(_ seats: [Int]) -> Int {
        var previous = -1
        var best = 0
        for (index, seat) in seats.enumerated() where seat == 1 {
            best = max(best, previous == -1 ? index : (index - previous) / 2)
            previous = index
        }
        return max(best, seats.count - 1 - previous)
    }
}
