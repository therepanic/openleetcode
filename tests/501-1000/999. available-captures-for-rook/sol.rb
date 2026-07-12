# @param {Character[][]} board
# @return {Integer}
def num_rook_captures(board)
    pwa = 0
    (0...8).each do |i|
        (0...8).each do |j|
            if board[i][j] == "R"
                (i-1).downto(0) do |k|
                    if board[k][j] == "B"
                        break
                    elsif board[k][j] == "p"
                        pwa += 1
                        break
                    end
                end
                (i+1...8).each do |k|
                    if board[k][j] == "B"
                        break
                    elsif board[k][j] == "p"
                        pwa += 1
                        break
                    end
                end
                (j+1...8).each do |k|
                    if board[i][k] == "B"
                        break
                    elsif board[i][k] == "p"
                        pwa += 1
                        break
                    end
                end
                (j-1).downto(0) do |k|
                    if board[i][k] == "B"
                        break
                    elsif board[i][k] == "p"
                        pwa += 1
                        break
                    end
                end
            end
        end
    end
    pwa
end
