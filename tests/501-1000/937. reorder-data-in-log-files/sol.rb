# @param {String[]} logs
# @return {String[]}
def reorder_log_files(logs)
    logs.sort_by do |log|
        ident, rest = log.split(" ", 2)
        if rest[0] =~ /\d/
            [1]
        else
            [0, rest, ident]
        end
    end
end
