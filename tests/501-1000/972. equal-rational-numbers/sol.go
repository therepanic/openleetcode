func isRationalEqual(s string, t string) bool {
    type frac struct{ num, den int64 }

    abs := func(x int64) int64 {
        if x < 0 {
            return -x
        }
        return x
    }

    gcd := func(a, b int64) int64 {
        a = abs(a)
        b = abs(b)
        for b != 0 {
            a, b = b, a%b
        }
        return a
    }

    pow10 := func(n int) int64 {
        r := int64(1)
        for i := 0; i < n; i++ {
            r *= 10
        }
        return r
    }

    add := func(a, b frac) frac {
        num := a.num*b.den + b.num*a.den
        den := a.den * b.den
        g := gcd(num, den)
        return frac{num / g, den / g}
    }

    parse := func(x string) frac {
        if !strings.Contains(x, ".") {
            n, _ := strconv.ParseInt(x, 10, 64)
            return frac{n, 1}
        }
        parts := strings.SplitN(x, ".", 2)
        integer := parts[0]
        fracStr := parts[1]
        nInt, _ := strconv.ParseInt(integer, 10, 64)
        if !strings.Contains(fracStr, "(") {
            if fracStr == "" {
                return frac{nInt, 1}
            }
            nFrac, _ := strconv.ParseInt(fracStr, 10, 64)
            return add(frac{nInt, 1}, frac{nFrac, pow10(len(fracStr))})
        }
        repParts := strings.SplitN(fracStr, "(", 2)
        nonrep := repParts[0]
        rep := repParts[1][:len(repParts[1])-1]
        base := frac{nInt, 1}
        if nonrep != "" {
            nNonrep, _ := strconv.ParseInt(nonrep, 10, 64)
            base = add(base, frac{nNonrep, pow10(len(nonrep))})
        }
        repeatNum, _ := strconv.ParseInt(rep, 10, 64)
        repeatDen := (pow10(len(rep)) - 1) * pow10(len(nonrep))
        return add(base, frac{repeatNum, repeatDen})
    }

    sF := parse(s)
    tF := parse(t)
    return sF.num*tF.den == tF.num*sF.den
}
