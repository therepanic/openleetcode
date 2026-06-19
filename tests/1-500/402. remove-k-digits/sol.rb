def remove_kdigits(num, k)
    s = []
    num.each_char do |c|
        while k > 0 && !s.empty? && s.last > c
            s.pop
            k -= 1
        end
        s.push(c)
    end
    
    s = s[0...s.length - k]
    result = s.join.sub(/^0+/, '')
    result.empty? ? '0' : result
end
