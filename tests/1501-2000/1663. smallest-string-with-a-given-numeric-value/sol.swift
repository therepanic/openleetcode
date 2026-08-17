class Solution {
    func getSmallestString(_ n: Int, _ k: Int) -> String {
        var res = [Character](repeating: "a", count: n)
        var kk = k - n

        var i = n - 1
        while kk > 0 {
            let add = min(25, kk)
            res[i] = Character(UnicodeScalar(Int(Character("a").asciiValue!) + add)!)
            kk -= add
            i -= 1
        }

        return String(res)
    }
}
