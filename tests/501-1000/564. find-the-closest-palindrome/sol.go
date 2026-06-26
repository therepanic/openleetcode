import (
	"strconv"
)

func nearestPalindromic(n string) string {
	num, _ := strconv.ParseInt(n, 10, 64)

	pow10 := func(exp int) int64 {
		res := int64(1)
		for i := 0; i < exp; i++ {
			res *= 10
		}
		return res
	}

	reverse := func(s string) string {
		b := []byte(s)
		for l, r := 0, len(b)-1; l < r; l, r = l+1, r-1 {
			b[l], b[r] = b[r], b[l]
		}
		return string(b)
	}

	makePal := func(prefix int64) int64 {
		left := strconv.FormatInt(prefix, 10)
		pal := left
		if len(n)%2 == 0 {
			pal += reverse(left)
		} else {
			pal += reverse(left[:len(left)-1])
		}
		val, _ := strconv.ParseInt(pal, 10, 64)
		return val
	}

	candidates := map[int64]struct{}{}
	candidates[pow10(len(n)-1)-1] = struct{}{}
	candidates[pow10(len(n))+1] = struct{}{}

	prefixLen := (len(n) + 1) / 2
	prefix, _ := strconv.ParseInt(n[:prefixLen], 10, 64)
	for delta := int64(-1); delta <= 1; delta++ {
		if prefix+delta >= 0 {
			candidates[makePal(prefix+delta)] = struct{}{}
		}
	}

	best := int64(0)
	bestSet := false
	for cand := range candidates {
		if cand == num {
			continue
		}
		if !bestSet || abs(cand-num) < abs(best-num) || (abs(cand-num) == abs(best-num) && cand < best) {
			best = cand
			bestSet = true
		}
	}

	return strconv.FormatInt(best, 10)
}

func abs(x int64) int64 {
    if x < 0 {
        return -x
    }
    return x
}
