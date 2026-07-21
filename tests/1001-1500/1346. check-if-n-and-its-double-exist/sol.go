func checkIfExist(arr []int) bool {
    zeroCount := 0
    for _, v := range arr {
        if v == 0 {
            zeroCount++
        }
    }
    if zeroCount >= 2 {
        return true
    }

    for _, i := range arr {
        if i != 0 {
            for _, j := range arr {
                if j == i*2 {
                    return true
                }
            }
        }
    }
    return false
}
