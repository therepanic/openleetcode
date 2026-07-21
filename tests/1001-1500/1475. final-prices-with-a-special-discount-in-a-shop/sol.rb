# @param {Integer[]} prices
# @return {Integer[]}
def final_prices(prices)
    stack = []
    prices.each_with_index do |price, i|
        while !stack.empty? && prices[stack.last] >= price
            index = stack.pop
            prices[index] -= price
        end
        stack.push(i)
    end
    prices
end
