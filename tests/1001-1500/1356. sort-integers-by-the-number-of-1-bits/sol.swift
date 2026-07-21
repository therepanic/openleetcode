class Solution {
    func sortByBits(_ arr: [Int]) -> [Int] {
        return arr.sorted {
            let c0 = $0.nonzeroBitCount
            let c1 = $1.nonzeroBitCount
            if c0 != c1 { return c0 < c1 }
            return $0 < $1
        }
    }
}
