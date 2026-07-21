# @param {Integer[]} digits
# @return {String}
def largest_multiple_of_three(digits)
    counts = Array.new(10, 0)
    digits.each { |digit| counts[digit] += 1 }

    remainder = (0..9).sum { |digit| digit * counts[digit] } % 3

    remove_smallest = lambda do |group, amount|
        group.each do |digit|
            while amount > 0 && counts[digit] > 0
                counts[digit] -= 1
                amount -= 1
            end
        end
        amount == 0
    end

    if remainder == 1
        unless remove_smallest.call([1, 4, 7], 1)
            remove_smallest.call([2, 5, 8], 2)
        end
    elsif remainder == 2
        unless remove_smallest.call([2, 5, 8], 1)
            remove_smallest.call([1, 4, 7], 2)
        end
    end

    result = (0..9).reverse_each.map { |digit| digit.to_s * counts[digit] }.join
    result.start_with?('0') ? '0' : result
end
