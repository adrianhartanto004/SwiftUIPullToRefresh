Pod::Spec.new do |spec|
    spec.name                     = 'SwiftUIPullToRefresh'
    spec.version                  = '0.0.1'
    spec.homepage                 = 'https://github.com/adrianhartanto004/SwiftUIPullToRefresh'
    spec.source                   = { :git => "https://github.com/adrianhartanto004/SwiftUIPullToRefresh.git", :tag => spec.version.to_s }
    spec.authors                  = ''
    spec.license                  = ''
    spec.summary                  = 'SwiftUIPullToRefresh pod library'
    spec.swift_versions           = ['5.0']
    spec.weak_frameworks          = "SwiftUI"
    spec.ios.deployment_target    = '15'
    spec.source_files             = ["PullToRefresh/**/*.swift"]
end