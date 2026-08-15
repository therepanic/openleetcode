# @param {Integer[]} deliciousness
# @return {Integer}
def count_pairs(deliciousness)
    mod = 10**9 + 7
    max_val = deliciousness.max || 0
    powers = (0...22).map { |i| 1 << i }
    count = Hash.new(0)
    res = 0

    deliciousness.each do |val|
        powers.each do |target|
            complement = target - val
            res += count[complement] if count.key?(complement)
            res %= mod
        end
        count[val] += 1
    end
    res
end
