//
//  FakeDataViewModel.swift
//  YoutuberMedia
//
//  Created by Kay Chang on 2021/4/17.
//

import Foundation

class FakeDataViewModel {
    
    private var fakeDatas: [MediaData] = []
    
    init() {
        fakeDatas.append(MediaData(mediaID: 6,
                                   title: "老王給你問 #6",
                                   subTitle: "讓我當你股市裡的情人（均線之下、賠錢如何調適）",
                                   imageUrl: "https://i.ytimg.com/vi/Pc0WA1fDACY/hqdefault.jpg"))
        fakeDatas.append(MediaData(mediaID: 7,
                                   title: "老王給你問 #7",
                                   subTitle: "小資最適合的槓桿型商品？權證、期貨、選擇權個別解析！",
                                   imageUrl: "https://i.ytimg.com/vi/CN-Mn-LwRvI/hqdefault.jpg"))
        fakeDatas.append(MediaData(mediaID: 8,
                                   title: "老王給你問 #8",
                                   subTitle: "老王帥氣的秘密？（日K vs 週Ｋ、法人如何看營收）",
                                   imageUrl: "https://i.ytimg.com/vi/O9UrPLFJsNo/hqdefault.jpg"))
        fakeDatas.append(MediaData(mediaID: 9,
                                   title: "老王給你問 #9",
                                   subTitle: "老王傳授放空的技巧！（個股落底訊號怎麼看？）",
                                   imageUrl: "https://i.ytimg.com/vi/O9UrPLFJsNo/hqdefault.jpg"))
        fakeDatas.append(MediaData(mediaID: 10,
                                   title: "老王給你問 #10",
                                   subTitle: "波浪理論甘有影？！（老王不只短還很快！）",
                                   imageUrl: "https://i.ytimg.com/vi/a5_LY2Au6c0/hqdefault.jpg"))
    }
    
    func getDatas() -> [MediaData] {
        return fakeDatas
    }
}
