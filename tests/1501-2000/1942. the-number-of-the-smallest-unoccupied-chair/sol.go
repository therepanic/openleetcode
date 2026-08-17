func smallestChair(times [][]int, targetFriend int) int {
    target_time := times[targetFriend]
    sort.Slice(times, func(i, j int) bool {
        return times[i][0] < times[j][0]
    })

    n := len(times)
    chair_time := make([]int, n)

    for _, time := range times {
        for i := 0; i < n; i++ {
            if chair_time[i] <= time[0] {
                chair_time[i] = time[1]
                if time[0] == target_time[0] && time[1] == target_time[1] {
                    return i
                }
                break
            }
        }
    }

    return 0
}
