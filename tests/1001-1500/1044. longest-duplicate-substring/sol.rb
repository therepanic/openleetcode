# @param {String} s
# @return {String}
def longest_dup_substring(s)
    n = s.length
    base1, base2 = 131, 31
    mod1, mod2 = 10**9+5, 10**9+7

    build = lambda do |base, mod|
        h = [0] * (n + 1)
        p = [1] * (n + 1)
        (0...n).each do |i|
            h[i+1] = (h[i] * base + s[i].ord) % mod
            p[i+1] = (p[i] * base) % mod
        end
        [h, p]
    end

    get = lambda do |h, p, l, r, mod|
        (h[r] - h[l] * p[r-l]) % mod
    end

    h1, p1 = build.call(base1, mod1)
    h2, p2 = build.call(base2, mod2)

    check = lambda do |len|
        seen = Set.new
        (0..n-len).each do |i|
            x = [get.call(h1, p1, i, i+len, mod1),
                 get.call(h2, p2, i, i+len, mod2)]
            return s[i, len] if seen.include?(x)
            seen.add(x)
        end
        ""
    end

    lo, hi, res = 1, n, ""
    while lo <= hi
        mid = (lo + hi) / 2
        t = check.call(mid)
        if t != ""
            res, lo = t, mid + 1
        else
            hi = mid - 1
        end
    end
    res
end
