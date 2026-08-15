# @param {String[]} logs
# @return {Integer}
def min_operations(logs)
    output = 0
    logs.each do |log|
        if log == "../"
            output -= 1
            output = 0 if output < 0
        elsif log == "./"
            next
        else
            output += 1
        end
    end
    output < 0 ? 0 : output
end
