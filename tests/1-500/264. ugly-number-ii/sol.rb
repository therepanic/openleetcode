# @param {Integer} n
# @return {Integer}
def nth_ugly_number(n)
    h = [1]
    i = j = k = 0

    (n - 1).times do
        m = [h[i] * 2, h[j] * 3, h[k] * 5].min
        h << m

        i += 1 if m == h[i] * 2
        j += 1 if m == h[j] * 3
        k += 1 if m == h[k] * 5
    end

    h[-1]
end
