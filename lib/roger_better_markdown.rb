require "roger_better_markdown/renderer"
require "roger_better_markdown/version"

module RogerBetterMarkdown
  # Render with codez
  Tilt.prefer CustomTiltRender, "md"
end
