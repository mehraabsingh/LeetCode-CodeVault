class Solution {
    func isValid(_ word: String) -> Bool {
        if word.count < 3 { return false }
        var vowel = false, consonant = false
        for c in word {
            if !c.isLetter && !c.isNumber { return false }
            if c.isLetter {
                if "aeiouAEIOU".contains(c) { vowel = true }
                else { consonant = true }
            }
        }
        return vowel && consonant
    }
}
