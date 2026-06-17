func increasingTriplet(nums []int) bool {
    a := int(^uint(0) >> 1)
    b := int(^uint(0) >> 1)
    f := false
    for _, x := range nums {
        if x <= a {
            a = x
        } else if x <= b {
            b = x
        } else {
            f = true
        }
    }
    return f
}
