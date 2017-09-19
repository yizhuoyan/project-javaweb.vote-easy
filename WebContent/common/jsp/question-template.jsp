<%@page pageEncoding="utf-8"%>
<%@taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib
	prefix="fmt"
	uri="http://java.sun.com/jsp/jstl/fmt"%>
<div>
	<article class="vote">
		<h1>
			${vo.title}<small> 所属类别:${vo.category.name} </small>
		</h1>
		<section class="meta">
			<span> 投票开始时间:
			<time>
					<fmt:formatDate
						value="${vo.publishTime}"
						pattern="yyyy-MM-dd HH:mm:ss" />
			</time>
			</span> 
			<span> 离投票结束还有<time id="countdown-clock">${vo.closeTime.time}</time> 
				<script>
				
					var clockEL = document.getElementById("countdown-clock");
					var overMS = parseInt(clockEL.innerHTML, 10);
					new CountDownClock(clockEL, new Date(overMS)).start();
				</script> 
			</span>
		</section>
		<section class="content">${vo.content}</section>
		<form
			action="/user/question/vote.do"
			method="post">
			<input
				type="hidden"
				name="questionId"
				value="${vo.id}">
			<ol class="option-box">
				<c:set
					var="optionTypeStr"
					value="${vo.optionType==2?'checkbox':'radio'}"></c:set>
				<c:forEach
					var="op"
					items="${vo.options}">
					<li><label><input
							name="voteOption"
							value="${op.id}"
							type="${pageScope.optionTypeStr}">${op.content}</label></li>
				</c:forEach>
			</ol>
			<div class="action">
				<strong>${message}</strong>
				<c:if test="${param.preview}">
					<button type="button">确定投票</button>
				</c:if>
				<c:if test="${!param.preview }">
					<button type="submit">确定投票</button>
					<a href="javascript:window.history.go(-1)">返回</a>
				</c:if>
				
			</div>
		</form>
	</article>
</div>