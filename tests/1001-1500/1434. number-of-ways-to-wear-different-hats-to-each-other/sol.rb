# @param {Integer[][]} hats
# @return {Integer}
def number_ways(hats)
    mod = 10**9 + 7
    n = hats.length
    liked_by_hat = Array.new(41) { [] }
    hats.each_with_index do |choices, person|
        choices.each do |hat|
            liked_by_hat[hat] << person
        end
    end
    
    dp = Array.new(1 << n, 0)
    dp[0] = 1
    (1..40).each do |hat|
        updated = dp.dup
        dp.each_with_index do |count, mask|
            next if count == 0
            liked_by_hat[hat].each do |person|
                person_bit = 1 << person
                if mask & person_bit == 0
                    target = mask | person_bit
                    updated[target] = (updated[target] + count) % mod
                end
            end
        end
        dp = updated
    end
    dp[-1]
end
