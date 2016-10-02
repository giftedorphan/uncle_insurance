PDFKit.configure do |config|
  config.default_options = {
    :page_size => 'A4',
    :orientation => 'Landscape',
    :margin_top => '0cm',
    :margin_right => '0cm',
    :margin_bottom => '0cm',
    :margin_left => '0cm',
    :footer_right => "Page [page] of [toPage]",
    :print_media_type => true
  }
end