class Solution {
    func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
        var totalSecs = 0
        var prev: Int? = nil

        for t in timeSeries {
            totalSecs += duration

            if let prev = prev, prev + duration > t {
                totalSecs -= (prev + duration - t)
            }

            prev = t
        }

        return totalSecs
    }
}
