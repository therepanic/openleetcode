# @param {Integer} n
# @return {Integer}
def count_arrangement(n)
    memo = {}
    dfs = lambda do |index, mask|
        return 1 if index > n
        key = [index, mask]
        return memo[key] if memo.key?(key)
        total = 0
        (1..n).each do |value|
            bit = 1 << (value - 1)
            next unless (mask & bit).zero?
            next unless value % index == 0 || index % value == 0
            total += dfs.call(index + 1, mask | bit)
        end
        memo[key] = total
    end

    dfs.call(1, 0)
end
