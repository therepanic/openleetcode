# @param {String} s
# @return {Integer}
def num_steps(s)
    steps = 0
    carry = 0
    
    (s.length - 1).downto(1) do |i|
        bit = s[i].to_i + carry
        
        if bit == 1
            steps += 2
            carry = 1
        else
            steps += 1
        end
    end
    
    steps + carry
end
