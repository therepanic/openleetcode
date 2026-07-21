# @param {String} s
# @return {Integer}
def balanced_string_split(s)
    bal = 0
    count = 0
    s.each_char do |c|
        if c == 'L'
            bal += 1
        elsif c == 'R'
            bal -= 1
        end
        if bal == 0
            count += 1
        end
    end
    count
end
