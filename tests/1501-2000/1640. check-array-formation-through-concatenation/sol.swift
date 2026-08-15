class Solution {
    func canFormArray(_ arr: [Int], _ pieces: [[Int]]) -> Bool {
        var a: [Int] = []
        var remaining = pieces
        for i in arr {
            for j in 0..<remaining.count {
                if remaining[j].contains(i) {
                    a.append(contentsOf: remaining[j])
                    remaining.remove(at: j)
                    break
                }
            }
        }
        return a == arr
    }
}
