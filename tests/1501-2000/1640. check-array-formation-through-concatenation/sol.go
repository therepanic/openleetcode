func canFormArray(arr []int, pieces [][]int) bool {
    a := []int{}
    remaining := make([][]int, len(pieces))
    copy(remaining, pieces)
    for _, i := range arr {
        for j, piece := range remaining {
            if contains(piece, i) {
                a = append(a, piece...)
                remaining = append(remaining[:j], remaining[j+1:]...)
                break
            }
        }
    }
    if len(a) != len(arr) {
        return false
    }
    for idx, val := range a {
        if val != arr[idx] {
            return false
        }
    }
    return true
}

func contains(slice []int, val int) bool {
    for _, v := range slice {
        if v == val {
            return true
        }
    }
    return false
}
