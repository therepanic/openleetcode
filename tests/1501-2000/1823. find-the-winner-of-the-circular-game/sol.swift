class Solution {
    func findTheWinner(_ n: Int, _ k: Int) -> Int {
        if n == 1 { return 1 }
        var res = 0
        for i in 2...n {
            res = (res + k) % i
        }
        return res + 1
    }
}
