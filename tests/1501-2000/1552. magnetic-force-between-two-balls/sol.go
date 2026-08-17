func maxDistance(position []int, m int) int {
    sort.Ints(position)
    right := position[len(position)-1] - position[0]
    left := 1
    
    for left <= right {
        mid := (left + right) / 2
        myBalls := 1
        previous := position[0]
        
        for _, places := range position[1:] {
            if places - previous >= mid {
                myBalls++
                previous = places
            }
        }
        
        if myBalls >= m {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    
    return right
}
