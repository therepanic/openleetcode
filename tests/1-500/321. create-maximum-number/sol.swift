class Solution {
    func maxNumber(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [Int] {
        var ans = [Int]()
        let m = nums1.count, n = nums2.count
        let start = max(0, k - n)
        let end = min(m, k)
        for i in start...end {
            let sub1 = getMaxSubsequence(nums1, i)
            let sub2 = getMaxSubsequence(nums2, k - i)
            let merged = merge(sub1, sub2)
            if greater(merged, 0, ans, 0) {
                ans = merged
            }
        }
        return ans
    }

    private func getMaxSubsequence(_ nums: [Int], _ q: Int) -> [Int] {
        var stack = [Int]()
        var maxDrop = nums.count - q
        for num in nums {
            while maxDrop > 0 && !stack.isEmpty && stack.last! < num {
                stack.removeLast()
                maxDrop -= 1
            }
            if stack.count < q {
                stack.append(num)
            } else {
                maxDrop -= 1
            }
        }
        return stack
    }

    private func merge(_ a: [Int], _ b: [Int]) -> [Int] {
        var output = [Int]()
        var i = 0, j = 0
        while i < a.count || j < b.count {
            if greater(a, i, b, j) {
                output.append(a[i])
                i += 1
            } else {
                output.append(b[j])
                j += 1
            }
        }
        return output
    }

    private func greater(_ a: [Int], _ i: Int, _ b: [Int], _ j: Int) -> Bool {
        var idx1 = i, idx2 = j
        while idx1 < a.count && idx2 < b.count && a[idx1] == b[idx2] {
            idx1 += 1
            idx2 += 1
        }
        return idx2 == b.count || (idx1 < a.count && a[idx1] > b[idx2])
    }
}
