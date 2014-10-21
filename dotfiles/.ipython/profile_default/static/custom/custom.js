// $('div#header').hide()
// IPython.layout_manager.do_resize();
$([IPython.events]).on('notebook_loaded.Notebook', function(){
	$('div#header').hide();
    $('div#maintoolbar').hide();
	IPython.layout_manager.do_resize();
})