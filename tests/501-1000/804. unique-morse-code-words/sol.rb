# @param {String[]} words
# @return {Integer}
def unique_morse_representations(words)
    storage = [
        ".-", "-...", "-.-.", "-..", ".", "..-.", "--.",
        "....", "..", ".---", "-.-", ".-..", "--", "-.",
        "---", ".--.", "--.-", ".-.", "...", "-", "..-",
        "...-", ".--", "-..-", "-.--", "--.."
    ]

    st = Set.new

    words.each do |word|
        temp = ""
        word.each_char do |ch|
            temp += storage[ch.ord - 'a'.ord]
        end
        st.add(temp)
    end

    st.size
end
