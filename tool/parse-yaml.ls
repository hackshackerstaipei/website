require! <[fs fs-extra js-yaml marked path]>

option = breaks: true, renderer: new marked.Renderer!
marked.set-options option

scandir = (root, base) ->
  if !base => base = root

  if fs.stat-sync root .is-directory! =>
    files = fs.readdir-sync root .map -> "#root/#it"
    list = for file in files => scandir file, base
    list = list.filter -> it
    d = do
      fname: path.basename(root)
      vname: root.replace(base, '').replace(/^\//,'').replace(/\//g, '_') or 'data'
      base: path.dirname(root)
    assetdir = path.join("../web/static/assets/data", d.base)
    pugdir = path.join("../web/src/pug/data", d.base)
    fs-extra.ensure-dir-sync assetdir
    fs-extra.ensure-dir-sync pugdir
    fs.write-file-sync "#assetdir/#{d.fname}.json", JSON.stringify(list)
    fs.write-file-sync "#pugdir/#{d.fname}.pug", """
    //- module
    -
      var #{d.vname.replace(/-/g,'_')} = #{JSON.stringify(list)};
    """
    return null
  else
    if !/.\yaml$/.exec(root) => return
    d = do
      fname: path.basename(root).replace(/\.yaml$/,'')
      vname: root.replace(base, '').replace(/^\//,'').replace(/\//g, '_').replace(/\.yaml$/, '')
      base: path.dirname(root)

    ret = js-yaml.safe-load fs.read-file-sync(root)
    assetdir = path.join("../web/static/assets/data", d.base)
    pugdir = path.join("../web/src/pug/data", d.base)
    fs-extra.ensure-dir-sync assetdir
    fs-extra.ensure-dir-sync pugdir
    fs.write-file-sync "#assetdir/#{d.fname}.json", JSON.stringify(ret)
    fs.write-file-sync "#pugdir/#{d.fname}.pug", """
    //- module
    -
      var #{d.vname.replace(/-/g,'_')} = #{JSON.stringify(ret)};
    """
    return {name: d.fname, data: ret}


scandir '../data'
