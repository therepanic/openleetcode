class Solution {
    func kthFactor(_ n: Int, _ k: Int) -> Int {
        var ab: [Int] = []
        for i in 1...n {
            if n % i == 0 {
                ab.append(i)
            }
        }
        if ab.count < k {
            return -1
        } else {
            return ab[k - 1]
        }
    }
}
