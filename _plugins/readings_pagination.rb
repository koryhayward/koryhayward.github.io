# frozen_string_literal: true

# Splits /readings/ into pages of `readings_per_page` items (default 10). Page 1 is readings.md
# itself at /readings/; pages 2..N are copies of it at /readings/page/N/. The template reads
# page.readings_page, page.readings_pages and page.readings_pager. No gems: this runs in a
# plain `jekyll build`.
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
      first.data["readings_pager"] = pager(1, total)

      (2..total).each do |n|
        page = Jekyll::PageWithoutAFile.new(site, site.source, "readings/page/#{n}", "index.md")
        page.content = first.content
        page.data.merge!(first.data)
        page.data["permalink"] = "/readings/page/#{n}/"
        page.data["title"] = "readings, page #{n}"
        page.data["readings_page"] = n
        page.data["readings_pager"] = pager(n, total)
        site.pages << page
      end
    end

    # Page numbers to show, nil for a gap ("…"). Up to 7 pages: all of them. More: always 7
    # slots, keeping the first, the last, and the current page with its neighbours, e.g.
    # 1 2 3 4 5 … 8, then 1 … 4 5 6 7 8; with more pages, 1 … 5 6 7 … 12. A gap always hides
    # at least two pages.
    def pager(current, total)
      return (1..total).to_a if total <= 7
      return (1..5).to_a + [nil, total] if current <= 4
      return [1, nil] + ((total - 4)..total).to_a if current >= total - 3

      [1, nil, current - 1, current, current + 1, nil, total]
    end
  end
end
