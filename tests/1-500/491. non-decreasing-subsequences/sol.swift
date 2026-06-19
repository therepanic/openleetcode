class Solution {
    func findSubsequences(_ nums: [Int]) -> [[Int]] {
        var result = Set<[Int]>()
        
        func backtrack(_ index: Int, _ path: [Int]) {
            if path.count >= 2 {
                result.insert(path)
            }
            for i in index..<nums.count {
                if path.isEmpty || nums[i] >= path.last! {
                    backtrack(i + 1, path + [nums[i]])
                }
            }
        }
        
        backtrack(0, [])
        return Array(result)
    }
}
