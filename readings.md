---
layout: default
title: readings
permalink: /readings/
---

things i've read shorter than a [book](/bookshelf/) and chose to share, newest first. [subscribe via atom](/readings.xml)

{% assign readings = site.data.readings %}
{% if readings == nil or readings.size == 0 %}
nothing here yet.
{% else %}
{% assign start = page.readings_page | minus: 1 | times: page.readings_per_page %}
{% for r in readings offset: start limit: page.readings_per_page %}
<blockquote>
<p><a href="{{ r.url | escape }}">&ldquo;{{ r.title | escape }}&rdquo;</a><br>
{% assign pub = r.publication | default: r.source %}{% if r.authors.size > 0 %}{% assign by = r.authors | array_to_sentence_string %}{% else %}{% assign by = "" %}{% endif %}{% if by != "" and by != pub %}{{ by | escape }} in {% endif %}<i>{{ pub | escape }}</i><br>
<i>{% if r.published %}published on {{ r.published | date: "%Y-%m-%d" }}; read on {% else %}read on {% endif %}{{ r.read | date: "%Y-%m-%d" }}</i>{% if r.tags.size > 0 %}<br>
<small>{{ r.tags | join: ", " | replace: "-", " " | replace: "_", " " | escape }}</small>{% endif %}</p>
</blockquote>
{% endfor %}
{% if page.readings_pages > 1 %}
<nav aria-label="readings pages">
{% if page.readings_page > 1 %}{% assign prev = page.readings_page | minus: 1 %}<a href="{% if prev == 1 %}/readings/{% else %}/readings/page/{{ prev }}/{% endif %}" rel="prev">&larr; newer</a> | {% endif %}{% for n in (1..page.readings_pages) %}{% if n == page.readings_page %}<span aria-current="page">{{ n }}</span>{% else %}<a href="{% if n == 1 %}/readings/{% else %}/readings/page/{{ n }}/{% endif %}">{{ n }}</a>{% endif %}{% unless forloop.last %}{{ " " }}{% endunless %}{% endfor %}{% if page.readings_page < page.readings_pages %}{% assign next = page.readings_page | plus: 1 %} | <a href="/readings/page/{{ next }}/" rel="next">older &rarr;</a>{% endif %}
</nav>
{% endif %}
{% endif %}
