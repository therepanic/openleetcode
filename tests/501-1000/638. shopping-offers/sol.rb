# @param {Integer[]} price
# @param {Integer[][]} special
# @param {Integer[]} needs
# @return {Integer}
def shopping_offers(price, special, needs)
    p_len = price.length
    
    dp = lambda do |curr, memo|
        return 0 if curr.all? { |i| i == 0 }
        key = curr
        unless memo.key?(key)
            n = curr.length
            memo[key] = (0...p_len).sum { |i| curr[i] * price[i] }
            special.each do |offer|
                if (0...n).all? { |i| curr[i] >= offer[i] }
                    new_curr = (0...n).map { |i| curr[i] - offer[i] }
                    memo[key] = [memo[key], offer[-1] + dp.call(new_curr, memo)].min
                end
            end
        end
        memo[key]
    end
    
    dp.call(needs, {})
end
