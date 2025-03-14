//
//  Global.swift
//  RedSwift
//
//  Created by ios on 2021/11/5.
//

import Foundation
import UIKit

public let kScreenWidth = UIScreen.main.bounds.size.width
public let kScreenHeight = UIScreen.main.bounds.size.height
public let kScreenScale = UIScreen.main.scale
public let kAppWindow = UIApplication.shared.delegate!.window!!
public let kLastWindow = UIApplication.shared.windows.last!

public let kReferenceW = kScreenWidth / 375.0
public let kReferenceH = kScreenHeight / 667.0
public let kIsIPad = (UIDevice.current.userInterfaceIdiom == .pad || UIDevice.current.model.lowercased().contains("ipad"))
/// 状态栏高度
public var kScreenStatusHeight : CGFloat {
    if #available(iOS 13.0, *) {
        if let barHeight = UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame.height {
            return barHeight
        }
        return 44.0
    }
    return UIApplication.shared.statusBarFrame.height
    
}
/// 状态栏高度
public var kScreenSafeBottomHeight : CGFloat {
    if #available(iOS 13.0, *) {
        if let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom {
            return bottom
        }
        return 0.0
    }
    return 0.0
    
}

/// 导航栏高度
public let kSafeAreaTopHeight : CGFloat = Int(kScreenStatusHeight) > 20 ? 88.0 : 64.0
/// tab高度
public let kTabBarHeight: CGFloat = Int(kScreenStatusHeight) > 20 ? 83 : 49
/// tab距离底部高度
public let kSafeAreaBottomHeight: CGFloat = Int(kScreenStatusHeight) > 20 ? 34 : 0

/// 差值
public let kSafeDiffHeight: CGFloat = Int(kScreenStatusHeight) > 20 ? 24 : 0

/// 沙盒路径
public struct kDirectoryPath {
    public static let Home = NSHomeDirectory()
    public static let Documents = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true).last!
    public static let Library = NSSearchPathForDirectoriesInDomains(.libraryDirectory,.userDomainMask, true).last!
    public static let Tmp = NSTemporaryDirectory()
    public static let Caches = NSSearchPathForDirectoriesInDomains(.cachesDirectory,.userDomainMask, true).last!
}

/// 版本信息
public struct kAppInfo {
    public static var version = { Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String ?? "" }()
    public static var versionBuild = { Bundle.main.infoDictionary!["CFBundleVersion"] as? String ?? "" }()
    public static var bundleId = { Bundle.main.infoDictionary!["CFBundleIdentifier"] as? String ?? "" }()
    public static var displayName: String = {
        Bundle.main.localizedInfoDictionary?["CFBundleDisplayName"] as? String ?? Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? ""
    }()
    public static var kUUID =  UIDevice.current.identifierForVendor?.uuidString.replacingOccurrences(of: "-", with: "")
    public static var systemVersion = UIDevice.current.systemVersion
}

public func TLog<T>(message:T) -> Void {
#if DEBUG
    print("\(message)")
#endif
}

public func TMoreLog<T>(message:T, file:String=#file, method:String=#function,line:Int=#line) {
#if DEBUG
    print("[\(file):\(method):\(line))]--\(message)")
#endif
}



