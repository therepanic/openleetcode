class Solution {
    private var nums: [Int] = []
    private var ans: [[Int]] = []
    
    func createSortedArray(_ instructions: [Int]) -> Int {
        let n = instructions.count
        nums = instructions
        ans = Array(repeating: [0, 0], count: n)
        
        let arr = Array(0..<n)
        _ = split(0, n - 1, arr)
        
        var realAns = 0
        for i in 0..<n {
            realAns += min(ans[i][0], ans[i][1])
        }
        return realAns % 1000000007
    }
    
    private func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var l = left.count - 1
        var r = right.count - 1
        while l > -1 && r > -1 {
            if nums[left[l]] <= nums[right[r]] {
                ans[right[r]][1] += (left.count - 1) - l
                r -= 1
            } else {
                l -= 1
            }
        }
        while r > -1 {
            ans[right[r]][1] += left.count
            r -= 1
        }
        
        l = 0
        r = 0
        var res: [Int] = []
        while l < left.count && r < right.count {
            if nums[left[l]] < nums[right[r]] {
                res.append(left[l])
                l += 1
            } else {
                ans[right[r]][0] += l
                res.append(right[r])
                r += 1
            }
        }
        while r < right.count {
            ans[right[r]][0] += l
            res.append(right[r])
            r += 1
        }
        res.append(contentsOf: left[l...])
        return res
    }
    
    private func split(_ l: Int, _ r: Int, _ arr: [Int]) -> [Int] {
        if l == r {
            return [arr[r]]
        }
        let mid = (l + r) / 2
        let left = split(l, mid, arr)
        let right = split(mid + 1, r, arr)
        return merge(left, right)
    }
}
