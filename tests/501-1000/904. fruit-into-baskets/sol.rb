# @param {Integer[]} fruits
# @return {Integer}
def total_fruit(fruits)
    start = 0
    max_len = 0
    fruit_count = Hash.new(0)
    
    fruits.each_with_index do |fruit, end_pos|
        fruit_count[fruit] += 1
        
        while fruit_count.size > 2
            left_fruit = fruits[start]
            fruit_count[left_fruit] -= 1
            fruit_count.delete(left_fruit) if fruit_count[left_fruit] == 0
            start += 1
        end
        
        max_len = [max_len, end_pos - start + 1].max
    end
    
    max_len
end
