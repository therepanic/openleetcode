# @param {Integer} num
# @return {Integer}
def max_diff(num)
    num_str = num.to_s
    unique_digits = num_str.chars.uniq
    max_val = num
    min_val = num
    
    unique_digits.each do |digit|
        ('0'..'9').each do |new_digit|
            next if num_str[0] == digit && new_digit == '0'
            new_num_str = num_str.gsub(digit, new_digit)
            new_num = new_num_str.to_i
            max_val = [max_val, new_num].max
            min_val = [min_val, new_num].min
        end
    end
    
    max_val - min_val
end
