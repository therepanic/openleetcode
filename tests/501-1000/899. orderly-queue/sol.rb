# @param {String} s
# @param {Integer} k
# @return {String}
def orderly_queue(s, k)
    if k > 1
        return s.chars.sort.join
    end
    
    res = s
    (0...s.length).each do |i|
        s = s[1..-1] + s[0]
        res = [res, s].min
    end
    
    res
end
