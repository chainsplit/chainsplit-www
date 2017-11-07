$(function() {

  var baseUrl = '/chainsplit.github.io';
  var path = window.location.pathname;

  // lang-select selection based on language from url path
  if( path.match(/\/[a-z]{2}\//) ) {
    var lang = path.match(/\/[a-z]{2}\//)[0].replace(/\//g, '');
    $('.lang-select select').val(lang);
  }

  // change url on language selection
  $('.lang-select select').on('change', function() {
    // support baseurl (preview mode)
    if( path.includes(baseUrl + '/') ) {
      path = path.replace(baseUrl, '');
    } else {
      baseUrl = '';
    }

    // remove old lang path
    path = path.replace(/\/[a-z]{2}\//, '/');

    // build new path
    if( this.value == 'en' ) {
      path = baseUrl + path;
    } else {
      path = baseUrl + '/' + this.value + path;
    }

    window.location = window.location.origin + path;
  });

});
