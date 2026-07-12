# @param {Integer[]} deck
# @return {Boolean}
def has_groups_size_x(deck)
    counts = Hash.new(0)
    deck.each { |card| counts[card] += 1 }
    
    def get_gcd(a, b)
        while b > 0
            a, b = b, a % b
        end
        a
    end
    
    frequencies = counts.values
    current_gcd = frequencies[0]
    
    frequencies[1..-1].each do |count|
        current_gcd = get_gcd(current_gcd, count)
        return false if current_gcd == 1
    end
    
    current_gcd >= 2
end
