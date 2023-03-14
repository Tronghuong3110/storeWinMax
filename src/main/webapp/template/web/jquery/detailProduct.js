// get parameter tu url
		$.urlParam = function(name){
        var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
        if (results==null) {
          return null;
        }
        return decodeURI(results[1]) || 0;
     	}

		var id = $.urlParam('id');
		var categoryId = $.urlParam('catrgoryid');

		// call API detail product
		$.ajax({
			type: "GET",
			url: "${urlApiDetail}?id=" + id,
			dataType: "Json",
			success: function(data){
				// render ảnh
				var img = "<c:url value = '/template/web/images/products/" + data.img + "'/>"; 
				$('.js-img').attr('src', img);
				// render name san pham
				$('.js-name').html(data.name_product);
				$('.js-size').html(data.size);
				$('.js-loren').html(data.lo_ren);
				$('.js-shape').html(data.shape);
				// render price product
				$('.js-price').html(data.price + "₫") 
			}
		});
