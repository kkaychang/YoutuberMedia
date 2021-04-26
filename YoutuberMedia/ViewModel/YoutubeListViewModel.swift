//
//  YoutubeListViewModel.swift
//  YoutuberMedia
//
//  Created by Kay Chang on 2021/4/20.
//

import Foundation

class YoutubeListViewModel {
    
    private var fetchPlayList: YoutubePlayList? = nil
    private(set) var medias: [YoutubeMediaDetail] = []
    
    init() {}
    
    // TODO: 補下拉刷新
    func fetchData(refresh: Bool = false, successHandler: @escaping (() -> ()), errorHandler: @escaping ((String) -> ())) {
        if refresh {
            fetchPlayList = nil
        }
        
        getYoutubeDatas(fetchToken: fetchPlayList?.nextPageToken, fetchCount: 20) {
            successHandler()
        } errorHandler: { errorMessage in
            errorHandler(errorMessage)
        }
    }
    
}

private extension YoutubeListViewModel {
    
    func getYoutubeDatas(fetchToken: String? = nil, fetchCount: Int, successHandler: @escaping (() -> Void), errorHandler: @escaping ((String) -> Void)) {
        // 此專案依Youtube頻道-老王愛說笑｜老王不只三分鐘清單為例 playListID: PLQxYio3XnDo9OnQT1URsBda-9YpVw9LhR，請自行更換
        // 此範例API Key為假資料，請自行申請更換
        let googleApiKey = "fakeApiKeyChangeByYourself"
        let playListID = "PLQxYio3XnDo9OnQT1URsBda-9YpVw9LhR"
        
        getYoutubeListItems(playListID: playListID, apiKey: googleApiKey, pageToken: fetchToken, fetchCount: fetchCount) { [weak self] data in
            self?.fetchPlayList = data
            let listIDs = data.items.compactMap { $0.contentDetails?.videoId }
            
            getMediaDetail(videoIDs: listIDs, apiKey: googleApiKey) { data in
                self?.medias.append(contentsOf: data.items)
                successHandler()
            } errorHandler: { errorMessage in
                errorHandler(errorMessage)
            }
            
        } errorHandler: { errorMessage in
            errorHandler(errorMessage)
        }
    }
}
