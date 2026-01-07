//
//  Localize.swift
//  RedSwift
//
//  Created by ios on 2021/11/6.
//

import Foundation

public enum LanguageType : String , CaseIterable{
    case en         = "en"
    case zh_Hans    = "zh-Hans"
    case zh_Hant    = "zh-Hant"
    /// 日本语
    case ja         = "ja"
    /// 法语
    case fr         = "fr"
    /// 意大利语
    case it         = "it"
    /// 德语
    case de         = "de"
    /// 西班牙语
    case es         = "es"
    /// 波兰语
    case pl         = "pl"
    /// 俄语
    case ru         = "ru"
    /// 泰语
    case th         = "th"
    /// 韩语
    case ko         = "ko"
    /// 葡萄牙语
    case pt         = "pt-PT"
    /// 捷克
    case cs         = "cs"
    /// 阿拉伯语
    case ar         = "ar"
    /// 瑞典语
    case sv         = "sv"
    /// 斯洛伐克语
    case sk         = "sk"
    /// 希腊
    case el         = "el"
    /// 斯洛文尼亚
    case sl         = "sl"
    /// 越南
    case vi         = "vi"
    /// 土耳其
    case tr         = "tr"
    /// 匈牙利语
    case hu         = "hu"
    /// 荷兰语
    case nl         = "nl"
    /// 缅甸语
    case my         = "my"
    /// 丹麦语
    case da         = "da"
    /// 挪威语
    case nb         = "nb"
    /// 芬兰语
    case fi         = "fi"
    /// 克罗地亚语
    case hr         = "hr"
    //11111
    
    public func description() -> String {
          switch self {
          case .en:
              return "English"
          case .zh_Hans:
              return "简体中文"
          case .zh_Hant:
              return "繁體中文"
          case .ja:
              return "日本語"
          case .fr:
              return "Français"
          case .it:
              return "Italiano"
          case .de:
              return "Deutsch"
          case .es:
              return "Español"
          case .pl:
              return "Polski"
          case .ru:
              return "Русский"
          case .th:
              return "แบบไทย"
          case .ko:
              return "한국인"
          case .pt:
              return "Português"
          case .cs:
              return "čeština"
          case .ar:
              return "عربي"
          case .sv:
              return "Svenska"
          case .sk:
              return "Slovenský jazyk"
          case .el:
              return "Ελληνικά"
          case .sl:
              return "Slovenščina"
          case .vi:
              return "Tiếng Việt"
          case .tr:
              return "Türkçe"
          case .hu:
              return "Magyar"
          case .nl:
              return "Nederlands"
          case .my:
              return "မြန်မာ"
          case .da:
              return "Dansk"
          case .nb:
              return "Norsk"
          case .fi:
              return "Suomi"
          case .hr:
              return "Hrvatski"
          }
      }
}

public struct Localize {
    
    public static var language = LanguageType.en
    
    /// 获取后要设置下 这边用静态变量language
    public static func currentLanguage() -> String {
        /// 本地是否有存储，没有的话则用系统设置
        if let temp = Storage.Language.language.value {
            return temp
        }
        return defaultLanguage()
    }
    
    public static func setCurrentLanguage(_ type: String) {
        let selectedLanguage = availableLanguages().contains(type) ? type : defaultLanguage()
        if let temp = LanguageType.init(rawValue: selectedLanguage) {
            language = temp
        }
    }
    
    public static func defaultLanguage() -> String {
        
        var defaultLanguage = LanguageType.en.rawValue
        
        guard let prefixLanguage = Locale.preferredLanguages.first else {
            return defaultLanguage
        }
        guard var preferredLanguage = prefixLanguage.components(separatedBy: "-").first else {
            return defaultLanguage
        }
        /// 这边处理简体和繁体
        if preferredLanguage == "zh" {
            if prefixLanguage.contains("zh-Hans") {
                preferredLanguage = "zh-Hans"
            }else {
                preferredLanguage = "zh-Hant"
            }
        }
        let availableLanguages = self.availableLanguages()
        if (availableLanguages.contains(preferredLanguage)) {
            defaultLanguage = preferredLanguage
        }else {
            defaultLanguage = LanguageType.en.rawValue
        }
        return defaultLanguage
    }
    
    public static func availableLanguages(_ excludeBase: Bool = false) -> [String] {
        var availableLanguages = Bundle.main.localizations
        if let indexOfBase = availableLanguages.firstIndex(of: "Base") , excludeBase == true {
            availableLanguages.remove(at: indexOfBase)
        }
        return availableLanguages
    }
}
