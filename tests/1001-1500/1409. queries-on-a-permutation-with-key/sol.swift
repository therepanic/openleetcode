class Solution {
    func processQueries(_ queries: [Int], _ m: Int) -> [Int] {
        var ans: [Int] = []
        var arr = Array(1...m)
        for x in queries {
            let idx = arr.firstIndex(of: x)!
            ans.append(idx)
            arr.remove(at: idx)
            arr.insert(x, at: 0)
        }
        return ans
    }
}
