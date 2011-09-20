$('#form-newsletter').live('ajax:before', function(event) {	
	$('#loading-newsletter').attr('display','block');
	$('#loading-newsletter').html('<img src="/images/barra-16.gif" />');
});

$('#form-newsletter').live('ajax:complete', function(event) {	
	$('#loading-newsletter').html('');
});

$('#form-newsletter').submit( function() {
	
	if( $('#newsletter_nome').val() == $('#newsletter_nome').attr('title') ) {
		alert('Por favor, preencha o nome.');
		return false;
	}
	
	if( $('#newsletter_email').val() == $('#newsletter_email').attr('title') ) {
		alert('Por favor, preencha o email.');
		return false;
	}
	
});
