module FeatherIconsHelper
  include FeatherIcon

  def feather_icon(symbol, **options)
    icon = FeatherIcon.new(symbol, **options)
    content_tag(:svg, icon.svg_path.html_safe, icon.options) # rubocop:disable Rails/OutputSafety
  end
end
