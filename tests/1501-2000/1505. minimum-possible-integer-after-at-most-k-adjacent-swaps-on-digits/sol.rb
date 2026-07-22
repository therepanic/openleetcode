# @param {String} num
# @param {Integer} k
# @return {String}
def min_integer(num, k)
    n = num.length
    dict = Hash.new { |h, key| h[key] = [] }
    num.each_char.with_index { |ch, i| dict[ch] << i }

    bit = Array.new(n + 1, 0)

    define_method(:update) do |i, val|
        while i < bit.length
            bit[i] += val
            i += i & -i
        end
    end

    define_method(:query) do |i|
        total = 0
        while i > 0
            total += bit[i]
            i -= i & -i
        end
        total
    end

    (1..n).each { |i| update(i, 1) }

    res = ""
    n.times do
        "0123456789".each_char do |v|
            unless dict[v].empty?
                idx = dict[v].first
                cnt = query(idx)
                if cnt <= k
                    dict[v].shift
                    k -= cnt
                    res << v
                    update(idx + 1, -1)
                    break
                end
            end
        end
    end
    res
end
