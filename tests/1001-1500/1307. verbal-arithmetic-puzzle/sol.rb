# @param {String[]} words
# @param {String} result
# @return {Boolean}
def is_solvable(words, result)
    zeroes = Set.new
    m = 0
    words.each do |word|
        if word.length > 1
            zeroes.add(word[0])
        end
        m = [m, word.length].max
    end
    if m > result.length
        return false
    end
    d = {}
    (words + [result]).each do |word|
        word.each_char { |c| d[c] = -1 }
    end
    words = words.map { |word| word.reverse }
    result = result.reverse
    r_len = result.length
    n = words.length
    visited = (0..9).to_set

    recursive = lambda do |wi, ri, rem|
        if ri == r_len
            return rem == 0 && (result.length == 1 || d[result[r_len-1]] != 0)
        end
        if wi == n
            if d[result[ri]] != -1
                if d[result[ri]] != rem % 10
                    return false
                else
                    return recursive.call(0, ri+1, rem/10)
                end
            elsif visited.include?(rem % 10)
                val = rem % 10
                visited.delete(val)
                d[result[ri]] = val
                ret = recursive.call(wi, ri, rem)
                d[result[ri]] = -1
                visited.add(val)
                return true if ret
            end
            return false
        end
        if words[wi].length <= ri
            return recursive.call(wi+1, ri, rem)
        end
        if d[words[wi][ri]] != -1
            return recursive.call(wi+1, ri, rem + d[words[wi][ri]])
        end
        (0..9).each do |val|
            if visited.include?(val) && (val != 0 || !zeroes.include?(words[wi][ri]))
                visited.delete(val)
                d[words[wi][ri]] = val
                ret = recursive.call(wi+1, ri, rem + val)
                d[words[wi][ri]] = -1
                visited.add(val)
                return true if ret
            end
        end
        false
    end

    recursive.call(0, 0, 0)
end
