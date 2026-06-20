class Solution {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        let gSorted = g.sorted()
        let sSorted = s.sorted()
        var i = 0, j = 0, count = 0
        while i < gSorted.count && j < sSorted.count {
            if sSorted[j] >= gSorted[i] {
                count += 1
                i += 1
            }
            j += 1
        }
        return count
    }
}
