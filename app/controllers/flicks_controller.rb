class FlicksController < ApplicationController
    GOOGLE_API_KEY = 'AIzaSyAHqQaFeVMDRM7uNAnT2Pdnngl-pmJp-aM'

    def find_videos(keyword, after: 1.months.ago, before: Time.now)
      service = Google::Apis::YoutubeV3::YouTubeService.new
      service.key = GOOGLE_API_KEY

      next_page_token = nil
      opt = {
        q: keyword,
        type: 'video',
        max_results: 9,
        order: :date,
        page_token: next_page_token,
        published_after: after.iso8601,
        published_before: before.iso8601
      }
      service.list_searches(:snippet, opt)
    end

    def index
      @youtube_data = find_videos('公式　映画　予告')
      @youtube_datas = find_videos('Netflix Japan')
      @youtube_datass = find_videos('アマゾンプライム')
    end
end

