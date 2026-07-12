# @param {Integer} n
# @return {Integer}
def consecutive_numbers_sum(n)
    max_sequence_length = ((Math.sqrt(1 + 8 * n) - 1) / 2).to_i
    c = 0
    (2..max_sequence_length).each do |i|
        if i % 2 == 1 && n % i == 0
            c += 1
        elsif i % 2 == 0 && n % i == i / 2
            c += 1
        end
    end
    c + 1
end
