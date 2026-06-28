func findLength(nums1 []int, nums2 []int) int {
    const P = 113
    const MOD = 1_000_000_007
    Pinv := modPow(P, MOD-2, MOD)

    check := func(guess int) bool {
        if guess == 0 {
            return true
        }

        type pair struct {
            idx   int
            slice []int
        }
        hashes := make(map[int64][]int)

        // nums1
        var h int64 = 0
        var power int64 = 1
        for i, x := range nums1 {
            h = (h + int64(x)*power) % MOD
            if i < guess-1 {
                power = (power * P) % MOD
            } else {
                start := i - (guess - 1)
                hashes[h] = append(hashes[h], start)
                h = (h - int64(nums1[start]) + MOD) * Pinv % MOD
            }
        }

        // nums2
        h = 0
        power = 1
        for i, x := range nums2 {
            h = (h + int64(x)*power) % MOD
            if i < guess-1 {
                power = (power * P) % MOD
            } else {
                start := i - (guess - 1)
                if idxs, ok := hashes[h]; ok {
                    for _, idx := range idxs {
                        if sliceEqual(nums1[idx:idx+guess], nums2[start:start+guess]) {
                            return true
                        }
                    }
                }
                h = (h - int64(nums2[start]) + MOD) * Pinv % MOD
            }
        }
        return false
    }

    lo, hi := 0, len(nums1)
    if len(nums2) < hi {
        hi = len(nums2)
    }
    hi++

    for lo < hi {
        mi := (lo + hi) / 2
        if check(mi) {
            lo = mi + 1
        } else {
            hi = mi
        }
    }
    return lo - 1
}

func sliceEqual(a, b []int) bool {
    if len(a) != len(b) {
        return false
    }
    for i := range a {
        if a[i] != b[i] {
            return false
        }
    }
    return true
}

func modPow(base, exp, mod int64) int64 {
    result := int64(1)
    b := base % mod
    e := exp
    for e > 0 {
        if e&1 == 1 {
            result = (result * b) % mod
        }
        b = (b * b) % mod
        e >>= 1
    }
    return result
}
