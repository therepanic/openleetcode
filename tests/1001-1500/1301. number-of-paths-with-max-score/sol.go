func pathsWithMaxScore(board []string) []int {
    const MOD = 1_000_000_007
    n := len(board)

    nextScore := make([]int, n+1)
    nextWays := make([]int, n+1)
    for j := 0; j <= n; j++ {
        nextScore[j] = -1
    }

    for i := n - 1; i >= 0; i-- {
        currScore := make([]int, n+1)
        currWays := make([]int, n+1)
        for j := 0; j <= n; j++ {
            currScore[j] = -1
        }

        row := board[i]
        for j := n - 1; j >= 0; j-- {
            cell := row[j]

            if cell == 'X' {
                continue
            }

            if cell == 'S' {
                currScore[j] = 0
                currWays[j] = 1
                continue
            }

            best := nextScore[j]
            if currScore[j+1] > best {
                best = currScore[j+1]
            }
            if nextScore[j+1] > best {
                best = nextScore[j+1]
            }

            if best == -1 {
                continue
            }

            ways := 0

            if nextScore[j] == best {
                ways = (ways + nextWays[j]) % MOD
            }
            if currScore[j+1] == best {
                ways = (ways + currWays[j+1]) % MOD
            }
            if nextScore[j+1] == best {
                ways = (ways + nextWays[j+1]) % MOD
            }

            value := 0
            if cell != 'E' {
                value = int(cell - '0')
            }

            currScore[j] = best + value
            currWays[j] = ways
        }

        nextScore = currScore
        nextWays = currWays
    }

    if nextScore[0] == -1 {
        return []int{0, 0}
    }

    return []int{nextScore[0], nextWays[0]}
}
