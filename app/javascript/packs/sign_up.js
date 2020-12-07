
(function(){
	var $ = function( elem ){
		if (!(this instanceof $)){
      return new $(elem);
		}
		this.el = document.getElementById( elem );
	};
	window.$ = $;
	$.prototype = {
		onChange : function( callback ){
			this.el.addEventListener('change', callback );
			return this;
		}
	};
})();

var dragdrop = {
	init : function( elem ){
		elem.setAttribute('ondrop', 'dragdrop.drop(event)');
		elem.setAttribute('ondragover', 'dragdrop.drag(event)' );
	},
	drop : function(e){
		e.preventDefault();
		var file = e.dataTransfer.files[0];
		runUpload( file );
	},
	drag : function(e){
		e.preventDefault();
	}
};

function runUpload( file ) {
if( file.type === 'image/png'  ||
			file.type === 'image/jpg'  ||
		  file.type === 'image/jpeg' ||
			file.type === 'image/gif'  ||
			file.type === 'image/bmp'  ){
		var reader = new FileReader(),
				image = new Image();
		reader.readAsDataURL( file );
		reader.onload = function( _file ){
			$('profile-image').el.src = _file.target.result;
      $('profile-image').el.classList.remove('d-none')
      $('profile-image').el.classList.add('d-block')
      $("default").el.classList.remove("d-block");
      $("default").el.classList.add("d-none");
      
		}
	}
}

window.onload = function(){
	if( window.FileReader ){
		dragdrop.init( $('profile-image-div').el );
		$('user_photo').onChange(function(){ runUpload( this.files[0] ); });
	}else{
		var p   = document.createElement( 'p' ),
				msg = document.createTextNode( 'Sorry, your browser does not support FileReader.' );
		p.className = 'error';
		p.appendChild( msg );
		$('profile-image-div').el.innerHTML = '';
		$('profile-image-div').el.appendChild( p );
	}
};
