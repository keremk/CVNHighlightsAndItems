Pod::Spec.new do |s|
  s.name         = "CVNHighlightsAndItems"
  s.version      = "0.0.1"
  s.summary      = "A short description of CVNHighlightsAndItems."

  s.description  = <<-DESC
                   A longer description of CVNHighlightsAndItems in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC

  s.homepage     = "http://EXAMPLE/CVNHighlightsAndItems"
  s.license      = "MIT (example)"
  s.author             = { "Kerem Karatal" => "kkaratal@yahoo.com" }
  s.social_media_url   = "http://twitter.com/keremk"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/keremk/CVNHighlightsAndItems.git", :tag => "0.0.1" }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"
  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"
  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  s.dependency "CVNHighlightsAndItems", "~> 0.1"
end
