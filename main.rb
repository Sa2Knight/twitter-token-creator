require 'twitter_oauth'
require_relative 'twitter'

# APIキーを入力してTwitterインスタンスを生成
print "api key: "
api_key = STDIN.gets.chomp
print "api secret: "
api_secret = STDIN.gets.chomp
twitter = Twitter.new(api_key, api_secret)

# 認証URLの生成
unless request_token = twitter.request_token('http://sa2knight-dummy/')
  puts "api keyとapi secretの組み合わせが有効ではありません"
  exit
end
puts "request url: #{request_token.authorize_url}"

# リダイレクトURLを入力し、oauth_verifierを取得
print "redirect url: "
redirect_url = STDIN.gets.chomp
unless matched = redirect_url.match(/oauth_verifier=(.+)$/)
  puts "リダイレクトURLが正しくありません"
  exit
end
verifier = matched[1]

# アクセストークンを生成する
unless access_token = twitter.get_access_token(request_token.token, request_token.secret, verifier)
  puts "アクセストークンの取得に失敗しました"
  exit
end

puts "#{twitter.user_info['screen_name']}の認証に成功しました"
puts "access token: #{access_token.token}"
puts "access secret: #{access_token.secret}"
