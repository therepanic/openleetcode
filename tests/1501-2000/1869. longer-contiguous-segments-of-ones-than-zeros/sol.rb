# @param {String} s
# @return {Boolean}
def check_zero_ones(s)
    max1 = max0 = 0
    one = zero = 0
    
    s.each_char do |ch|
        if ch == '1'
            one += 1
            zero = 0
            max1 = [max1, one].max
        else
            zero += 1
            one = 0
            max0 = [max0, zero].max
        end
    end
    
    max1 > max0
end
