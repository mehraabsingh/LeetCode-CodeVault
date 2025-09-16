class Solution {
    func replaceNonCoprimes(_ nums: [Int]) -> [Int] {
        var stack = [Int]()

        for num in nums {
            var current = num
            // Merge with top while non-coprime
            while let last = stack.last, gcd(last, current) > 1 {
                stack.removeLast()
                current = lcm(last, current)
            }
            stack.append(current)
        }
        
        return stack
    }

    private func gcd(_ a: Int, _ b: Int) -> Int {
        var x = a, y = b
        while y != 0 {
            let temp = x % y
            x = y
            y = temp
        }
        return x
    }

    private func lcm(_ a: Int, _ b: Int) -> Int {
        return a / gcd(a, b) * b
    }
}
