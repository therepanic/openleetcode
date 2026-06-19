# @param {Integer[]} matchsticks
# @return {Boolean}
def makesquare(matchsticks)
    total = matchsticks.sum
    return false if total % 4 != 0
    side = total / 4
    
    matchsticks.sort!.reverse!
    
    sides = [0, 0, 0, 0]
    backtrack(matchsticks, 0, sides, side)
end

def backtrack(matchsticks, index, sides, side)
    if index == matchsticks.length
        return sides.all? { |s| s == side }
    end
    
    (0...4).each do |i|
        if sides[i] + matchsticks[index] <= side
            sides[i] += matchsticks[index]
            return true if backtrack(matchsticks, index + 1, sides, side)
            sides[i] -= matchsticks[index]
        end
    end
    
    false
end
