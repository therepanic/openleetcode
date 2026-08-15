# @param {Integer[]} alice_values
# @param {Integer[]} bob_values
# @return {Integer}
def stone_game_vi(alice_values, bob_values)
    n = alice_values.length
    combined = (0...n).map { |i| [alice_values[i] + bob_values[i], alice_values[i], bob_values[i]] }
    combined.sort_by! { |x| -x[0] }

    alice = bob = 0
    combined.each_with_index do |(total, a_val, b_val), i|
        if i.even?
            alice += a_val
        else
            bob += b_val
        end
    end

    if alice > bob
        return 1
    elsif alice < bob
        return -1
    else
        return 0
    end
end
