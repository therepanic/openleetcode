class Solution {
    func totalMoney(_ n: Int) -> Int {
        let q = n / 7
        let r = n % 7
        return arithmeticProgression(28, 28+(q-1)*7, q) + arithmeticProgression(q+1, q+r, r)
    }
    private func arithmeticProgression(_ leading: Int, _ last: Int, _ terms: Int) -> Int {
        return (leading+last)*terms/2
    }
}
