<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <p class="font-navy"><b>새로 들어온 주문</b></p>

<c:choose>
	<c:when test="${empty sellerOrderInfoList}">
	새로 들어온 주문이 없습니다.
	</c:when>
	<c:otherwise>
		<div class="open"><input type="checkbox" id="collapse">펼쳐보기</div>
	</c:otherwise>
</c:choose>
<div class="accordion" id="accordion">
<c:forEach var="item" items="${sellerOrderInfoList }">
  <div class="card">
    <div class="card-header" id="headingOne">
      <div class="float-left">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse${item.order_no }" aria-expanded="false" aria-controls="collapse${item.order_no }">
          ${item.recipient}님의 주문서
        </button>
     </div>
     <div class="float-right pt-1">
      <span><fmt:formatDate value="${item.order_time }" pattern="MM월 dd일 HH:mm"/></span>&nbsp;
      <a href="${contextPath }/mypage/sell/${item.order_no}/1" class="finished btn btn-danger btn-sm">완료</a>
     </div>
    </div>
    <div id="collapse${item.order_no }" class="collapse new" aria-labelledby="headingOne" data-parent="#accordion">
      <div class="card-body">
      	<table class="table table-sm sell-goods">
	      <thead>
	        <tr class="th">
	          <th>상품명</th>
	          <th>상품 가격</th>
	          <th>수량</th>
	          <th>전달 사항</th>
	        </tr>
	      </thead>
	      <tbody>
	      	<c:forEach var="goods" items="${item.list}">
	        <tr>
	          <td>${goods.goods_name }</td>
	          <td>${goods.goods_price }</td>
	          <td>${goods.amount }</td>
	          <td>${goods.memo }</td>
	        </tr>
	        </c:forEach>
	      </tbody>
          <tfoot>
    		<tr>
	      		<td><b>합계 (상품 가격 + 배송비)</b></td>
	      		<td>${item.total_price }</td>
	      		<td colspan="2"></td>
	    	</tr>
      	  </tfoot>
	    </table>
      	<table class="table table-sm shipping-table w-100">
	      <thead>
	        <tr class="th">
	          <th colspan="2">배송 정보</th>
	        </tr>
	      </thead>
	      <tbody>
	        <tr>
			  <th>수령인</th>
	          <td><input type="text" name="recipient" value="${item.recipient }" readonly></td>
	        </tr>
	        <tr>
			  <th>연락처</th>
	          <td><input type="tel" name="phone1" value="0${item.phone1 }" size="1" readonly>-
	          	<input type="tel" name="phone2" value="${item.phone2 }" size="2" readonly>-
	          	<input type="tel" name="phone3" value="${item.phone3 }" size="2" readonly></td>
	        </tr>
	        <tr>
			  <th>배송지</th>
	          <td><input type="text" name="postcode" value="${item.postcode }" readonly><br>
	          	<input type="text" name="address" value="${item.address } ${item.detail_address }" readonly>
	          </td>
	        </tr>
	        <tr>
			  <th>요구사항</th>
	          <td><input type="text" name="memo" value="${item.memo }" readonly></td>
	        </tr>
	      </tbody>
    	</table>
      </div>
    </div>
  </div>
</c:forEach>
</div>
<p class="font-navy"><b>완료된 주문</b></p>
<c:if test="${empty finishedOrderList}">
	완료된 주문이 없습니다.
</c:if>
<div class="accordion" id="accordion">
<c:forEach var="item" items="${finishedOrderList }">
  <div class="card">
    <div class="card-header" id="headingOne">
     <div class="float-left">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse${item.order_no }" aria-expanded="false" aria-controls="collapse${item.order_no }">
          ${item.recipient}님의 주문서
        </button>
 	</div>
    <div class="float-right pt-1">
      <fmt:formatDate value="${item.order_time }" pattern="MM월 dd일 HH:mm"/>&nbsp;
      <a href="${contextPath }/mypage/sell/${item.order_no}/0" class="finished btn btn-outline-danger btn-sm">취소</a>
    </div>
    </div>

    <div id="collapse${item.order_no }" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
      <div class="card-body">
      	<table class="table table-sm">
	      <thead>
	        <tr class="th">
	          <th>상품명</th>
	          <th>상품 가격</th>
	          <th>수량</th>
	          <th>전달 사항</th>
	        </tr>
	      </thead>
	      <tbody>
	      	<c:forEach var="goods" items="${item.list}">
	        <tr>
	          <td>${goods.goods_name }</td>
	          <td>${goods.goods_price }</td>
	          <td>${goods.amount }</td>
	          <td>${goods.memo }</td>
	        </tr>
	        </c:forEach>
	      </tbody>
	    </table>
      	<table class="table table-sm shipping-table">
	      <thead>
	        <tr class="th">
	          <th colspan="2">배송 정보</th>
	        </tr>
	      </thead>
	      <tbody>
	        <tr>
			  <th>수령인</th>
	          <td><input type="text" name="recipient" value="${item.recipient }" readonly></td>
	        </tr>
	        <tr>
			  <th>연락처</th>
	          <td><input type="tel" name="phone1" value="0${item.phone1 }" size="1" readonly>-
	          	<input type="tel" name="phone2" value="${item.phone2 }" size="2" readonly>-
	          	<input type="tel" name="phone3" value="${item.phone3 }" size="2" readonly></td>
	        </tr>
	        <tr>
			  <th>배송지</th>
	          <td><input type="text" name="postcode" value="${item.postcode }" readonly><br>
	          	<input type="text" name="address" value="${item.address } ${item.detail_address }" readonly>
	          </td>
	        </tr>
	        <tr>
			  <th>요구사항</th>
	          <td><input type="text" name="memo" value="${item.memo }" readonly></td>
	        </tr>
	      </tbody>
    	</table>
      </div>
    </div>
  </div>
</c:forEach>
</div>
<script>
$("#collapse").click(function() {
	var collapse = $('.card .collapse.new');
	if($(this).is(':checked')){
		collapse.addClass('show');
	}else{
		collapse.removeClass('show');
	}
})
</script>