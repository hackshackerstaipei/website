require! <[fs fs-extra path @plotdb/srcbuild pug progress js-yaml sharp]>
pugbuild = require "@plotdb/srcbuild/dist/ext/pug"
extapi = new pugbuild!extapi

console.log "compile post template ... "
fn = pug.compile(
  fs.read-file-sync("../web/src/pug/posts/template.pug").toString!,
  ({basedir: "../web/src/pug/"} <<< extapi)
)

console.log "prepare data ..."
fs-extra.ensure-dir-sync '../web/static/posts'
files = fs.readdir-sync '../data/posts'
  .map -> "../data/posts/#it"
  .filter -> /\.yaml$/.exec(path.basename(it))

bar = new progress(
  "   building [#{':bar'}] #{':percent'} :etas",
  { total: files.length, width: 60, complete: '#' }
)

files.map (file) ->
  bar.tick!
  name = path.basename(file).replace(/\.yaml$/, '')
  data = js-yaml.safe-load fs.read-file-sync(file)
  ret = fn ({data} <<< extapi)
  fs-extra.ensure-dir-sync "../web/static/posts/#name"
  fs.write-file-sync "../web/static/posts/#name/index.html", ret


process.exit 0
