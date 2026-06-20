class Solution {
    func find132pattern(_ nums: [Int]) -> Bool {
        var st: [[Int]] = []
        var cur_min = nums[0]

        for n in nums[1...] {
            while !st.isEmpty && n >= st.last![0] {
                st.removeLast()
            }
            
            if !st.isEmpty && n > st.last![1] {
                return true
            }
            
            st.append([n, cur_min])
            cur_min = min(cur_min, n)
        }
        
        return false
    }
}
