class Solution {
    func makeArrayIncreasing(_ arr1: [Int], _ arr2: [Int]) -> Int {
        var arr2 = arr2.sorted()
        var memo = [String: Int]()
        
        func dfs(_ i: Int, _ prevMax: Int) -> Int {
            if i == arr1.count { return 0 }
            
            let key = "\(i),\(prevMax)"
            if let val = memo[key] { return val }
            
            let j = bisectRight(arr2, prevMax)
            
            var ans = Int.max / 2
            if arr1[i] > prevMax {
                ans = min(ans, dfs(i + 1, arr1[i]))
            }
            if j < arr2.count {
                ans = min(ans, dfs(i + 1, arr2[j]) + 1)
            }
            
            memo[key] = ans
            return ans
        }
        
        let ops = dfs(0, Int.min)
        return ops >= Int.max / 2 ? -1 : ops
    }
    
    private func bisectRight(_ arr: [Int], _ target: Int) -> Int {
        var lo = 0, hi = arr.count
        while lo < hi {
            let mid = lo + (hi - lo) / 2
            if arr[mid] <= target {
                lo = mid + 1
            } else {
                hi = mid
            }
        }
        return lo
    }
}
