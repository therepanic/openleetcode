func circularArrayLoop(nums []int) bool {
    n := len(nums)
    nextIndex := func(i int) int {
        return ((i+nums[i])%n + n) % n
    }

    for i := 0; i < n; i++ {
        slow := i
        fast := nextIndex(i)
        for nums[slow]*nums[fast] > 0 && nums[slow]*nums[nextIndex(fast)] > 0 {
            if slow == fast {
                if slow == nextIndex(slow) {
                    break
                }
                return true
            }
            slow = nextIndex(slow)
            fast = nextIndex(nextIndex(fast))
        }
        j := i
        for nums[j]*nums[nextIndex(j)] > 0 {
            temp := j
            j = nextIndex(j)
            nums[temp] = 0
        }
    }
    return false
}
