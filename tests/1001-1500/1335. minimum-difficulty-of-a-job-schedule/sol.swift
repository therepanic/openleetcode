class Solution {
    func minDifficulty(_ jobDifficulty: [Int], _ d: Int) -> Int {
        let length = jobDifficulty.count
        if d > length {
            return -1
        }

        var minDifficulties = Array(repeating: Array(repeating: Int.max, count: length), count: d)

        var maxDiff = 0
        var i = 0
        while i <= length - d {
            maxDiff = max(maxDiff, jobDifficulty[i])
            minDifficulties[0][i] = maxDiff
            i += 1
        }

        var currentDay = 1
        while currentDay < d {
            var to = currentDay
            while to <= length - d + currentDay {
                var currentJobDifficulty = jobDifficulty[to]
                var result = Int.max
                var j = to - 1
                while j >= currentDay - 1 {
                    if minDifficulties[currentDay - 1][j] != Int.max {
                        result = min(result, minDifficulties[currentDay - 1][j] + currentJobDifficulty)
                    }
                    currentJobDifficulty = max(currentJobDifficulty, jobDifficulty[j])
                    j -= 1
                }
                minDifficulties[currentDay][to] = result
                to += 1
            }
            currentDay += 1
        }

        return minDifficulties[d - 1][length - 1]
    }
}
