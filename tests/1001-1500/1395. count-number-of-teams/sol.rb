# @param {Integer[]} rating
# @return {Integer}
def num_teams(rating)
    total = 0
    n = rating.length
    (1...n - 1).each do |j|
        left_less = 0
        left_greater = 0
        (0...j).each do |i|
            if rating[i] < rating[j]
                left_less += 1
            elsif rating[i] > rating[j]
                left_greater += 1
            end
        end
        
        right_less = 0
        right_greater = 0
        (j + 1...n).each do |k|
            if rating[k] < rating[j]
                right_less += 1
            elsif rating[k] > rating[j]
                right_greater += 1
            end
        end
        
        total += left_less * right_greater + left_greater * right_less
    end
    total
end
