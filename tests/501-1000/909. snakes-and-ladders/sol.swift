class Solution {
    func snakesAndLadders(_ board: [[Int]]) -> Int {
        let n = board.count
        var minRolls = [Int](repeating: -1, count: n * n + 1)
        var q = [1]
        minRolls[1] = 0

        while !q.isEmpty {
            let x = q.removeFirst()
            for i in 1...6 {
                let t = x + i
                if t > n * n { break }
                let row = (t - 1) / n
                let col = (t - 1) % n
                let r = n - 1 - row
                let c = (row % 2 == 1) ? (n - 1 - col) : col
                let v = board[r][c]
                let y = v > 0 ? v : t
                if y == n * n { return minRolls[x] + 1 }
                if minRolls[y] == -1 {
                    minRolls[y] = minRolls[x] + 1
                    q.append(y)
                }
            }
        }
        return -1
    }
}
