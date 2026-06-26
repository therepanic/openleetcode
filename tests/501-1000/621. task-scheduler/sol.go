func leastInterval(tasks []byte, n int) int {
    count := make(map[byte]int)
    for _, t := range tasks {
        count[t]++
    }
    f_max := 0
    for _, v := range count {
        if v > f_max {
            f_max = v
        }
    }
    max_count := 0
    for _, v := range count {
        if v == f_max {
            max_count++
        }
    }
    if len(tasks) > (f_max-1)*(n+1)+max_count {
        return len(tasks)
    }
    return (f_max-1)*(n+1) + max_count
}
