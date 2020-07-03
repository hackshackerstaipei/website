require! <[fs fs-extra path sharp pug js-yaml]>

console.log "generate latest thumbnail ... "
filename = '../web/src/pug/events/thumb.pug'
event = js-yaml.safe-load (fs.read-file-sync '../data/event.yaml')
svg = data = pug.render fs.read-file-sync(filename).toString!, {filename, event}

idx = -1
hash = {}
while true
  data = data.substring(idx + 1)
  ret = /"(\/assets\/[^"]+)"/.exec(data)
  if !ret => break
  fn = ret.1
  idx = ret.index
  idx = ret.index
  buf = fs.read-file-sync path.join('../web/static', fn)
  hash[fn] = {data: buf.toString("base64"), type: (if /.png$/.exec(fn) => 'png' else 'jpeg')}
for k,v of hash =>
  svg = svg.replace k, "data:image/#{v.type};base64,#{v.data}"

fs.write-file-sync '../web/static/assets/img/events/latest.svg', svg
sharp(Buffer.from(svg))
  .png!
  .toBuffer!
  .then (buf) ->
    fs-extra.ensure-dir-sync '../web/static/assets/img/events'
    fs.write-file-sync '../web/static/assets/img/events/latest.png', buf

