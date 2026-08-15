class Solution {
    func maxSumMinProduct(_ nums: [Int]) -> Int {
        let n = nums.count
        var prefix = [Int](repeating: 0, count: n + 1)
        for i in 0..<n {
            prefix[i+1] = prefix[i] + nums[i]
        }
        
        var leftBound = [Int](repeating: -1, count: n)
        var rightBound = [Int](repeating: n, count: n)
        var stack: [Int] = []
        for i in 0..<n {
            while !stack.isEmpty && nums[stack.last!] > nums[i] {
                rightBound[stack.removeLast()] = i
            }
            stack.append(i)
        }
        stack.removeAll()
        for i in stride(from: n-1, through: 0, by: -1) {
            while !stack.isEmpty && nums[stack.last!] > nums[i] {
                leftBound[stack.removeLast()] = i
            }
            stack.append(i)
        }
        
        var maxProd = 0
        for i in 0..<n {
            let l = leftBound[i], r = rightBound[i]
            let total = prefix[r] - prefix[l+1]
            maxProd = max(maxProd, nums[i] * total)
        }
        return maxProd % 1000000007
    }
}
