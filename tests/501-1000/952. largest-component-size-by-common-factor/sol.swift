class Solution {
    func largestComponentSize(_ nums: [Int]) -> Int {
        let n = nums.count
        var root = Array(0..<n)
        var rank = Array(repeating: 1, count: n)

        func find(_ x: Int) -> Int {
            var cur = x
            while root[cur] != cur {
                root[cur] = root[root[cur]]
                cur = root[cur]
            }
            return cur
        }

        func union(_ x: Int, _ y: Int) {
            let rx = find(x)
            let ry = find(y)
            if rx == ry { return }
            if rank[rx] > rank[ry] {
                root[ry] = rx
            } else if rank[rx] < rank[ry] {
                root[rx] = ry
            } else {
                root[ry] = rx
                rank[rx] += 1
            }
        }

        func getPrimeFactors(_ num: Int) -> [Int] {
            var res = [Int]()
            var n = num
            if n % 2 == 0 {
                res.append(2)
                while n % 2 == 0 { n /= 2 }
            }
            var i = 3
            while i * i <= n {
                if n % i == 0 {
                    res.append(i)
                    while n % i == 0 { n /= i }
                }
                i += 2
            }
            if n > 2 { res.append(n) }
            return res
        }

        var primeToIdx = [Int: Int]()
        for i in 0..<n {
            let primes = getPrimeFactors(nums[i])
            for p in primes {
                if let prev = primeToIdx[p] {
                    union(prev, i)
                }
                primeToIdx[p] = i
            }
        }

        var count = [Int: Int]()
        var maxSize = 0
        for i in 0..<n {
            let r = find(i)
            count[r, default: 0] += 1
            if count[r]! > maxSize {
                maxSize = count[r]!
            }
        }
        return maxSize
    }
}
