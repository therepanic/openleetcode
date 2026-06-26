# @param {String} n
# @return {String}
def nearest_palindromic(n)
    n_int = n.to_i
    def convert(num)
        s = num.to_s
        len = s.length
        chars = s.chars
        l = 0
        r = len - 1
        while l <= r
            chars[r] = chars[l]
            r -= 1
            l += 1
        end
        chars.join.to_i
    end
    def prev_pal(num)
        low = 0
        high = 10**19
        ans = -1
        while low <= high
            mid = (low + high) >> 1
            val = convert(mid)
            if val >= num
                high = mid - 1
            else
                low = mid + 1
                ans = val
            end
        end
        ans
    end
    def next_pal(num)
        low = 0
        high = 10**19
        ans = -1
        while low <= high
            mid = (low + high) >> 1
            val = convert(mid)
            if val <= num
                low = mid + 1
            else
                ans = val
                high = mid - 1
            end
        end
        ans
    end
    v1 = prev_pal(n_int)
    v2 = next_pal(n_int)
    if (v1 - n_int).abs > (v2 - n_int).abs
        return v2.to_s
    else
        return v1.to_s
    end
end
