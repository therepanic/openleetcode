class Solution {
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        var st = [Int]()
        var j = 0
        for x in pushed {
            st.append(x)
            while !st.isEmpty && j < popped.count && st.last! == popped[j] {
                st.removeLast()
                j += 1
            }
        }
        return j == popped.count
    }
}
