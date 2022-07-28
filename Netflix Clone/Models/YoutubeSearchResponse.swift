//
//  YoutubeSearchResponse.swift
//  Netflix Clone
//
//  Created by Apple on 28/07/2022.
//

import Foundation
/*etag = wMAWIQeKiD4cHtSjOtuyRjuhPzw;
 items =     (
             {
         etag = "nn_Ih6r95JKAesBbHpycaDYycYQ";
         id =             {
             kind = "youtube#video";
             videoId = H5v3kku4y6Q;
         };
         kind = "youtube#searchResult";
     },
             {
         etag = "Qagq6_Y7Ad3OZpyCsenQFBrdYQo";
         id =             {
             kind = "youtube#video";
             videoId = 26KPC43GAJw;
         };
         kind = "youtube#searchResult";
     },
             {
         etag = "2T8speT7vAtum6r8wTRsMuqxl_w";
         id =             {
             kind = "youtube#video";
             videoId = EUqfrX8NXKs;
         };
         kind = "youtube#searchResult";
     },
             {
         etag = dgaLQ1asFHx2QfvE9ZoCqHPiBDY;
         id =             {
             kind = "youtube#video";
             videoId = JytlhdrhkWQ;
         };
         kind = "youtube#searchResult";
     },
             {
         etag = LDJZXtaFAC2Urhg2HhQ8d5RPka0;
         id =             {
             kind = "youtube#video";
             videoId = SNkwT1DfmVU;
         };
         kind = "youtube#searchResult";
     }
 );
 kind = "youtube#searchListResponse";
 nextPageToken = CAUQAA;
 pageInfo =     {
     resultsPerPage = 5;
     totalResults = 1000000;
 };
 regionCode = VN;
}*/
struct YouTubeSearchResponse:Codable{
    let items: [VideoElement]
}

struct VideoElement: Codable{
    let id: IdVideoElement
    let etag: String
    let kind: String
}

struct IdVideoElement: Codable{
    let kind: String
    let videoId: String
    
}
