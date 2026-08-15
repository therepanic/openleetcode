# @param {Integer[]} piles
# @return {Integer}
def max_coins(piles)
    piles.sort!
    l = 0
    r = piles.length
    count = 0
    (piles.length / 3).times do
        count += piles[r-2]
        l += 1
        r -= 2
    end
    count
end
