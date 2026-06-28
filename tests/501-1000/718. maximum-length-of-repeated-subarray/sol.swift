class Solution {
    func findLength(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let P = 113
        let MOD = 1_000_000_007
        let Pinv = modPow(base: P, exp: MOD - 2, mod: MOD)

        func check(_ guess: Int) -> Bool {
            if guess == 0 { return true }

            var hashes = [Int: [Int]]()

            // nums1
            var h = 0
            var power = 1
            for i in 0..<nums1.count {
                h = (h + nums1[i] * power) % MOD
                if i < guess - 1 {
                    power = (power * P) % MOD
                } else {
                    let start = i - (guess - 1)
                    hashes[h, default: []].append(start)
                    h = (h - nums1[start] + MOD) * Pinv % MOD
                }
            }

            // nums2
            h = 0
            power = 1
            for i in 0..<nums2.count {
                h = (h + nums2[i] * power) % MOD
                if i < guess - 1 {
                    power = (power * P) % MOD
                } else {
                    let start = i - (guess - 1)
                    if let indices = hashes[h] {
                        for idx in indices {
                            if Array(nums1[idx..<idx+guess]) == Array(nums2[start..<start+guess]) {
                                return true
                            }
                        }
                    }
                    h = (h - nums2[start] + MOD) * Pinv % MOD
                }
            }
            return false
        }

        var lo = 0
        var hi = min(nums1.count, nums2.count) + 1
        while lo < hi {
            let mi = (lo + hi) / 2
            if check(mi) {
                lo = mi + 1
            } else {
                hi = mi
            }
        }
        return lo - 1
    }

    private func modPow(base: Int, exp: Int, mod: Int) -> Int {
        var b = base % mod
        var e = exp
        var result = 1
        while e > 0 {
            if e & 1 == 1 { result = (result * b) % mod }
            b = (b * b) % mod
            e >>= 1
        }
        return result
    }
}
