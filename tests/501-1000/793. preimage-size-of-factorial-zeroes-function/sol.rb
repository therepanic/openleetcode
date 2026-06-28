# @param {Integer} k
# @return {Integer}
def preimage_size_fzf(k)
    trailing_zeroes = ->(n) {
        count = 0
        power = 5
        while power <= n
            count += n / power
            power *= 5
        end
        count
    }
    
    start = k * 4
    loop do
        h = trailing_zeroes.call(start)
        if h == k
            return 5
        end
        if h > k
            break
        end
        start += 1
    end
    return 0
end
