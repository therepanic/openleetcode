func average(salary []int) float64 {
    max := salary[0]
    min := salary[0]
    for _, s := range salary {
        if s > max {
            max = s
        }
        if s < min {
            min = s
        }
    }
    total := 0.0
    count := 0
    for _, s := range salary {
        if s != max && s != min {
            total += float64(s)
            count++
        }
    }
    return total / float64(count)
}
