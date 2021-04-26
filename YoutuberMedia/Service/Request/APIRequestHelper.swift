//
//  APIRequestHelper.swift
//  YoutuberMedia
//
//  Created by Kay Chang on 2021/4/20.
//

import Foundation

/**
 本專案暫時依全域取得方式獲得呼叫Api function
 */

/// 取得Youtube指定頻道影片列表
/// - Parameters:
///   - channelID: 頻道ID
///   - apiKey: googleApiKey
///   - successHandelr: 成功抓取資料呼叫及回傳
///   - errorHandler: 抓取資料失敗呼叫及回傳
/// - Returns:
func getYoutubeListItems(playListID: String, apiKey: String, pageToken: String? = nil, fetchCount: Int, successHandelr: @escaping ((YoutubePlayList) -> ()), errorHandler: @escaping ((String) -> ())) {
    /**
     https://www.googleapis.com/youtube/v3/playlistItems?
     part=contentDetails,id,snippet,status&
     maxResults=20&
     pageToken=&
     key=abccato&
     playlistId=PLQxYio3XnDo9OnQT1URsBda-9YpVw9LhR
     */
    
    // https://www.youtube.com/watch?v=yYqRSayB4Qk&list=PLQxYio3XnDo9OnQT1URsBda-9YpVw9LhR
    var urlComponents = URLComponents(string: "https://www.googleapis.com/youtube/v3/playlistItems")
    let queryItems = [URLQueryItem(name: "part", value: "snippet,contentDetails,id,status"),
                      URLQueryItem(name: "playlistId", value: playListID),
                      URLQueryItem(name: "key", value: apiKey),
                      URLQueryItem(name: "maxResults", value: "\(fetchCount)"),
                      URLQueryItem(name: "pageToken", value: pageToken)]
    urlComponents?.queryItems = queryItems
    guard let requestURL = urlComponents?.url else {
        errorHandler("API網址有問題")
        return
    }
    
    let request = URLRequest(url: requestURL)
    URLSession.shared.dataTask(with: request) { data, response, error in
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            errorHandler("網路出現錯誤")
            return
        }
        if let data = data {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let youtubePlayList = try? decoder.decode(YoutubePlayList.self, from: data) as YoutubePlayList {
                successHandelr(youtubePlayList)
            } else {
                errorHandler("解析失敗")
            }
        }
    }.resume()
}


/// 取得影片細節
/// - Parameters:
///   - videoIDs: 影片ID(可多個ID)
///   - apiKey: googleApiKey
///   - successHandler: 成功抓取資料呼叫及回傳
///   - errorHandler: 抓取資料失敗呼叫及回傳
func getMediaDetail(videoIDs: [String], apiKey: String, successHandler: @escaping ((YoutubeMedias) -> ()), errorHandler: @escaping ((String) -> ())) {
    /**
     https://www.googleapis.com/youtube/v3/videos?
     part=id,snippet,statistics&
     id=zW60jGznKno&
     key=abccato
     */
    
    var urlComponents = URLComponents(string: "https://www.googleapis.com/youtube/v3/videos")
    let queryItems = [URLQueryItem(name: "part", value: "id,snippet,statistics"),
                      URLQueryItem(name: "id", value: videoIDs.joined(separator: ",")),
                      URLQueryItem(name: "key", value: apiKey)]
    urlComponents?.queryItems = queryItems
    guard let requestURL = urlComponents?.url else {
        errorHandler("API網址有問題")
        return
    }
    
    let request = URLRequest(url: requestURL)
    URLSession.shared.dataTask(with: request) { data, response, error in
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            errorHandler("網路出現錯誤")
            return
        }
        if let data = data {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let youtubeMedias = try? decoder.decode(YoutubeMedias.self, from: data) as YoutubeMedias {
                successHandler(youtubeMedias)
            } else {
                errorHandler("解析失敗")
            }
        }
    }.resume()
}
