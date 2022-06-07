# 参考：https://zenn.dev/fu_ga/books/ff025eaf9eb387/viewer/31fcbe
module LoginSupport
  def logged_in?
    !session[:user_id].nil?
  end
end
 
RSpec.configure do |config|
  config.include LoginSupport
end