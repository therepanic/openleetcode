func minDifficulty(jobDifficulty []int, d int) int {
    length := len(jobDifficulty)
    if d > length {
        return -1
    }

    minDifficulties := make([][]int, d)
    for day := 0; day < d; day++ {
        minDifficulties[day] = make([]int, length)
        for i := 0; i < length; i++ {
            minDifficulties[day][i] = math.MaxInt32
        }
    }

    maxDiff := 0
    i := 0
    for i <= length - d {
        if jobDifficulty[i] > maxDiff {
            maxDiff = jobDifficulty[i]
        }
        minDifficulties[0][i] = maxDiff
        i++
    }

    currentDay := 1
    for currentDay < d {
        to := currentDay
        for to <= length - d + currentDay {
            currentJobDifficulty := jobDifficulty[to]
            result := math.MaxInt32
            j := to - 1
            for j >= currentDay - 1 {
                if minDifficulties[currentDay - 1][j] + currentJobDifficulty < result {
                    result = minDifficulties[currentDay - 1][j] + currentJobDifficulty
                }
                if jobDifficulty[j] > currentJobDifficulty {
                    currentJobDifficulty = jobDifficulty[j]
                }
                j--
            }
            minDifficulties[currentDay][to] = result
            to++
        }
        currentDay++
    }

    return minDifficulties[d - 1][length - 1]
}
