---
layout: coin
title: SuperBitcoin
block: 498888
replay: No
segwit: Yes
page_url:
project_url: http://supersmartbitcoin.com/
address_format: 2m
---
<a href="/">Home/</a>{{ page.title }}

## {{ page.title }}

<table>
    <thead>
        <tr>
            <th>Block #</th>
            <th>Replay protection</th>
            <th>Segwit</th>
        </tr>
    </thead>
    <tbody>
        <tr>
          <td>{{ page.block }}</td>
          <td>{% if post.replay %} <i class="fa fa-check-square olive" aria-hidden="true"></i> {{ post.replay }} {% else %} <i class="fa fa-minus-circle red" aria-hidden="true"></i> {% endif %}</td>
          <td>{% if post.segwit %} <i class="fa fa-check-square olive" aria-hidden="true"></i>  {% else %} <i class="fa fa-minus-circle red" aria-hidden="true"></i> {% endif %}</td>
        </tr>
    </tbody>
</table>


#### Technical Info:

Address Format: {{ page.address_format }}



<a href="{{ page.project_url }}">Project website <i class="fa fa-external-link" aria-hidden="true"></i></a>


