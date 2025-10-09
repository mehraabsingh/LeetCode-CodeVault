class Solution {
    func minTime(_ skill: [Int], _ mana: [Int]) -> Int {
        var sumSkill = skill.reduce(0, +)
        var prevWizardDone: Int64 = Int64(sumSkill) * Int64(mana[0])
        
        for j in 1..<mana.count {
            var prevPotionDone = prevWizardDone
            for i in stride(from: skill.count - 2, through: 0, by: -1) {
                // Compute the start time for wizard i brewing potion j
                prevPotionDone -= Int64(skill[i + 1]) * Int64(mana[j - 1])
                prevWizardDone = max(
                    prevPotionDone,
                    prevWizardDone - Int64(skill[i]) * Int64(mana[j])
                )
            }
            prevWizardDone += Int64(sumSkill) * Int64(mana[j])
        }
        
        return Int(prevWizardDone)
    }
}
