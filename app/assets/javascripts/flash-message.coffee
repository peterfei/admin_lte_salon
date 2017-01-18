# 自动消失的时间根据级别递加
# 客户要求，通知的样式要又粗又大，当然，时间也要够长，所以统一改为10秒
TIMEOUT_MAPPINGS =
  info: 2000
  success: 2000
  warning: 2000
  error: 2000

@flash = (message, level='info', timeout=0) ->
  $last = $('.flash-message:visible:last')
  last_top = if $last.size() then ($last.position().top + $last.outerHeight() - $('body').scrollTop()) else 0

  $flash = $("""<div class="alert alert-#{level} fade in flash-message">
    <button type="button" class="close">&times;</button>
    #{message}
  </div>""").css('top', last_top + 10).appendTo('.modal-header').fadeIn()

  # 设置提示信息自动消失的时间
  flash_timeout = timeout or TIMEOUT_MAPPINGS[level] or 2000

  # 插入提示信息到页面中
  unless timeout == false
    $flash.delay(flash_timeout).fadeOut () -> $(@).remove()

