---
layout: default
title: readings
permalink: /readings/
---

things i've read and chose to share, newest first. [subscribe via atom](/readings.xml)

{% assign readings = site.data.readings %}
{% if readings == nil or readings.size == 0 %}
nothing here yet.
{% else %}
{% for r in readings %}
<blockquote>
<p><a href="{{ r.url | escape }}">&ldquo;{{ r.title | escape }}&rdquo;</a>.<br>
{% assign pub = r.publication | default: r.source %}{% if r.authors.size > 0 %}{% assign by = r.authors | array_to_sentence_string %}{% else %}{% assign by = "" %}{% endif %}{% if by != "" and by != pub %}{{ by | escape }} in {% endif %}<i>{{ pub | escape }}</i>.<br>
<i>{% if r.published %}Published {{ r.published | date: "%B %-d, %Y" }}. {% endif %}Read on {{ r.read | date: "%B %-d, %Y" }}.</i>{% if r.tags.size > 0 %}<br>
<small>{{ r.tags | join: ", " | replace: "-", " " | replace: "_", " " | escape }}</small>{% endif %}</p>
</blockquote>
{% endfor %}
{% endif %}
