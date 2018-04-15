<div class="copyright">{#
#}{% set current = date(Date.now(), "YYYY") %}{#
#}&copy; {% if theme.footer.since and theme.footer.since != current %}{{ theme.footer.since }} &mdash; {% endif %}{#
#}<span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love" id="animate">
    <i class="fa fa-{{ theme.footer.icon.name }}"></i>
  </span>
  <span class="author" itemprop="copyrightHolder">{{ theme.footer.copyright || config.author }}</span>

  {% if config.symbols_count_time.total_symbols %}
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-area-chart"></i>
    </span>
    {% if theme.symbols_count_time.item_text_total %}
      <span class="post-meta-item-text">{{ __('post.total_symbols') + __('symbol.colon') }}</span>
    {% endif %}
    <span title="{{ __('post.total_symbols') }}">{#
    #}{{ symbolsCountTotal(site) }}{#
  #}</span>
  {% endif %}

  {% if config.symbols_count_time.total_time %}
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-coffee"></i>
    </span>
    {% if theme.symbols_count_time.item_text_total %}
      <span class="post-meta-item-text">{{ __('post.total_time') + __('symbol.colon') }}</span>
    {% endif %}
    <span title="{{ __('post.total_time') }}">{#
    #}{{ symbolsTimeTotal(site, theme.symbols_count_time.awl, theme.symbols_count_time.wpm) }}{#
  #}</span>
  {% endif %}
</div>

{% if theme.seo %}
  {% set nofollow = ' rel="external nofollow"' %}
{% endif %}



<!-- busuanzi 我给移过来了，阿弥陀佛 -->
{% if theme.busuanzi_count.enable %}
<div class="busuanzi-count">
  <script async src="https://dn-lbstatics.qbox.me/busuanzi/2.3/busuanzi.pure.mini.js"></script>

  {% if theme.busuanzi_count.total_visitors %}
    <span class="site-uv" title="{{ __('footer.total_visitors') }}">
      <i class="fa fa-{{ theme.busuanzi_count.total_visitors_icon }}"></i>&nbsp;访客&nbsp;:
      <span class="busuanzi-value" id="busuanzi_value_site_uv"></span>&nbsp;|&nbsp;
    </span>
  {% endif %}

  {% if theme.busuanzi_count.total_views %}
    <span class="site-pv" title="{{ __('footer.total_views') }}">
      <i class="fa fa-{{ theme.busuanzi_count.total_views_icon }}"></i>&nbsp;访问量&nbsp;:
      <span class="busuanzi-value" id="busuanzi_value_site_pv"></span>
    </span>
  {% endif %}
</div>
{% endif %}
<!-- busuanzi 我给移过来了，我佛慈悲 -->




{% if theme.footer.powered.enable %}
  <div class="powered-by">{#
  #}{{ __('footer.powered', '<a class="theme-link" target="_blank"' + nofollow + ' href="https://hexo.io">Hexo</a>') }}{% if theme.footer.powered.version %} v{{ hexo_version() }}{% endif %}{#
#}</div>
{% endif %}

{% if theme.footer.powered.enable and theme.footer.theme.enable %}
  <span class="post-meta-divider">|</span>
{% endif %}

{% if theme.footer.theme.enable %}
  <div class="theme-info">{#
  #}{{ __('footer.theme') }} &mdash; {#
  #}<a class="theme-link" target="_blank"{{ nofollow }} href="https://github.com/theme-next/hexo-theme-next">{#
    #}NexT.{{ theme.scheme }}{#
  #}</a>{% if theme.footer.theme.version %} v{{ theme.version }}{% endif %}{#
#}</div>
{% endif %}


{% if theme.footer.powered.enable and theme.footer.theme.enable %}
  <div class="copyright">
    Hosted by <a href="https://pages.coding.me">Coding Pages</a>
    &&nbsp;<a href="https://pages.github.com">GitHub Pages</a>
  </div>
{% endif %}



{% if theme.footer.custom_text %}
  <div class="footer-custom">{#
  #}{{ theme.footer.custom_text }}{#
#}</div>
{% endif %}


