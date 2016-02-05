//
//  ApiManager.swift
//  hiwu-ios
//
//  Created by 阮良 on 15/10/21.
//  Copyright © 2015年 Shanghai Hiwu Information Technology Co., Ltd. All rights reserved.
//

import Foundation

class ApiManager{
    static let simpleLogin = "http://palace.server.hiwu.ren/api/HiwuUsers/simpleLogin?"
    static let getSelfUserInfo1 = "http://palace.server.hiwu.ren/api/HiwuUsers/"
    static let getSelfUserInfo2 = "?access_token="
    static let getTodayPublicView = "http://palace.server.hiwu.ren/api/SelectedGalleries/publicView"
    static let getAllSelfGallery1_2 = "http://palace.server.hiwu.ren/api/HiwuUsers/"
    static let getAllSelfGallery2_2 = "?filter=%7B%22include%22%3A%7B%22galleries%22%3A%5B%22hiwuUser%22%2C%7B%22items%22%3A%22photos%22%7D%5D%7D%7D&access_token="
    static let getSelfItem1 = "http://palace.server.hiwu.ren/api/Items/"
    static let getSelfItem2 = "?filter=%7B%22include%22%3A%5B%22photos%22%2C%22likers%22%2C%22hiwuUser%22%2C%7B%22comments%22%3A%22hiwuUser%22%7D%5D%7D&access_token="
    static let getPublicItem1 = "http://palace.server.hiwu.ren/api/Items/"
    static let getPublicItem2 = "/publicView?access_token="
    static let postItem1 = "http://palace.server.hiwu.ren/api/Galleries/"
    static let postItem2 = "/items?access_token="
    static let postItemPhoto1 = "http://palace.server.hiwu.ren/api/Items/"
    static let postItemPhoto2 = "/photos?access_token="
    static let deleteItem1 = "http://palace.server.hiwu.ren/api/Items/"
    static let deleteItem2 = "?access_token="
    static let postGallery1 = "http://palace.server.hiwu.ren/api/HiwuUsers/"
    static let postGallery2 = "/galleries?access_token="
    static let getGalleryItems1 = "http://palace.server.hiwu.ren/api/Galleries/"
    static let getGalleryItems2 = "?filter=%7B%22include%22%3A%7B%22items%22%3A%5B%22photos%22%5D%7D%7D&access_token="
    static let putLike1 = "http://palace.server.hiwu.ren/api/HiwuUsers/"
    static let putLike2 = "/likes/rel/"
    static let putLike3 = "?access_token="
    static let postComment1 = "http://palace.server.hiwu.ren/api/Items/"
    static let postComment2 = "/comments?access_token="
    static let deleteComment1 = "http://palace.server.hiwu.ren/api/Comments/"
    static let deleteComment2 = "?access_token="
    static let putAvatar1 = "http://palace.server.hiwu.ren/api/HiwuUsers/"
    static let putAvatar2 = "/avatar?access_token="
    static let putNickname1 = "http://palace.server.hiwu.ren/api/HiwuUsers/"
    static let putNickname2 = "?access_token="
    static let wxLogin1 = "http://palace.server.hiwu.ren/api/HiwuUsers/weixinLogin?appid="
    static let wxLogin2 = "&code="

}
