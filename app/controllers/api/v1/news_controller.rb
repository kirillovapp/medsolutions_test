module Api
  module V1
    class NewsController < ::ApiController
      # GET /news
      def index
        news = News.page(params[:page]).per(params[:per])
        json_data(news: news)
      end
    end
  end
end
