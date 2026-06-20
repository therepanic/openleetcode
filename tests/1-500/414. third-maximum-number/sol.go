func thirdMax(nums []int) int {
    var first, second, third *int
    for _, num := range nums {
        n := num
        if (first != nil && n == *first) || 
           (second != nil && n == *second) || 
           (third != nil && n == *third) {
            continue
        }
        if first == nil || n > *first {
            third = second
            second = first
            first = &n
        } else if second == nil || n > *second {
            third = second
            second = &n
        } else if third == nil || n > *third {
            third = &n
        }
    }
    if third != nil {
        return *third
    }
    return *first
}
