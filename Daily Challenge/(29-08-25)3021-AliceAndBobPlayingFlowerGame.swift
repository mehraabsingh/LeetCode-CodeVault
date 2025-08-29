class Solution {
    func flowerGame(_ n: Int, _ m: Int) -> Int {
        let oddN = (n + 1) / 2
        let evenN = n / 2
        let oddM = (m + 1) / 2
        let evenM = m / 2
        
        return oddN * evenM + evenN * oddM
    }
}
