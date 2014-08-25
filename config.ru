require 'rack/contrib/try_static'

use Rack::TryStatic,
  urls: %w[/],
  root: '_site',
  try: ['.html', 'index.html', '/index.html'],
  header_rules: [
    [['html'],  { 'Content-Type'  => 'text/html; charset=utf-8' }],
    [['css'],   { 'Content-Type'  => 'text/css' }],
    [['js'],    { 'Content-Type'  => 'text/javascript' }],
    [['png'],   { 'Content-Type'  => 'image/png' }],
    ['/assets', { 'Cache-Control' => 'public, max-age=31536000' }],
  ]

run lambda { |env|
  [404, { 'Content-Type' => 'text/html' }, File.open('_site/404.html', File::RDONLY)]
}
