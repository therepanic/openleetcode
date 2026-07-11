# @param {String} left
# @param {String} right
# @return {Integer}
def superpalindromes_in_range(left, right)
    left = left.to_i
    right = right.to_i
    count = 0
    (1..100000).each do |i|
        s = i.to_s
        val1 = (s + s.reverse).to_i
        val2 = (s + s[0...-1].reverse).to_i
        sqval1 = val1 * val1
        sqval2 = val2 * val2
        if left <= sqval1 && sqval1 <= right
            ssqval1 = sqval1.to_s
            if ssqval1 == ssqval1.reverse
                count += 1
            end
        end
        if left <= sqval2 && sqval2 <= right
            ssqval2 = sqval2.to_s
            if ssqval2 == ssqval2.reverse
                count += 1
            end
        end
        if val2 > right
            break
        end
    end
    return count
end
