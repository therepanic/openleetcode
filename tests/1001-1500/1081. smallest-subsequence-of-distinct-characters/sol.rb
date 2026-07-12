# @param {String} s
# @return {String}
def smallest_subsequence(s)
    fq_map = {}
    stack = []
    visited = Set.new
    s.each_char { |ch| fq_map[ch] = (fq_map[ch] or 0) + 1 }
    s.each_char do |ch|
        fq_map[ch] -= 1
        next if visited.include?(ch)
        while !stack.empty? && ch < stack.last && fq_map[stack.last] > 0
            visited.delete(stack.pop)
        end
        visited.add(ch)
        stack.push(ch)
    end
    stack.join
end
