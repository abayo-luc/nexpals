# http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.config.html#.toolbar_Full
CKEDITOR.editorConfig = (config) ->
  config.language = 'en'
  config.width = '725'
  config.height = '600'
  config.toolbar_Pure = [
    { name: 'document',    items: [ 'Source'] },
    { name: 'clipboard',   items: [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
    { name: 'editing',     items: [ 'Scayt' ] },
    { name: 'tools',       items: [ 'Maximize', 'ShowBlocks','-','About' ] }
    '/',
    { name: 'basicstyles', items: [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
    { name: 'paragraph',   items: [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote'] },
    { name: 'links',       items: [ 'Link','Unlink','Anchor' ] },
    '/',
    { name: 'styles',      items: [ 'Styles','Format','Font','FontSize' ] },
    { name: 'colors',      items: [ 'TextColor','BGColor' ] },
    { name: 'insert',      items: [ 'Image','Table','HorizontalRule', 'SpecialChar'] },
    {name: 'about', itmes: ['About']}
  ]
  config.toolbar = 'Pure'
  true