class Solution {
    func maxFreqSum(_ s: String) -> Int {
        let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
        var freq: [Character: Int] = [:]

        // Count frequency of each character
        for ch in s {
            freq[ch, default: 0] += 1
        }

        var maxVowel = 0
        var maxConsonant = 0

        for (ch, count) in freq {
            if vowels.contains(ch) {
                maxVowel = max(maxVowel, count)
            } else {
                maxConsonant = max(maxConsonant, count)
            }
        }

        return maxVowel + maxConsonant
    }
}
