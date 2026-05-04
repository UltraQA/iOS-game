import Foundation

protocol ProgressionStoring {
    func unlockedLevelIndices(for tier: DifficultyTier) -> Set<Int>
    func unlock(_ levelID: LevelID)
    func reset()
}

final class UserDefaultsProgressionStore: ProgressionStoring {
    private let defaults: UserDefaults
    private let keyPrefix = "progression_unlocked_"

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        seedIfNeeded()
    }

    func unlockedLevelIndices(for tier: DifficultyTier) -> Set<Int> {
        let key = storageKey(for: tier)
        let array = defaults.array(forKey: key) as? [Int] ?? []
        return Set(array)
    }

    func unlock(_ levelID: LevelID) {
        let key = storageKey(for: levelID.tier)
        var current = unlockedLevelIndices(for: levelID.tier)
        current.insert(levelID.index)
        defaults.set(Array(current).sorted(), forKey: key)
    }

    func reset() {
        DifficultyTier.allCases.forEach { tier in
            defaults.removeObject(forKey: storageKey(for: tier))
        }
        seedIfNeeded()
    }

    private func seedIfNeeded() {
        if defaults.object(forKey: storageKey(for: .easy)) == nil {
            defaults.set([1], forKey: storageKey(for: .easy))
        }
    }

    private func storageKey(for tier: DifficultyTier) -> String {
        keyPrefix + tier.rawValue
    }
}
