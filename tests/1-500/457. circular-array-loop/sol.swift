class Solution {
    func circularArrayLoop(_ nums: [Int]) -> Bool {
        var nums = nums
        let n = nums.count
        func nextIndex(_ i: Int) -> Int {
            return ((i + nums[i]) % n + n) % n
        }

        for i in 0..<n {
            var slow = i
            var fast = nextIndex(i)
            while nums[slow] * nums[fast] > 0 && nums[slow] * nums[nextIndex(fast)] > 0 {
                if slow == fast {
                    if slow == nextIndex(slow) {
                        break
                    }
                    return true
                }
                slow = nextIndex(slow)
                fast = nextIndex(nextIndex(fast))
            }
            var j = i
            while nums[j] * nums[nextIndex(j)] > 0 {
                let temp = j
                j = nextIndex(j)
                nums[temp] = 0
            }
        }
        return false
    }
}
