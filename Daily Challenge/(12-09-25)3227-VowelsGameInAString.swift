class Solution {
    func doesAliceWin(_ s: String) -> Bool {
        let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
        for ch in s {
            if vowels.contains(ch) {
                return true
            }
        }
        return false
    }
}
