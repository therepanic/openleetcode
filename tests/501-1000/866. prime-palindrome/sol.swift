class Solution {
    func primePalindrome(_ n: Int) -> Int {
        func isPrime(_ num: Int) -> Bool {
            if num < 2 { return false }
            if num % 2 == 0 { return num == 2 }
            var i = 3
            while i * i <= num {
                if num % i == 0 { return false }
                i += 2
            }
            return true
        }

        var n = n
        if n >= 8 && n <= 11 { return 11 }

        while true {
            let s = String(n)
            if s.count % 2 == 0 && n > 11 {
                n = Int(pow(10.0, Double(s.count))) + 1
                continue
            }
            if String(s.reversed()) == s && isPrime(n) {
                return n
            }
            n += 1
            if n > 2 && n % 2 == 0 {
                n += 1
            }
        }
    }
}
