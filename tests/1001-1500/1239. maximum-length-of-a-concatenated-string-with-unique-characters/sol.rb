# @param {String[]} arr
# @return {Integer}
def max_length(arr)
    n = arr.length
    @ans = 0

    dfs = lambda do |i, path|
        @ans = [@ans, path.length].max
        (i...n).each do |j|
            s = arr[j]
            next if s.chars.uniq.length != s.length || (path.chars & s.chars).any?
            dfs.call(j + 1, path + s)
        end
    end

    dfs.call(0, "")
    @ans
end
