
/**
 * 控制菜单颜色
 */
$(document).ready(function() {
			var i = 0;
			$("[class$=nav_list]").each(function() {
						var str = "#nav" + i;
						$(str).mouseenter(function() {
									$(str).css({
												"background-color" : "#E9E9E9",
												"color" : "#333333"
											});
								});
						$(str).mouseleave(function() {
									$(str).css({
												"background-color" : "#333333",
												"color" : "#FFFFFF"
											});
								});
						i++;
					});
		/*	$("#menu").mouseleave(function() {
						$(".Snav_list").css({
									"background-color" : "#CCCCCC",
									"color" : "#333333"
								});
					});
*/
		});
