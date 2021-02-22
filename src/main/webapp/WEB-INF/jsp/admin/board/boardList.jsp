<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>Board List</title>
<style>
	#paging {display: inline-block;margin-left:35%}
	#write {display: inline-block;margin-left:10%}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>

	$(document).ready(function(){	
		
	    $("#selectAll").click(function() {	
	    	
	        var isChecked = $(this).prop("checked");	
	        $(".selectEach").prop("checked", isChecked);
		
	    });	
	    
		$(".selectEach").click(function(){
			$("#selectAll").prop("checked",false)
		})

    });

		
	function massiveDelete(){
		
		var confirm_val = confirm("정말 삭제하시겠습니까?");
		  
		  if(confirm_val) {
		   var idArr = new Array();
		   
		   $("input[class='selectEach']:checked").each(function(){
			   idArr.push($(this).attr("data-id"));
		   });
		   
		   $.ajax({
		    url : '/admin/board',
		    method : 'post',
		    data : { idArr : idArr },
		    dataType:'text',
		    success : function(res){
		    	if(res){
		    		alert("삭제되었습니다")
		    		location.reload();
		    	}else{
		    		alert("삭제 실패")
		    	}		    	
		    },
			error:function(xhr, status, err){
				alert(status+','+err);	
			}
			}); 
			
		}
				 
	}

 		
</script>
</head>
<body>
<!-------- board list --------->
<div>
	<table class="table table-hover">
		<tr>
			<th>
				<input type="checkbox" id="selectAll" name="selectAll">
			</th>
			<th>No</th>
			<th>Writer</th>
			<th>Title</th>
			<th>Date</th>
			<th>Views</th>
		</tr>
	
		<c:forEach var="list" items="${pageInfo.list}">	
			<tr>
				<td>
					<input type="checkbox" class="selectEach" name="selectEach" data-id="${list.id}">
				</td>
				<td>${list.id}</td>
				<td>${list.memberId}</td>
				<td>
					<a href ="/admin/board/detail?id=${list.id}&categoriesId=${list.categoriesId}" onclick="countView(${list.id});">
						${list.title}
					</a>		
				</td>
				<td>${list.createDate}</td>
				<td>${list.view}</td>    		
			</tr>	
		</c:forEach>
	
	</table>
</div>
<button type="button" id="massiveDeleteBtn" onclick="massiveDelete();" style="cursor: pointer;">삭제</button>
	
<!-------- pagination --------->
<div id="paging">
<ul id="pagination" class="pagination">
<c:choose> 
	<c:when test="${pageInfo.hasPreviousPage}">
		<li class="page-item"><a class="page-link" href="/admin/board/${pageInfo.pageNum-1}">Previous</a></li>
	</c:when>
	<c:otherwise>
		<li class="page-item"><a class="page-link" href="javascript:void()">Previous</a></li>
	</c:otherwise>
</c:choose>
	<c:forEach var="p" items="${pageInfo.navigatepageNums}">
		<c:choose>
			<c:when test="${p==pageInfo.pageNum}">
				<li class="page-item active"> <a class="page-link" href="javascript:void()">${p}</a></li>
			</c:when>
			<c:otherwise>
			<li class="page-item"><a class="page-link" href="/admin/board/${p}">${p}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
<c:choose>
	<c:when test="${pageInfo.hasNextPage}">
		<li class="page-item"><a class="page-link" href="/admin/board/${pageInfo.pageNum+1}">Next</a></li>
	</c:when>
	<c:otherwise>
		<li class="page-item"><a class="page-link" href="javascript:void()">Next</a></li>
	</c:otherwise>
</c:choose>
</ul>
</div>

<div id="write">
	<a href="/admin/board/insert">글쓰기</a>
</div>

<!-------- search --------->
<div class="w-100">
	<form id="search-form" action="/admin/board" method="post">
		<div class="d-flex clearfix col-12">
			<div class="col-2">
				<select name="searchAs" id="searchAs" class="form-control">
					<option value="title" <c:if test="${searchMap.searchAs == 'title'}">selected</c:if>>title</option>
					<option value="writer" <c:if test="${searchMap.searchAs == 'writer'}">selected</c:if>>writer</option>
				</select>
			</div>
			<div class="input-group col-8">
				<input type="text" name="search" id="search" class="form-control" value="${searchMap.search }">
			</div>
			<div class="col-2">
				<button type="submit" class="btn btn-raised btn-primary btn-round waves-effect">Search</button>
			</div>
		</div>
	</form>
</div>
</body>
