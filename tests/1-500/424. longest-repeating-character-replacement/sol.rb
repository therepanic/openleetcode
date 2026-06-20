# @param {String} s
# @param {Integer} k
# @return {Integer}
def character_replacement(s, k)
    max_count = 0
    left = 0
    freq = Hash.new(0)
    
    (0...s.length).each do |right|
        freq[s[right]] += 1
        max_count = [max_count, freq[s[right]]].max
        
        if right - left + 1 - max_count > k
            freq[s[left]] -= 1
            left += 1
        end
    end
    
    s.length - left
end
