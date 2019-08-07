/**
 * custom.js
 */
//
// // Theme settings
//    //Open-Close-right sidebar
//    $(".right-side-toggle").click(function () {
//        $(".right-sidebar").slideDown(50);
//        $(".right-sidebar").toggleClass("shw-rside");
//        // Fix header
//        $(".fxhdr").click(function () {
//            $("body").toggleClass("fix-header");
//        });
//        // Fix sidebar
//        $(".fxsdr").click(function () {
//            $("body").toggleClass("fix-sidebar");
//        });
//        // Service panel js
//        if ($("body").hasClass("fix-header")) {
//            $('.fxhdr').attr('checked', true);
//        }
//        else {
//            $('.fxhdr').attr('checked', false);
//        }
//        if ($("body").hasClass("fix-sidebar")) {
//            $('.fxsdr').attr('checked', true);
//        }
//        else {
//            $('.fxsdr').attr('checked', false);
//        }
//    });
//    
//    $(function () {
//        var set = function () {
//                var topOffset = 60,
//                    width = (window.innerWidth > 0) ? window.innerWidth : this.screen.width,
//                    height = ((window.innerHeight > 0) ? window.innerHeight : this.screen.height) - 1;
//                if (width < 768) {
//                    $('div.navbar-collapse').addClass('collapse');
//                    topOffset = 100; /* 2-row-menu */
//                } else {
//                    $('div.navbar-collapse').removeClass('collapse');
//                }
//
//                /* ===== This is for resizing window ===== */
//
//                if (width < 1170) {
//                    body.addClass('content-wrapper');
//                    $(".open-close i").removeClass('icon-arrow-left-circle');
//                    $(".sidebar-nav, .slimScrollDiv").css("overflow-x", "visible").parent().css("overflow", "visible");
//                    $(".logo span").hide();
//                } else {
//                    body.removeClass('content-wrapper');
//                    $(".open-close i").addClass('icon-arrow-left-circle');
//                    $(".logo span").show();
//                }
//
//                height = height - topOffset;
//                if (height < 1) {
//                    height = 1;
//                }
//                if (height > topOffset) {
//                    $("#page-wrapper").css("min-height", (height) + "px");
//                }
//            },
//            url = window.location,
//            element = $('ul.nav a').filter(function () {
//                return this.href === url || url.href.indexOf(this.href) === 0;
//            }).addClass('active').parent().parent().addClass('in').parent();
//        if (element.is('li')) {
//            element.addClass('active');
//        }
//        $(window).ready(set);
//        $(window).on("resize", set);
//    });