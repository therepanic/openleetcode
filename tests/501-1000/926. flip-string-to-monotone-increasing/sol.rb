# @param {String} s
# @return {Integer}
def min_flips_mono_incr(s)
    zeroes = 0
    ones = 0
    
    s.each_char do |ch|
        if ch == '0'
            zeroes += 1
        end
    end
    
    output = zeroes
    
    s.each_char do |ch|
        if ch == '0'
            zeroes -= 1
        elsif ch == '1'
            ones += 1
        end
        output = [output, zeroes + ones].min
    end
    
    output
end
