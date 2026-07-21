class Solution {
    func sumFourDivisors(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        let maxNum = nums.max()!
        if maxNum < 2 { return 0 }

        var sieve = [Bool](repeating: true, count: maxNum + 1)
        if maxNum >= 0 { sieve[0] = false }
        if maxNum >= 1 { sieve[1] = false }

        var p = 2
        while p * p <= maxNum {
            if sieve[p] {
                var multiple = p * p
                while multiple <= maxNum {
                    sieve[multiple] = false
                    multiple += p
                }
            }
            p += 1
        }

        var total = 0
        for x in nums {
            // p^3 case
            let p = Int(round(pow(Double(x), 1.0/3.0)))
            if p >= 0 && p <= maxNum && p * p * p == x && sieve[p] {
                total += 1 + p + p * p + x
                continue
            }

            // p * q case
            var i = 2
            while i * i <= x {
                if x % i == 0 {
                    let j = x / i
                    if i != j && i <= maxNum && j <= maxNum && sieve[i] && sieve[j] {
                        total += 1 + i + j + x
                    }
                    break
                }
                i += 1
            }
        }
        return total
    }
}
