# @param {Integer[]} data
# @return {Boolean}
def valid_utf8(data)
    i = 0
    while i < data.length
        b = data[i]
        if b >> 7 == 0
            i += 1
        elsif b >> 5 == 0b110
            return false if i + 1 >= data.length
            return false if data[i+1] >> 6 != 0b10
            i += 2
        elsif b >> 4 == 0b1110
            return false if i + 2 >= data.length
            return false if data[i+1] >> 6 != 0b10 || data[i+2] >> 6 != 0b10
            i += 3
        elsif b >> 3 == 0b11110
            return false if i + 3 >= data.length
            return false if data[i+1] >> 6 != 0b10 || data[i+2] >> 6 != 0b10 || data[i+3] >> 6 != 0b10
            i += 4
        else
            return false
        end
    end
    true
end
