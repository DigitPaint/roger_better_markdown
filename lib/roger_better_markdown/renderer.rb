require "redcarpet"
require "pygments"

# Tweak zeh code
class HTMLwithPygments < Redcarpet::Render::HTML
  def block_code(code, language)
    Pygments.highlight(code, lexer: language)
  end

  def doc_header
    css_file_path = File.join(File.dirname(__FILE__),
                              "..", "..", "resources", "github-markdown.css")
    header = "<!DOCTYPE html>"
    header << "<html>"
    header << "<head>"
    header << "<meta name=\"viewport\" content=\"width=device-width\">"
    header << "<style>"
    header << File.read(css_file_path)
    header << "</style>"
    header << "</head>"
    header << "<body>"
    header << '<div class="markdown-body">'

    header
  end

  def doc_footer
    footer = "</div>"
    footer << "</body>"
    footer << "</html>"

    footer
  end
end

# https://github.com/slim-template/slim/issues/192#issuecomment-2369670
class CustomTiltRender < Tilt::RedcarpetTemplate
  def options
    {
      fenced_code_blocks: true,
      superscript: true,
      smartypants: true,
      no_intra_emphasis: true,
      renderer: renderer
    }
  end

  def renderer
    render_options = {
      # https://github.com/vmg/redcarpet#darling-i-packed-you-a-couple-renderers-for-lunch
      filter_html:    false,
      no_images:       false,
      no_links:        false,
      no_styles:       false,
      safe_links_only: false,
      with_toc_data:   true,
      hard_wrap:       false,
      xhtml:           false,
      prettify:        false,
      link_attributes: {},
    }

    HTMLwithPygments.new(render_options)
  end
end
