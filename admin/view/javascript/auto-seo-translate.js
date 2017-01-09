var ruen = {
  baseRU : 'абвгдезиклмнопрстуфыэйхё',
  baseEN : 'abvgdeziklmnoprstufyejxe',
  specialLetter : {'ж':'zh','ц':'ts','ч':'ch','ш':'sh','щ':'sch','ю':'ju','я':'ja','&':'-and-'},
  softLetter : 'аеёиоуыэюя',
  translating : function(str) {
    str = str.replace(/[_\s\.,?!\[\](){}\\\/"':;]+/g, '-')
             .toLowerCase()
             .replace(new RegExp('(ь|ъ)(['+this.softLetter+'])', 'g'), 'j$2')
             .replace(/(ь|ъ)/g, '');
    var _str = '';
    for (var x=0; x<str.length; x++)
      if ((index = this.baseRU.indexOf(str.charAt(x))) > -1)
        _str += this.baseEN.charAt(index);
      else
        _str += str.charAt(x);
    str = _str;
    var _str = '';
    for (var x=0; x<str.length; x++)
      if (this.specialLetter[str.charAt(x)])
        _str += this.specialLetter[str.charAt(x)];
      else
        _str += str.charAt(x);
    str = _str;
    str = str.replace(/j{2,}/g, 'j')
             .replace(/[^-0-9a-z]+/g, '')
             .replace(/-{2,}/g, '-')
             .replace(/^-+|-+$/g, '');
    return str;
  }
}
function setTranslating(src, dst, force){
  if ($('input[name="'+src+'"]').val() != undefined){
      $('input[name="'+src+'"]').change(function(){
        var srcVal = $('input[name="'+src+'"]').val();
        var dstVal = $('input[name="'+dst+'"]').val();
        if (force || (dstVal == '')) {
            if (dstVal.length >1)  
              ('input[name="'+dst+'"]').val(dstVal+'-'+ruen.translating(srcVal));
            else
              $('input[name="'+dst+'"]').val(dstVal+ruen.translating(srcVal));
            }
      });
  }
}
$(document).ready(function(){
  // For Products
  setTranslating('product_description\\[2\\]\\[name\\]', 'keyword', false);
  // For Info Articles
  setTranslating('information_description\\[2\\]\\[title\\]', 'keyword', false);
  // For Categories
  setTranslating('category_description\\[2\\]\\[name\\]', 'keyword', false);
  // For Manufacturer
  setTranslating('name', 'keyword', true);
  setTranslating('model', 'keyword', true);
});
