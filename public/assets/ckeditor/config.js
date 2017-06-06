CKEDITOR.editorConfig = function( config ) {
  config.height = '600'
  config.language = 'en'
  // Define changes to default configuration here.
  // For complete reference see:
  // http://docs.ckeditor.com/#!/api/CKEDITOR.config

  // The toolbar groups arrangement, optimized for a single toolbar row.
  config.toolbarGroups = [
    { name: 'document',    groups: [ 'mode', 'document', 'doctools' ] },
    { name: 'clipboard',   groups: [ 'clipboard', 'undo' ] },
    { name: 'editing',     groups: [ 'find', 'selection', 'spellchecker' ] },
    { name: 'forms' },
    { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
    { name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ] },
    { name: 'links' },
    { name: 'insert' },
    { name: 'styles' },
    { name: 'colors' },
    { name: 'tools' },
    { name: 'others' },
  ];

  // The default plugins included in the basic setup define some buttons that
  // are not needed in a basic editor. They are removed here.
  config.removeButtons = 'Cut,Copy,Paste,Undo,Redo,Anchor,Underline,Strike,Subscript,Superscript';

  // Dialog windows are also simplified.
  config.removeDialogTabs = 'link:advanced';
};
