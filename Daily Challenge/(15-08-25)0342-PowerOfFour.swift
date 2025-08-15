class Solution {
    func isPowerOfFour(_ n: Int) -> Bool {
        return n > 0 && (n & (n - 1)) == 0 && (n & 0x55555555) != 0
    }
}
