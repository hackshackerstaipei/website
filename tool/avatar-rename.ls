require! <[fs fs-extra]>

root = "../web/static/assets/img/avatars/"
fs.readfile-sync root
  .map -> "#root/#it"
  .filter -> "\s|jpeg".exec(it)
  .map (src) ->
    des = src.replace(/\s+/g, '').replace(/jpeg$/g,'jpg')
    [src, des]
    # TODO: png -> jpg, src -> des, high res -> low res
 
