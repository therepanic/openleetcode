# @param {Integer[]} customers
# @param {Integer[]} grumpy
# @param {Integer} minutes
# @return {Integer}
def max_satisfied(customers, grumpy, minutes)
    n = customers.length
    total_satisfied = 0
    current_window_gain = 0
    
    (0...n).each do |i|
        if grumpy[i] == 0
            total_satisfied += customers[i]
        elsif i < minutes
            current_window_gain += customers[i]
        end
    end
    
    max_window_gain = current_window_gain
    
    (minutes...n).each do |i|
        if grumpy[i] == 1
            current_window_gain += customers[i]
        end
        if grumpy[i - minutes] == 1
            current_window_gain -= customers[i - minutes]
        end
        if current_window_gain > max_window_gain
            max_window_gain = current_window_gain
        end
    end
    
    total_satisfied + max_window_gain
end
