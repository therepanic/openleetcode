# @param {Integer} left
# @param {Integer} right
# @return {Integer[]}
def self_dividing_numbers(left, right)
    lst = []
    (left..right).each do |i|
        temp = i.to_s.chars.map(&:to_i)
        next if temp.include?(0)
        b = 1
        temp.each do |j|
            if i % j != 0
                b = 0
                break
            end
        end
        lst.push(i) if b == 1
    end
    lst
end
