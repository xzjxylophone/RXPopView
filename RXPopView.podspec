




Pod::Spec.new do |s|
  s.name     = "RXPopView"
  s.version  = "0.2"
  s.license  = "MIT"
  s.summary  = "RXPopView is a simple pop view"
  s.homepage = "https://github.com/xzjxylophone/RXPopView"
  s.author   = { 'Rush.D.Xzj' => 'xzjxylophoe@gmail.com' }
  s.social_media_url = "http://weibo.com/xzjxylophone"
  s.source   = { :git => 'https://github.com/xzjxylophone/RXPopView.git', :tag => "v#{s.version}" }
  s.description = %{
    RXScrollView is a simple pop view.
  }
  s.source_files = 'RXPopView/*.{h,m}'
  s.frameworks = 'Foundation', 'UIKit'
  s.requires_arc = true
  s.platform = :ios, '6.0'
end


















