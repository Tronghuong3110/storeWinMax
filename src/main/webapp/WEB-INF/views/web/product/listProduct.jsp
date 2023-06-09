<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var = "apiGetListCategory" value = "/api/category/list" />
<c:url var = "apiGetListProduct" value = "/api/product/list" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách sản phẩm</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
<!------ Include the above in your HEAD tag ---------->

<div class="container">
    <div class="row">
        <div class="col-6">
            <nav aria-label="breadcrumb"  style="margin-top: 12px;">
                <ol class="breadcrumb" style="background-color: #fff !important;">
                    <li class="breadcrumb-item"><a href="/trang-chu">Trang chủ</a></li>
                    <li class="breadcrumb-item"><a href="/danh-sach-san-pham">Sản Phẩm</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Danh Sách Sản Phẩm</li>
                </ol>
            </nav>
        </div>
        <div class="col-6">
            <!-- Search -->
            <div class="input-group" style="margin-top: 18px;">
                <div class="form-outline" style="width: 91%; margin-right: 3px;">
                    <input type="search" id="form1" class="form-control" placeholder="Tên sản phẩm..."/>
                </div>
                <button type="button" class="btn btn-primary">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </div>
    </div>
</div> 
<div class="container">
    <div class="row">
        <div class="col-lg-3">
			<!-- <h1 class="my-4">Sản phẩm</h1> -->
			<h2 class="card-header bg-primary text-white text-uppercase" style="font-size: 1.5rem !important;"><i class="fa fa-list"></i> Sản Phẩm</h2>
			<!-- danh sách tên các sản phẩm -->
			<div class="list-group list">
			</div>
	
			
		</div>
		
		<!-- danh sách sản phẩm -->
        <div class="col">
            <div class="row js-render">
            </div>
            <div> <ul class="pagination" id="pagination" style="display: flex; justify-content: center;"></ul></div>
        </div>
    </div>
</div>
<script>
	var html = '';
	$.ajax({
		type: "GET",
		url: "${apiGetListCategory}",
		dataType: "JSON",
		contentType: "application/json",
		success: function(data) {
            localStorage.setItem("categories", data)
			$.each($(data), function(i, item) {
				html += '<a href="';
				html += "<c:url value = '/san-pham/" + item.code;
				html += "'/>" + '" class="list-group-item">' + item.name + '</a>'
			})
			$('.list').html(html);
		}
	})
	
    // render danh sách sản phẩm
	var render = '';
	// apiGetListProduct
    $.ajax({
        type: "GET",
        url: "${apiGetListProduct}",
        dataType: "JSON",
        success: function(data) {
            // alert(data.length)
           $.each($(data), function (i, item) {
        	    render +='<div class="col-lg-4 col-md-6 mb-4">';
        	    render +=     '<div class="card h-100">'; //  
                render +=         '<a href="/chi-tiet-san-pham?id=' + item.id + '&categoryid=' + item.category.id +  '" title="View Product"><img class="card-img-top" src="' + "<c:url value = '/template/web/images/products/" + item.type.img + "'/>" + '" alt="Card image cap"></a>'; // anh
                render +=         '<div class="card-body">';
                render +=           '<h4 class="card-title"><a href="/chi-tiet-san-pham?id=' + item.id + '&categoryid=' + item.category.id + '" title="View Product" style="font-size: 1.27rem">' + item.name + ' ' + item.size + ' ' + item.type.loRen + ' ' + item.type.shape + '</a></h4>'; // ten                
                render +=              '<h5>' + item.price +'</h5>';
                render +=              '<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>'
                render +=         ' </div>';
                render +=         '<div class="card-footer">';
                render +=               '<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>'
                render +=         '</div>'
                render +=    ' </div>';
                render +='</div>';
                // console.log(i)
           })
           $('.js-render').html(render);
            // console.log(data)
        }
    })

	// $(function () {
    //     window.pagObj = $('#pagination').twbsPagination({
    //         totalPages: 30,
    //         visiblePages: 10,
    //         startPage: 1,
    //         onPageClick: function (event, page) {
    //             if(page != currentPage) {
    //             }
    //         }
    //     }).on('page', function (event, page) {
    //         console.info(page + ' (from event listening)');
    //     }); 
    // });
</script>
</body>