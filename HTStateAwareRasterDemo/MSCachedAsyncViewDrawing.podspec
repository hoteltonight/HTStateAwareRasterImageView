Pod::Spec.new do |s|
  s.name     = 'MSCachedAsyncViewDrawing'
  s.version  = '1.0'
  s.platform = :ios
  s.license  = 'Apache'
  s.summary  = 'Helper class that allows you to draw views (a)synchronously to a UIImage with caching for great performance.'
  s.homepage = 'https://github.com/mindsnacks/MSCachedAsyncViewDrawing'
  s.author   = { 'Javier Soto' => '' }
  s.source   = { :git => 'https://github.com/jacobjennings/MSCachedAsyncViewDrawing.git', :branch => 'feature/nsoperation-CGBitmapContextCreate' }
  s.source_files = '*.{h,m}'
  s.frameworks   = 'QuartzCore', 'Foundation'
  s.requires_arc = true
end
