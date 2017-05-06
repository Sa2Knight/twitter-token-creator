require 'twitter_oauth'
class Twitter

  # initialize - インスタンスを生成する
  #---------------------------------------------------------------------
  def initialize(api_key, api_secret)
    @twitter = TwitterOAuth::Client.new(
        :consumer_key => api_key,
        :consumer_secret => api_secret,
        :token => nil,
        :secret => nil
    )
  end

  # request_token - Twitter認証用のURLを生成する
  #--------------------------------------------------------------------
  def request_token(callback)
    begin
      @twitter.request_token(:oauth_callback => callback)
    rescue OAuth::Unauthorized => err
      nil
    end
  end

  # get_access_token - Twitter連携用のアクセストークンを取得
  #--------------------------------------------------------------------
  def get_access_token(req_token , req_secret , verifier)
    begin
      @token = @twitter.authorize(req_token , req_secret , :oauth_verifier => verifier)
    rescue OAuth::Unauthorized => err
      nil
    end
  end

  # user_info - ユーザ情報を取得
  #---------------------------------------------------------------------
  def user_info
    @twitter.info
  end

end
