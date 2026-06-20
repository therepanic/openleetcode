func singleNumber(nums []int) []int {
    x := 0
    for _, n := range nums {
        x ^= n
    }

    bit := x & -x
    a := 0
    b := 0
    for _, n := range nums {
        if n & bit != 0 {
            a ^= n
        } else {
            b ^= n
        }
    }

    return []int{a, b}
}
