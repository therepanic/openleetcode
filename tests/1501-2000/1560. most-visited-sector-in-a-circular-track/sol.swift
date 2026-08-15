class Solution {
    func mostVisited(_ n: Int, _ rounds: [Int]) -> [Int] {
        let s = rounds[0]
        let e = rounds[rounds.count - 1]
        if s <= e {
            return Array(s...e)
        } else {
            return Array(1...e) + Array(s...n)
        }
    }
}
