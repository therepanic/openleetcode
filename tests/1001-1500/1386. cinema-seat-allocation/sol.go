func maxNumberOfFamilies(n int, reservedSeats [][]int) int {
    rowSeats := make(map[int]map[int]bool)
    
    for _, reservation := range reservedSeats {
        row, seat := reservation[0], reservation[1]
        if rowSeats[row] == nil {
            rowSeats[row] = make(map[int]bool)
        }
        rowSeats[row][seat] = true
    }
    
    ans := (n - len(rowSeats)) * 2
    
    option1 := map[int]bool{2: true, 3: true, 4: true, 5: true}
    option2 := map[int]bool{6: true, 7: true, 8: true, 9: true}
    option3 := map[int]bool{4: true, 5: true, 6: true, 7: true}
    
    for _, seats := range rowSeats {
        available := 0
        
        disjoint1 := true
        for seat := range option1 {
            if seats[seat] {
                disjoint1 = false
                break
            }
        }
        if disjoint1 {
            available++
        }
        
        disjoint2 := true
        for seat := range option2 {
            if seats[seat] {
                disjoint2 = false
                break
            }
        }
        if disjoint2 {
            available++
        }
        
        disjoint3 := true
        for seat := range option3 {
            if seats[seat] {
                disjoint3 = false
                break
            }
        }
        if disjoint3 && available < 1 {
            available = 1
        }
        
        ans += available
    }
    
    return ans
}
