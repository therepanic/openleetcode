# @param {Integer} n
# @return {Integer[]}
def get_no_zero_integers(n)
    (1...n).each do |i|
        if !i.to_s.include?('0') && !(n - i).to_s.include?('0')
            return [i, n - i]
        end
    end
end
