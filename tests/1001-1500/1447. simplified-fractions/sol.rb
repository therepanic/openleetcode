# @param {Integer} n
# @return {String[]}
def simplified_fractions(n)
    fractions = []
    (1...n).each do |numerator|
        (numerator+1..n).each do |denominator|
            if numerator.gcd(denominator) == 1
                fractions << "#{numerator}/#{denominator}"
            end
        end
    end
    fractions
end
