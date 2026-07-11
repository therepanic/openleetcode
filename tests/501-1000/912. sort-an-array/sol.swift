class Solution {
    private func merge(_ nums: inout [Int], _ l: Int, _ mid: Int, _ r: Int) {
        var a = [Int]()
        var b = [Int]()
        for i in l...mid {
            a.append(nums[i])
        }
        for j in (mid + 1)...r {
            b.append(nums[j])
        }
        var i = 0, j = 0, k = l
        while k <= r {
            if j == b.count {
                nums[k] = a[i]
                i += 1
            } else if i == a.count {
                nums[k] = b[j]
                j += 1
            } else if a[i] <= b[j] {
                nums[k] = a[i]
                i += 1
            } else {
                nums[k] = b[j]
                j += 1
            }
            k += 1
        }
    }

    private func mergesort(_ nums: inout [Int], _ l: Int, _ r: Int) {
        if l >= r { return }
        let mid = (l + r) / 2
        mergesort(&nums, l, mid)
        mergesort(&nums, mid + 1, r)
        merge(&nums, l, mid, r)
    }

    func sortArray(_ nums: [Int]) -> [Int] {
        var nums = nums
        mergesort(&nums, 0, nums.count - 1)
        return nums
    }
}
