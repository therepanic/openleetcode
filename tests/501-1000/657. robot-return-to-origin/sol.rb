# @param {String} moves
# @return {Boolean}
def judge_circle(moves)
    moves.count('L') == moves.count('R') && moves.count('U') == moves.count('D')
end
