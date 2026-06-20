# @param {String} secret
# @param {String} guess
# @return {String}
def get_hint(secret, guess)
    bulls = 0
    secret_counts = Hash.new(0)
    guess_counts = Hash.new(0)

    secret.chars.each_with_index do |s, i|
        g = guess[i]
        if s == g
            bulls += 1
        else
            secret_counts[s] += 1
            guess_counts[g] += 1
        end
    end

    cows = secret_counts.sum { |d, count| [count, guess_counts[d]].min }
    "#{bulls}A#{cows}B"
end
