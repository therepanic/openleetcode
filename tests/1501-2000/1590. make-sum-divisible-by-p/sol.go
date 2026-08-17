func minSubarray(nums []int, p int) int {
    total := 0
    for _, num := range nums {
        total += num
    }
    target := total % p
    if target == 0 {
        return 0
    }

    mp := map[int]int{0: -1}
    prefix := 0
    res := len(nums)

    for i, x := range nums {
        prefix = (prefix + x) % p
        need := (prefix - target + p) % p

        if idx, ok := mp[need]; ok {
            if i - idx < res {
                res = i - idx
            }
        }

        mp[prefix] = i
    }

    if res == len(nums) {
        return -1
    }
    return res
}
