class Solution {
    func removeAnagrams(_ words: [String]) -> [String] {
        // Result array to store final words
        var result: [String] = []
        // Variable to store previous word's sorted form
        var prevSorted = ""

        for word in words {
            // Sort the current word alphabetically
            let sortedWord = String(word.sorted())
            
            // If it's not an anagram of the previous one, keep it
            if sortedWord != prevSorted {
                result.append(word)
                prevSorted = sortedWord
            }
        }
        return result
    }
}
