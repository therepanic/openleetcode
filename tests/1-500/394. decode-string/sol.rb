# @param {String} s
# @return {String}
def decode_string(s)
    @i = 0
    decode(s)
end

def decode(s)
    res = ""
    num = 0
    while @i < s.length
        c = s[@i]
        if c =~ /\d/
            num = num * 10 + c.to_i
            @i += 1
        elsif c == '['
            @i += 1
            inner = decode(s)
            res += inner * num
            num = 0
        elsif c == ']'
            @i += 1
            return res
        else
            res += c
            @i += 1
        end
    end
    res
end

def decodeString(s)
    decode_string(s)
end
