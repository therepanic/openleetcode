# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
    return false if s.length != t.length
    
    arr = Array.new(26, 0)
    
    (0...s.length).each do |i|
        arr[s[i].ord - 'a'.ord] += 1
        arr[t[i].ord - 'a'.ord] -= 1
    end
    
    arr.each do |check|
        return false if check != 0
    end
    
    true
end
