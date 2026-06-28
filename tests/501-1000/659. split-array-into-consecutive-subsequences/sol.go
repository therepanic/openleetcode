func isPossible(nums []int) bool {
    count := make(map[int]int)
    subseq := make(map[int]int)

    for _, num := range nums {
        count[num]++
    }

    for _, num := range nums {
        if count[num] == 0 {
            continue
        }
        if subseq[num-1] > 0 {
            subseq[num-1]--
            subseq[num]++
        } else if count[num+1] > 0 && count[num+2] > 0 {
            count[num+1]--
            count[num+2]--
            subseq[num+2]++
        } else {
            return false
        }
        count[num]--
    }

    return true
}
