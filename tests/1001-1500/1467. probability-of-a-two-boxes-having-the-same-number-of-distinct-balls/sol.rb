# @param {Integer[]} balls
# @return {Float}
def get_probability(balls)
    total = balls.sum
    half = total / 2

    # Binomial weights count which distinct balls of a color enter box 0.
    choose = Array.new(total + 1) { Array.new(total + 1, 0) }
    0.upto(total) do |i|
        choose[i][0] = 1
        choose[i][i] = 1
        1.upto(i - 1) do |j|
            choose[i][j] = choose[i - 1][j - 1] + choose[i - 1][j]
        end
    end

    states = { [0, 0, 0] => 1 }
    balls.each do |count|
        next_states = Hash.new(0)
        states.each do |(used, distinct0, distinct1), ways|
            0.upto(count) do |take|
                new_used = used + take
                break if new_used > half
                key = [new_used,
                       distinct0 + (take > 0 ? 1 : 0),
                       distinct1 + (take < count ? 1 : 0)]
                next_states[key] += ways * choose[count][take]
            end
        end
        states = next_states
    end

    favorable = states.sum do |(used, distinct0, distinct1), ways|
        used == half && distinct0 == distinct1 ? ways : 0
    end
    favorable.to_f / choose[total][half]
end
