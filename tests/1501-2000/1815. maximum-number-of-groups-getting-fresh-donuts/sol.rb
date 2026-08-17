# @param {Integer} batch_size
# @param {Integer[]} groups
# @return {Integer}
def max_happy_groups(batch_size, groups)
    counts = Array.new(batch_size, 0)
    happy_count = 0
    groups.each do |g|
        rem = g % batch_size
        if rem == 0
            happy_count += 1
        else
            counts[rem] += 1
        end
    end
    
    (1..(batch_size / 2)).each do |i|
        if i == batch_size - i
            pair_count = counts[i] / 2
            happy_count += pair_count
            counts[i] %= 2
        else
            pair_count = [counts[i], counts[batch_size - i]].min
            happy_count += pair_count
            counts[i] -= pair_count
            counts[batch_size - i] -= pair_count
        end
    end
    
    state_vector = counts[1..-1] || []
    memo = {}
    
    viterbi = lambda do |current_counts, leftover|
        key = [current_counts, leftover]
        return memo[key] if memo.key?(key)
        
        if current_counts.sum == 0
            memo[key] = 0
            return 0
        end
        
        res = 0
        current_counts.each_with_index do |count, i|
            if count > 0
                rem = i + 1
                next_counts = current_counts.dup
                next_counts[i] -= 1
                
                is_happy = (leftover == 0) ? 1 : 0
                new_leftover = (leftover + rem) % batch_size
                
                res = [res, is_happy + viterbi.call(next_counts, new_leftover)].max
            end
        end
        memo[key] = res
        res
    end
    
    happy_count + viterbi.call(state_vector, 0)
end
