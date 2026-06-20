func majorityElement(nums []int) []int {
    majority1, majority2 := 0, 0
    count1, count2 := 0, 0

    for _, num := range nums {
        if num == majority1 {
            count1++
        } else if num == majority2 {
            count2++
        } else if count1 == 0 {
            majority1 = num
            count1 = 1
        } else if count2 == 0 {
            majority2 = num
            count2 = 1
        } else {
            count1--
            count2--
        }
    }

    count1, count2 = 0, 0

    for _, num := range nums {
        if num == majority1 {
            count1++
        } else if num == majority2 {
            count2++
        }
    }

    res := []int{}
    if count1 > len(nums)/3 {
        res = append(res, majority1)
    }
    if count2 > len(nums)/3 {
        res = append(res, majority2)
    }

    return res
}
