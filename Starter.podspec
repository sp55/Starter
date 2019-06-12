Pod::Spec.new do |s|

s.name             = "Starter"
s.version          = "1.0.0"
s.summary          = "启动项目"
s.homepage         = "http://www.tking.cn"
s.license          = 'MIT'
s.author           = "chenshaohua@juqitech.com"
s.source           = { :git => "https://github.com/sp55/Starter.git", :tag => s.version }

s.platform     = :ios, '10.0'
s.requires_arc = true

s.source_files = 'Starter/Classes/**/*.{h,m,mm,c,swift}'
s.resources = 'Starter/Resources/*', 'Starter/Classes/**/*.{xib}'
s.swift_version = '4.0'
s.frameworks = 'UIKit'

# s.dependency 'Alamofire', '~>4.8.2'
# s.dependency 'Moya', '13.0.1' 
# s.dependency 'Kingfisher', '~>5.5.0'
# s.dependency 'SnapKit', '~>5.0.0'
# s.dependency 'NVActivityIndicatorView', '~>4.7.0'
# s.dependency 'SwiftyUserDefaults', '~>3.0.1'
# s.dependency 'Toast-Swift', '~>5.0.0'
# s.dependency 'ReachabilitySwift', '~>4.3.1'
# s.dependency 'SwiftyJSON', '~> 5.0.0'
# s.dependency 'HandyJSON', '~> 5.0.0'
# s.dependency 'MJRefresh', '~>3.2.0'


end

