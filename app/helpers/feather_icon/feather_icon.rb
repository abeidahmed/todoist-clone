module FeatherIcon
  class FeatherIcon
    # rubocop:disable Rails/HelperInstanceVariable
    attr_reader :options

    def initialize(icon, size: 20, stroke_width: 1, **options)
      @icon = icon.to_s
      @options = options

      @options.merge!(a11y)
      @options.merge!({
        viewBox: "0 0 24 24",
        height: size,
        width: size,
        version: "1.1",
        fill: "none",
        stroke: "currentColor",
        "stroke-width": stroke_width,
        "stroke-linecap": "round",
        "stroke-linejoin": "round"
      })
    end

    def svg_path
      file_path = Rails.root.join("app/assets/images/feather_icon/#{@icon}.svg")

      raise "Undefined icon for #{@icon}" unless File.exist?(file_path)

      svg = File.read(file_path)
      doc = Nokogiri::HTML::DocumentFragment.parse(svg)
      doc.at_css("svg").children.to_html
    end

    private

    def a11y
      accessible = {}

      if @options[:"aria-label"].nil? && @options["aria-label"].nil? && @options.dig(:aria, :label).nil?
        accessible[:"aria-hidden"] = "true"
      else
        accessible[:role] = "img"
      end

      accessible
    end
    # rubocop:enable Rails/HelperInstanceVariable
  end
end
