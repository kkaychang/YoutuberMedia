//
//  YoutubeData.swift
//  YoutuberMedia
//
//  Created by Kay Chang on 2021/4/24.
//

import Foundation

/// Youtube播放清單
struct YoutubePlayList: Decodable {
    /// 清單項目
    var items: [ListContentDetail] = []
    /// 取下一次資料的Token
    var nextPageToken: String = ""
}

/// 清單項目
struct ListContentDetail: Decodable {
    /// 項目細節
    var contentDetails: ContentDetail?
}

/// 項目細節
struct ContentDetail: Decodable {
    /// 影片ID
    let videoId: String
    /// 影片發佈時間
    let videoPublishedAt: String
}

/// Youtube影片
struct YoutubeMedias: Decodable {
    let items: [YoutubeMediaDetail]
}

/// 影片細節
struct YoutubeMediaDetail: Decodable {
    /// 影片ID
    let id: String
    /// 片段細節
    let snippet: Snippet
    /// 統計資料
    let statistics: Statistics
}


/// 片段細節
struct Snippet: Decodable {
    /// 標題
    let title: String
    /// 發佈時間
    let publishedAt: String
    /// 描述
    let description: String
    /// 縮圖
    let thumbnails: Thumbnails
}

/// 縮圖
struct Thumbnails: Decodable {
    /// 中型縮圖
    let medium: ThumbnailDetail
    /// 標準縮圖
    let standard: ThumbnailDetail
    /// 高品質縮圖
    let high: ThumbnailDetail
}

/// 縮圖細節
struct ThumbnailDetail: Decodable {
    /// 圖片網址
    let url: String
    /// 高度
    let height: Int
    /// 寬度
    let width: Int
}

/// 統計資料
struct Statistics: Decodable {
    /// 影片觀看數量
    let viewCount: String
    /// 點讚數量
    let likeCount: String
    /// 噓數量
    let dislikeCount: String
}
