# @param {Integer[]} temperatures
# @return {Integer[]}
def daily_temperatures(temperatures)
    stack = []
    ans = [0] * temperatures.length

    temperatures.each_with_index do |temp, i|
        while !stack.empty? && temp > temperatures[stack.last]
            prev = stack.pop
            ans[prev] = i - prev
        end
        stack.push(i)
    end

    ans
end
