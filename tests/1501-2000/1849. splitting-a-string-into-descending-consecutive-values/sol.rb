# @param {String} s
# @return {Boolean}
def split_string(s)
    def dfs(index, prev, str)
        return true if index == str.length
        
        curr = 0
        (index...str.length).each do |i|
            curr = curr * 10 + str[i].to_i
            if prev - curr == 1
                return true if dfs(i + 1, curr, str)
            elsif curr >= prev
                break
            end
        end
        false
    end
    
    (0...s.length - 1).each do |i|
        first = s[0..i].to_i
        return true if dfs(i + 1, first, s)
    end
    false
end
