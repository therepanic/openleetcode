# @param {String} s1
# @param {String} s2
# @return {Integer}
def k_similarity(s1, s2)
    queue = [s1]
    seen = {}
    answ = 0
    
    while !queue.empty?
        queue.size.times do
            string = queue.shift
            return answ if string == s2
            
            i = 0
            while string[i] == s2[i]
                i += 1
            end
            
            (i + 1...string.length).each do |j|
                if string[i] == s2[j] && s2[j] != s1[j]
                    new_str = string[0...i] + string[j] + string[i+1...j] + string[i] + string[j+1..-1]
                    unless seen[new_str]
                        seen[new_str] = true
                        queue << new_str
                    end
                end
            end
        end
        answ += 1
    end
end
