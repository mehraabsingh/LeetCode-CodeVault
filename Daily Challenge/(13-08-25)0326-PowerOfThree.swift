class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        if n <= 0 { return false }
        let maxPowerOfThree = 1162261467 // 3^19
        return maxPowerOfThree % n == 0
    }
}
