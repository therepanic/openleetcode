class Solution {
    func numberOfUniqueGoodSubsequences(_ binary: String) -> Int {
        var a = 0
        var b = 0
        var z = 0
        let mod = 1000000007
        for c in binary {
            if c == "1" {
                b = (a + b + 1) % mod
            } else {
                a = (a + b) % mod
                z = 1
            }
        }
        return (a + b + z) % mod
    }
}
