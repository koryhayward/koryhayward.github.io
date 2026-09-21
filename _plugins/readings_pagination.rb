# frozen_string_literal: true

# Splits /readings/ into pages of `readings_per_page` items (default 10). Page 1 is readings.md
# itself at /readings/; pages 2..N are copies of it at /readings/page/N/. The template reads
# page.readings_page and page.readings_pages. No gems: this runs in a plain `jekyll build`.
module ReadingsPagination
  class Generator < Jekyll::Generator
    safe true

    def generate(site)
      first = site.pages.find { |p| p.url == "/readings/" }
      return unless first

      per = [site.config.fetch("readings_per_page", 10).to_i, 1].max
      total = [(Array(site.data["readings"]).size.to_f / per).ceil, 1].max

      first.data["readings_page"] = 1
      first.data["readings_pages"] = total
      first.data["readings_per_page"] = per

      (2..total).each do |n|
        page = Jekyll::PageWithoutAFile.new(site, site.source, "readings/page/#{n}", "index.md")
        page.content = first.content
        page.data.merge!(first.data)
        page.data["permalink"] = "/readings/page/#{n}/"
        page.data["title"] = "readings, page #{n}"
        page.data["readings_page"] = n
        site.pages << page
      end
    end
  end
end
