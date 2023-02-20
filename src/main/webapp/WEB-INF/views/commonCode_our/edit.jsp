<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
<link href="//cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<script src="//cdn.quilljs.com/1.3.6/quill.js"></script>


<div class="container">
<c:set var="form_action" value="update" />
<c:if test="${empty resultMap}">
	<c:set var="form_action" value="insert" />
</c:if>

<form id="action-form" action="/commonCodeOur/${form_action}" method="post" enctype ="multipart/form-data">
<input type="hidden" name="REGISTER_SEQ" value="UUID-1111-1111111" >
<input type="hidden" name="MODIFIER_SEQ" value="UUID-1111-1111111" >
<input type="hidden" name="PARENT_COMMON_CODE_ID" value="${resultMap.PARENT_COMMON_CODE_ID}">

<div class="form-group form-row">
	<label class="form-label">File Upload</label>
	<input type="file" name="file_first" class="form-control"> 
</div>
<div class="form-group form-row">
	<div class="col">
		<label>코드 ID</label> <input class="form-control" type="text"
			name="COMMON_CODE_ID" value="${resultMap.COMMON_CODE_ID}"
			required ${form_action == "update" ? "readonly" : ""} />
		<div class="invalid-tooltip">
			
		</div>
	</div>
</div>
<div class="form-group form-row">
	<div class="col">
		<label>코드명 </label> <input class="form-control" type="text"
			name="NAME" value="${resultMap.NAME}" placeholder="임시 코드명" required ${statusDisabled}/>
		<div class="invalid-tooltip">
			
		</div>
	</div>
</div>
<div class="form-group form-row">
	<div class="col">
		<label>표시 순서 <span class="text-muted">(<spring:message
					code="text.option" />)
		</span></label> 
		<select class="form-control" name="ORDER_NUMBER" ${statusDisabled}>
			<%-- for(int number=1;number <=5: number++) { --%>
			<c:forEach var="number" begin="1" end="5">
				<option 
					${resultMap.ORDER_NUMBER == number ? 'selected' : ''}>${number }</option>
			</c:forEach>
		</select>
	</div>
</div>
<div class="form-group form-row">
	<div class="col">
		<label>설명 <span class="text-muted">(<spring:message
					code="text.option" />)
		</span></label>
		<%-- <textarea class="form-control" rows="3" name="DESCRIPTION"
			placeholder=""
			${statusDisabled}>${resultMap.DESCRIPTION }</textarea> --%>
			<div id="editor" class="form-control"></div>
			<input type="hidden" name="DESCRIPTION" id="description"/>
	</div>
</div>
<div class="form-group form-row">
	<div class="col">
		<div class="form-check">
			<input type="checkbox" class="form-check-input" name="SYSTEM_CODE_YN"
				
				${resultMap.SYSTEM_CODE_YN == 'System_Code_Yes' ? 'checked' : ''}
				${statusDisabled}> <label class="form-check-label">시스템 코드
				여부</label>
		</div>
	</div>
</div>
<div class="form-group form-row">
	<div class="col">
		<div class="form-check">
			<input type="checkbox" class="form-check-input" name="USE_YN"
				 ${resultMap.USE_YN == 'Yes' ? 'checked' : ''}
				${statusDisabled}> <label class="form-check-label">사용 여부</label>
		</div>
	</div>
</div>
<div class="row justify-content-between">
	<div class="col">
			<button class="btn btn-primary" id = "submit-button"
				>
				${form_action}
			</button>
		<button class="btn btn-outline-info"
			>
			List
		</button>
	</div>

	<div class="col text-right">
		<%-- <button type="button" class="btn btn-secondary" data-dismiss="modal">
			
		</button> --%>
	</div>
	<script>
	var editor = new Quill('#editor', {
		theme: 'snow'
	});

	//add content in quill editor
	editor.setContents(${resultMap.DESCRIPTION});
	editor.disable();
	editor.root.style.backgroundColor = '#f2f2f2';


	let sumbmitButton = document.querySelector("#submit-button");
	sumbmitButton.addEventListener("click", function(event) {
		let content = editor.getContents();
		let description = document.querySelector("#description");
		description.value = JSON.stringify(content);


		let form = document.querySelector("#action-form");
		form.submit();
	})
	</script>
</div>
</form>
</div>