class Solution {
    func twoEggDrop(_ n: Int) -> Int {
        var l = 1, r = n, res = 0
        while l <= r {
            let moves = (l + r) / 2
            if (1 + moves) * moves / 2 >= n {
                res = moves
                r = moves - 1
            } else {
                l = moves + 1
            }
        }
        return res
    }
}
