func maxValueAfterReverse(nums []int) int {
    if len(nums) < 2 {
        return 0
    }
    
    maxMin := -1 << 31
    minMin := 1<<31 - 1
    S := 0
    boundary := -1 << 31
    
    for i := 0; i < len(nums)-1; i++ {
        a := nums[i]
        b := nums[i+1]
        distance := abs(a - b)
        boundary = max(boundary, max(abs(nums[len(nums)-1]-a), abs(nums[0]-b))-distance)
        S += distance
        minMin = min(max(a, b), minMin)
        maxMin = max(min(a, b), maxMin)
    }
    
    return S + max(2*(maxMin-minMin), boundary)
}

func abs(x int) int {
    if x < 0 {
        return -x
    }
    return x
}
