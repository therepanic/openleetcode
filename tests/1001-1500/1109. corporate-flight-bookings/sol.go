func corpFlightBookings(bookings [][]int, n int) []int {
    l := make([]int, n+1)
    for _, i := range bookings {
        x := i[0]
        y := i[1]
        l[x-1] += i[2]
        l[y] -= i[2]
    }
    
    s := make([]int, n)
    for i := 0; i < n; i++ {
        if i == 0 {
            s[i] = l[i]
        } else {
            s[i] = s[i-1] + l[i]
        }
    }
    return s
}
