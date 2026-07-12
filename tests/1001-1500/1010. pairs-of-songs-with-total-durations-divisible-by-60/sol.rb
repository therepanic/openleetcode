# @param {Integer[]} time
# @return {Integer}
def num_pairs_divisible_by60(time)
    remainders = Array.new(60, 0)
    time.each do |t|
        remainders[t % 60] += 1
    end
    
    count = 0
    count += remainders[0] * (remainders[0] - 1) / 2
    count += remainders[30] * (remainders[30] - 1) / 2
    
    (1..29).each do |i|
        count += remainders[i] * remainders[60 - i]
    end
    
    count
end
