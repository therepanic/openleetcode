class Solution {
    func minimumIncompatibility(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        let sz = n / k
        
        var counts: [Int: Int] = [:]
        for num in nums {
            counts[num, default: 0] += 1
        }
        for v in counts.values {
            if v > k {
                return -1
            }
        }
        
        let sortedNums = nums.sorted()
        
        var validSubsets: [Int: Int] = [:]
        for mask in 0..<(1 << n) {
            if mask.nonzeroBitCount == sz {
                var subset: [Int] = []
                for i in 0..<n {
                    if (mask >> i) & 1 == 1 {
                        subset.append(sortedNums[i])
                    }
                }
                if Set(subset).count == sz {
                    validSubsets[mask] = subset.max()! - subset.min()!
                }
            }
        }
        
        var memo: [Int: Int] = [:]
        func solve(_ remainingMask: Int) -> Int {
            if remainingMask == 0 {
                return 0
            }
            if let val = memo[remainingMask] {
                return val
            }
            
            let firstElement = (remainingMask & -remainingMask).trailingZeroBitCount
            var res = Int.max
            
            for (mask, cost) in validSubsets {
                if (mask & remainingMask) == mask && ((mask >> firstElement) & 1) == 1 {
                    let next = solve(remainingMask ^ mask)
                    if next != Int.max {
                        res = min(res, cost + next)
                    }
                }
            }
            
            memo[remainingMask] = res
            return res
        }
        
        let ans = solve((1 << n) - 1)
        return ans == Int.max ? -1 : ans
    }
}
