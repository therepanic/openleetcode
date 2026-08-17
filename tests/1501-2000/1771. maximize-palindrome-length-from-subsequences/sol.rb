# @param {String} word1
# @param {String} word2
# @return {Integer}
def longest_palindrome(word1, word2)
    bytes = (word1 + word2).bytes
    n = bytes.length
    
    memo = Array.new(n) { Array.new(n, -1) }
    fn = lambda do |lo, hi|
        return memo[lo][hi] if memo[lo][hi] != -1
        if lo >= hi
            memo[lo][hi] = (lo == hi ? 1 : 0)
        elsif bytes[lo] == bytes[hi]
            memo[lo][hi] = 2 + fn.call(lo+1, hi-1)
        else
            memo[lo][hi] = [fn.call(lo+1, hi), fn.call(lo, hi-1)].max
        end
        memo[lo][hi]
    end
    
    ans = 0
    word1.bytes.uniq.each do |x|
        i = word1.bytes.index(x)
        j = word2.bytes.rindex(x)
        if !i.nil? && !j.nil?
            ans = [ans, fn.call(i, j + word1.bytes.length)].max
        end
    end
    ans
end
