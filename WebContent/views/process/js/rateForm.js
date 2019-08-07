/**
 * rateForm
 */

//
//var $star_rating = $('.star-rating .fa');
//
//var SetRatingStar = function() {
//  return $star_rating.each(function() {
//    if (parseInt($star_rating.siblings('input.rating-value').val()) >= parseInt($(this).data('rating'))) {
//      return $(this).removeClass('fa-star-o').addClass('fa-star');
//    } else {
//      return $(this).removeClass('fa-star').addClass('fa-star-o');
//    }
//  });
//};
//
//$star_rating.on('click', function() {
//  $star_rating.siblings('input.rating-value').val($(this).data('rating'));
//  return SetRatingStar();
//});
//
//SetRatingStar();
//$(document).ready(function() {
//
//});

function updateRate(num, ids){
	var rates ="";
	for(var i =0; i<num; i++){
		var rate =$("select[name=rate"+i+"] option:selected").val()
		rates += rate+"a";
	}
	
	location="updateRate.do?num="+num+"&ids="+ids+"&rates="+rates;
	
	alert("평점을 매겨주셔서 감사합니다. 10포인트가 저장되었습니다.");

}
