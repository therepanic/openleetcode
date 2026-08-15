func countKDifference(nums []int, k int) int {
    c := make(map[int]int)
    for _, num := range nums {
        c[num]++
    }
    ans := 0
    for x, cnt := range c {
        ans += cnt * c[x+k]
    }
    return ans
}
