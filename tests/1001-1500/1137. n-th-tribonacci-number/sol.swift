class Solution {
    func tribonacci(_ n: Int) -> Int {
        var ft = 0, st = 1, tt = 1
        for _ in 0..<n {
            let frt = ft + st + tt
            ft = st
            st = tt
            tt = frt
        }
        return ft
    }
}
