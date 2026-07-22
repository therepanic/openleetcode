# @param {String} s
# @param {Integer[][]} queries
# @return {Boolean[]}
def can_make_pali_queries(s, queries)
    n = s.length
    prefix = Array.new(n + 1, 0)
    
    (0...n).each do |i|
        bit = 1 << (s[i].ord - 'a'.ord)
        prefix[i + 1] = prefix[i] ^ bit
    end
    
    res = []
    
    queries.each do |left, right, ki|
        mask = prefix[right + 1] ^ prefix[left]
        odd_count = mask.to_s(2).count('1')
        
        if odd_count <= 1 || ki >= odd_count / 2
            res << true
        else
            res << false
        end
    end
    
    res
end
