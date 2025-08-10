class Solution {
    func reorderedPowerOf2(_ n: Int) -> Bool {
        // Function to sort digits of a number and return as string
        func sortDigits(_ num: Int) -> String {
            return String(String(num).sorted())
        }
        
        // Precompute all powers of two up to 1e9
        var powerSet = Set<String>()
        var power = 1
        while power <= 1_000_000_000 {
            powerSet.insert(sortDigits(power))
            power <<= 1
        }
        
        // Check if n's sorted digits exist in the set
        return powerSet.contains(sortDigits(n))
    }
}
