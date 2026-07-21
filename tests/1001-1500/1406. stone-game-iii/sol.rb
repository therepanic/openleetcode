# @param {Integer[]} stone_value
# @return {String}
def stone_game_iii(stone_value)
    n = stone_value.length
    dp = [0, 0, 0]

    (n - 1).downto(0) do |i|
        take_one = stone_value[i] - dp[(i + 1) % 3]

        take_two = -Float::INFINITY
        if i + 1 < n
            take_two = stone_value[i] + stone_value[i + 1] - dp[(i + 2) % 3]
        end

        take_three = -Float::INFINITY
        if i + 2 < n
            take_three = stone_value[i] + stone_value[i + 1] + stone_value[i + 2] - dp[(i + 3) % 3]
        end

        dp[i % 3] = [take_one, take_two, take_three].max
    end

    value = dp[0]
    if value > 0
        return "Alice"
    elsif value < 0
        return "Bob"
    else
        return "Tie"
    end
end
