# @param {String} command
# @return {String}
def interpret(command)
    result = []
    i = 0
    while i < command.length
        if command[i] == 'G'
            result << "G"
            i += 1
        elsif command[i, 2] == "()"
            result << "o"
            i += 2
        else
            result << "al"
            i += 4
        end
    end
    result.join
end
