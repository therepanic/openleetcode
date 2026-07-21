class Solution {
    func pathsWithMaxScore(_ board: [String]) -> [Int] {
        let MOD = 1_000_000_007
        let n = board.count

        var nextScore = [Int](repeating: -1, count: n + 1)
        var nextWays = [Int](repeating: 0, count: n + 1)

        let boardChars = board.map { Array($0) }

        for i in stride(from: n - 1, through: 0, by: -1) {
            var currScore = [Int](repeating: -1, count: n + 1)
            var currWays = [Int](repeating: 0, count: n + 1)

            let row = boardChars[i]
            for j in stride(from: n - 1, through: 0, by: -1) {
                let cell = row[j]

                if cell == "X" {
                    continue
                }

                if cell == "S" {
                    currScore[j] = 0
                    currWays[j] = 1
                    continue
                }

                let best = max(nextScore[j], currScore[j + 1], nextScore[j + 1])

                if best == -1 {
                    continue
                }

                var ways = 0

                if nextScore[j] == best {
                    ways = (ways + nextWays[j]) % MOD
                }
                if currScore[j + 1] == best {
                    ways = (ways + currWays[j + 1]) % MOD
                }
                if nextScore[j + 1] == best {
                    ways = (ways + nextWays[j + 1]) % MOD
                }

                let value = (cell == "E") ? 0 : Int(String(cell))!

                currScore[j] = best + value
                currWays[j] = ways
            }

            nextScore = currScore
            nextWays = currWays
        }

        if nextScore[0] == -1 {
            return [0, 0]
        }

        return [nextScore[0], nextWays[0]]
    }
}
