func numRescueBoats(people []int, limit int) int {
    sort.Ints(people)
    start := 0
    end := len(people) - 1
    boats := 0
    
    for start <= end {
        if people[start] + people[end] <= limit {
            start++
            end--
        } else {
            end--
        }
        boats++
    }
    
    return boats
}
