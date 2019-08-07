/**
 * reportForm
 */
var FormStuff = {
  
  init: function() {
    this.applyConditionalRequired();
    this.bindUIActions();
  },
  
  bindUIActions: function() {
    $("input[type='radio'], input[type='checkbox']").on("change", this.applyConditionalRequired);
  },
  
  applyConditionalRequired: function() {
    
    $(".require-if-active").each(function() {
      var el = $(this);
      if ($(el.data("require-pair")).is(":checked")) {
        el.prop("required", true);
      } else {
        el.prop("required", false);
      }
    });
    
  }
  
};

FormStuff.init();

function updateReport(){
	
//	let cases = $("input[type='radio']:checked").val();
//	if (cases == 0) {
//		var detail = $("input[id='which-user']").val();
//	} else if (cases == 1) {
//		var detail = $("input[id='which-study']").val();
//	} else if (cases == 2) {
//		var detail = $("input[id='which-article']").val();
//	}
//	//var caseset = cases;
//	
//	var reason = $("select[name='reason'] option:selected").val();
//	
//	var content = $("textarea[id='content']").val();
//	alert("content: " + content);
//	
//	location = "updateReport.do?cases="+cases+"&detail="+detail+"&reason="+reason+"&content="+content;
	
	//숫자로 와야하는 넘들을 잡아서 parseint를 if문 조건에 넣으세요 그리고 return false;
	
	
	alert("신고가 접수되었습니다.");

	
}

