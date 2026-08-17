# @param {Integer[]} coins
# @return {Integer}
def get_maximum_consecutive(coins)
    coins.sort!
    max_consecutive = 0
    
    coins.each do |coin|
        break if coin > max_consecutive + 1
        max_consecutive += coin
    end
    
    max_consecutive + 1
end
