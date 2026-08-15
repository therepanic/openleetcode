# @param {Integer[]} customers
# @param {Integer} boarding_cost
# @param {Integer} running_cost
# @return {Integer}
def min_operations_max_profit(customers, boarding_cost, running_cost)
    wait = 0
    profit = 0
    max_profit = 0
    ans = -1
    i = 0
    rotation = 0

    while i < customers.length || wait > 0
        wait += customers[i] if i < customers.length
        boarded = [4, wait].min
        wait -= boarded

        rotation += 1
        profit += boarded * boarding_cost - running_cost

        if profit > max_profit
            max_profit = profit
            ans = rotation
        end

        i += 1
    end

    ans
end
