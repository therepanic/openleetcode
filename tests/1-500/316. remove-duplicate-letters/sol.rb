# @param {String} s
# @return {String}
def remove_duplicate_letters(s)
    last_occur = {}
    s.each_char.with_index do |char, i|
        last_occur[char] = i
    end
    
    stack = []
    visited = Set.new
    
    s.each_char.with_index do |char, i|
        next if visited.include?(char)
        
        while !stack.empty? && char < stack.last && i < (last_occur[stack.last] || -1)
            visited.delete(stack.pop)
        end
        
        visited.add(char)
        stack.push(char)
    end
    
    stack.join
end
