class Solution {
    func mctFromLeafValues(_ arr: [Int]) -> Int {
        var result = 0
        var st = [Int.max]

        for a in arr {
            while st.last! <= a {
                let mid = st.removeLast()
                result += mid * min(st.last!, a)
            }
            st.append(a)
        }

        var first = st.removeLast()
        while st.count > 1 {
            result += first * st.last!
            first = st.removeLast()
        }

        return result
    }
}
