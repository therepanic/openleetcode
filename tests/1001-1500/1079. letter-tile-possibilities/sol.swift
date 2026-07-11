class Solution {
    func numTilePossibilities(_ tiles: String) -> Int {
        let arr = tiles.sorted()
        var used = Array(repeating: false, count: arr.count)
        return backtrack(Array(arr), &used)
    }
    
    private func backtrack(_ tiles: [Character], _ used: inout [Bool]) -> Int {
        var count = 0
        for i in 0..<tiles.count {
            if used[i] || (i > 0 && tiles[i] == tiles[i - 1] && !used[i - 1]) {
                continue
            }
            used[i] = true
            count += 1 + backtrack(tiles, &used)
            used[i] = false
        }
        return count
    }
}
