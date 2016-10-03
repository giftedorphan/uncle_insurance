PDFKit.configure do |config|
  config.default_options = {
    :encoding => 'UTF-8',
    :page_size => 'A4',
    :orientation => 'Landscape',
    :footer_right => "Page [page] of [toPage]",
    :margin_top => '2cm',
    :margin_right => '1cm',
    :margin_bottom => '2cm',
    :margin_left => '0cm',
    :print_media_type => true
  }
end