class Solution {
    func numSubmat(_ mat: [[Int]]) -> Int {
        let r = mat.count
        let c = mat[0].count
        var h = Array(repeating: 0, count: c)
        var ans = 0
        
        for i in 0..<r {
            for j in 0..<c {
                h[j] = mat[i][j] == 1 ? h[j] + 1 : 0
            }
            
            var sumv = Array(repeating: 0, count: c)
            var st = [Int]()
            
            for j in 0..<c {
                while !st.isEmpty && h[st.last!] >= h[j] {
                    st.removeLast()
                }
                
                if let p = st.last {
                    sumv[j] = sumv[p] + h[j] * (j - p)
                } else {
                    sumv[j] = h[j] * (j + 1)
                }
                
                st.append(j)
                ans += sumv[j]
            }
        }
        
        return ans
    }
}
