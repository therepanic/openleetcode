def modify_string(s)
    s = s.chars
    n = s.length
    (0...n).each do |i|
        if s[i] == '?'
            left = i > 0 ? s[i-1] : ' '
            right = i+1 < n ? s[i+1] : ' '
            if left != 'a' && right != 'a'
                s[i] = 'a'
            elsif left != 'b' && right != 'b'
                s[i] = 'b'
            else
                s[i] = 'c'
            end
        end
    end
    s.join
end
