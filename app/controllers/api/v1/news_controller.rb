module Api
  module V1
    class NewsController < ::ApiController
      # GET /news
      def index
        news = News.for_audiences(current_user.audiences).page(params[:page]).per(params[:per])
        json_data(news: news)
      end
    end
  end
end
