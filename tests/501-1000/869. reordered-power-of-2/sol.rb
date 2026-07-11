# @param {Integer} n
# @return {Boolean}
def reordered_power_of2(n)
    signature = ->(num) do
        counts = Array.new(10, 0)
        if num == 0
            counts[0] = 1
        else
            while num > 0
                counts[num % 10] += 1
                num /= 10
            end
        end
        counts.join(",")
    end

    target = signature.call(n)
    (0..30).any? { |i| signature.call(1 << i) == target }
end
