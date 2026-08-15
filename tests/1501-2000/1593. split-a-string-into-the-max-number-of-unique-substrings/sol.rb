# @param {String} s
# @return {Integer}
def max_unique_split(s)
    used = {}
    ans = [0]
    
    backtrack = lambda do |index|
        if index == s.length
            ans[0] = [ans[0], used.length].max
            return
        end
        (index...s.length).each do |j|
            curr = s[index..j]
            next if used.key?(curr)
            used[curr] = true
            backtrack.call(j + 1)
            used.delete(curr)
        end
    end
    
    backtrack.call(0)
    ans[0]
end
