func numberOfSubarrays(nums []int, k int) int {
    count := map[int]int{0: 1}
    odd := 0
    answer := 0
    for _, value := range nums {
        odd += value % 2
        answer += count[odd - k]
        count[odd]++
    }
    return answer
}
