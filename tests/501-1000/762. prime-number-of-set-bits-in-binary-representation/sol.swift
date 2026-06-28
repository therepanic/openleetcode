class Solution {
    func countPrimeSetBits(_ left: Int, _ right: Int) -> Int {
        var count = 0
        for i in left...right {
            let setBits = i.nonzeroBitCount
            if isPrime(setBits) {
                count += 1
            }
        }
        return count
    }
    
    private func isPrime(_ n: Int) -> Bool {
        if n <= 1 { return false }
        var i = 2
        while i * i <= n {
            if n % i == 0 { return false }
            i += 1
        }
        return true
    }
}
