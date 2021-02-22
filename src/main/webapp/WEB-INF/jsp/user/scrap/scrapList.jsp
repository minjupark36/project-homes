<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
	<meta charset="UTF-8">
	<title>My Scrap Page</title>
	<style>
		.scrapImage {height: 250px; width: 250px; margin-left: 50px; margin-bottom: 30px;object-fit:cover}
		.scrapBtn {height: 30px; width:30px;cursor:pointer;transform: translate(20%,20%)}
		 
		 #list {width:100%; position: relative;}
		 #list .image {display: inline-block;}
		 #list .button {position: absolute; display: inline-block; 
		 				height: 200px; width: 300px; margin-left: 50px; margin-bottom: 30px;}
		 .scrapBtn:hover{-webkit-filter: opacity(.5) drop-shadow(0 0 0 gray);
		 				filter: opacity(.5) drop-shadow(0 0 0 gray);}
		 			
		 .sort {text-align: center;}
		 #pagination {text-align: center;}
		 table {margin-left: -8%}
		 
	</style>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script>
		
		function deleteScrap(id){
			$.ajax({ 
				url:'/user/scrap', 
				method:'delete',
				data: {'id':id},
				dataType:'text',
				success:function(res){
					if(confirm("스크랩 목록에서 삭제하시겠습니까?")){
						location.reload();
					}
					else{
						return false;
					}
				},
				error:function(xhr, status, err){
					alert(status+', '+err);
				}
			
			});	
		}

		function showList(sort){
			
			$.ajax({ 
				url:'/user/scrap', 
				method:'post',
				data: {'sort':sort}, /*all, interior, deco 中*/
				dataType:'text',
				cache: false
		    }).done(function(res) {
		    	var html = jQuery('<div>').html(res);
		    	var contents = html.find('div#list').html();   		    	
		        $("#list").html(contents);
		        $('#sort').val(sort);
		        
		    }).fail(function (xhr, status, err){
				alert(status+', '+err);
				});
		}	
		
		var lastScrollTop = 0;
		
		$(window).scroll(function () {
			
			var sort = $("#sort").val();
			var lastRow = $("#lastRow").val();
			var lastId = $(".scrolling:last").attr("data-id");
			console.log(sort)
		    console.log(lastId)
		    console.log(lastRow)
		    
		    var currentScrollTop = $(window).scrollTop();
		    
		    if(currentScrollTop - lastScrollTop >0){
		    	lastScrollTop = currentScrollTop;		    
		    
		        $.ajax({
		            type: "POST",
		            url: "/user/scrap/scrollDown",
		            data: {"sort":sort
	            		,"id":lastId
	            		, "lastRow":lastRow},
		            dataType: "text",
		            cache: false,
		            success: function (res) {
		            	var html = jQuery('<div>').html(res);
				    	var contents = html.find('div#list').html();
				        $("#list").html(contents);
				        return false;
		            },
		            error: function (req, status, error) {
		                alert("Error try again");
		            }
		        });
		    }
		}); 
	</script>

</head>
<body>
<!-- MyScarp sorting buttons -->
	<div class="sort">
		<input type="hidden" id="sort" name="sort" value="all">
		<button type="button" data-sort="all" onclick="showList('all')" class="btn btn-raised btn-primary btn-round waves-effect">All</button>
		<button type="button" data-sort="interior" onclick="showList('interior')" class="btn btn-raised btn-primary btn-round waves-effect">Interior</button>
		<button type="button" data-sort="deco" onclick="showList('deco')" class="btn btn-raised btn-primary btn-round waves-effect">Deco</button>
	</div><br><br>
	
<!-- MyScrap images list -->
<c:choose>
<c:when test="${sessionScope.loginCheck eq true}">
<c:set var="i" value="0" />
<c:set var="j" value="4" />
	<div id="list">
		<table>			
		<c:forEach var="scrap" items="${scrapList}" varStatus="count">
		<c:if test="${i%j==0}">
		<tr class="listToChange">
		</c:if>
			<td class="scrolling" data-id="${scrap.id}">
			<div class="button">
				<a href="javascript:void(0);" onclick="deleteScrap(${scrap.id})">
					<img class="scrapBtn" 
					src="https://pics.freeicons.io/uploads/icons/png/13732025981547546480-512.png">	
				</a>		
			</div>
			<div class="image">
				<a href="${scrap.imageDto.filepath}">
					<img class="scrapImage" src="${scrap.imageDto.filepath}">
				</a>
			</div>
				
			</td>
			<c:if test="${i%j==j-1}">
		</tr>
		</c:if>
		<c:set var="i" value="${i+1}"/>
		</c:forEach>
		</table>
		<div><input type="hidden" id="lastRow" name="lastRow" value="4"></div>
	</div>	
</c:when>
<c:otherwise>
로그인이 필요한 서비스입니다.
</c:otherwise>
</c:choose>	
</body>
</html>