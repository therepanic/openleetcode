class Solution {
    private static let MOD = 1000000007
    private static var isPrime: [Bool] = []
    private static var prefixPrime: [Int] = []
    private static var initialized = false
    
    private static func setup() {
        if initialized { return }
        isPrime = Array(repeating: true, count: 101)
        prefixPrime = Array(repeating: 0, count: 101)
        isPrime[0] = false
        isPrime[1] = false
        
        var i = 2
        while i * i <= 100 {
            if isPrime[i] {
                var j = i * i
                while j <= 100 {
                    isPrime[j] = false
                    j += i
                }
            }
            i += 1
        }
        
        for i in 2...100 {
            prefixPrime[i] = prefixPrime[i - 1] + (isPrime[i] ? 1 : 0)
        }
        initialized = true
    }
    
    func numPrimeArrangements(_ n: Int) -> Int {
        Solution.setup()
        let x = Solution.prefixPrime[n]
        let y = n - x
        var proX = 1
        var proY = 1
        
        if x >= 2 {
            for i in 2...x {
                proX = (proX * i) % Solution.MOD
            }
        }
        if y >= 2 {
            for i in 2...y {
                proY = (proY * i) % Solution.MOD
            }
        }
        
        return (proX * proY) % Solution.MOD
    }
}
