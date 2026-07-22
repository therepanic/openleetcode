func kConcatenationMaxSum(arr []int, k int) int {
    const MOD = 1000000007
    
    kadanes := func(nums []int) int64 {
        var best int64 = 0
        var total int64 = 0
        for _, x := range nums {
            total += int64(x)
            if total < 0 {
                total = 0
            }
            if total > best {
                best = total
            }
        }
        return best
    }
    
    if k <= 3 {
        extended := make([]int, len(arr)*k)
        for i := range extended {
            extended[i] = arr[i%len(arr)]
        }
        return int(kadanes(extended) % MOD)
    }
    
    var sum int64 = 0
    for _, x := range arr {
        sum += int64(x)
    }
    s := int64(0)
    if sum > 0 {
        s = (sum * int64(k-1)) % MOD
    }
    
    doubleArr := make([]int, len(arr)*2)
    for i := range doubleArr {
        doubleArr[i] = arr[i%len(arr)]
    }
    
    v1 := s + kadanes(arr)
    v2 := kadanes(doubleArr)
    if v1 > v2 {
        return int(v1 % MOD)
    }
    return int(v2 % MOD)
}
