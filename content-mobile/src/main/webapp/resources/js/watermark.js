(function (w) {
    var wm = (function (w) {
        var doc = w.document,
            gcanvas = {},
            gctx = {},
            imgQueue = [],
            id = "watermark",
            markSize = [],
            watermark = false,
            watermarkPosition = "bottom-right",
            watermarkPath = "watermark.png?" + (+(new Date())),
            opacity = (255/(100/50)) // 50%
            initCanvas = function () {
                gcanvas = doc.createElement("canvas");
                gcanvas.style.cssText = "display:none;";
                gctx = gcanvas.getContext("2d");
                doc.body.appendChild(gcanvas);
            },
            initWatermark = function () {
                watermark = new Image();
                watermark.src = watermarkPath;

                if (opacity != 255) {
                    if (!watermark.complete)
                        watermark.onload = function () {
                            return applyTransparency();
                        }
                    else
                        return applyTransparency();


                } else {
                    return applyWatermarks();
                }

            },
        // function for applying transparency to the watermark
            applyTransparency = function () {
                var w = watermark.width || watermark.offsetWidth,
                    h = watermark.height || watermark.offsetHeight;
                setCanvasSize(w, h);
                gctx.drawImage(watermark, 0, 0);

                var image = gctx.getImageData(0, 0, w, h);
                var imageData = image.data,
                    length = imageData.length;
                for (var i = 3; i < length; i += 4) {
                    imageData[i] = (imageData[i] < opacity) ? imageData[i] : opacity;
                }
                image.data = imageData;
                gctx.putImageData(image, 0, 0);
                watermark.onload = null;
                try {
                    watermark.src = gcanvas.toDataURL();
                } catch (e) {
                    console.warn("Uncaught SecurityError: Failed to execute 'toDataURL' on 'HTMLCanvasElement': Tainted canvases may not be exported.");
                }
                // assign img attributes to the transparent watermark
                // because browsers recalculation doesn't work as fast as needed
                watermark.width = w;
                watermark.height = h;

                return applyWatermarks();
            },
            configure = function (config) {
                if (config["watermark"])
                    watermark = config["watermark"];
                if (config["path"])
                    watermarkPath = config["path"];
                if (config["position"])
                    watermarkPosition = config["position"];
                if (config["opacity"])
                    opacity = (255 / (100 / config["opacity"]));
                if (config["id"])
                    id = config["id"];
                if (config["markSize"])
                    markSize = config["markSize"].split(',');
                initCanvas();
                return initWatermark();
            }
        setCanvasSize = function (w, h) {
            gcanvas.width = w;
            gcanvas.height = h;
        },
            applyWatermark = function (img) {
                gcanvas.width = img.width || img.offsetWidth;
                gcanvas.height = img.height || img.offsetHeight;
                gctx.drawImage(img, 0, 0);
                var position = watermarkPosition,
                    x = 0,
                    y = 0;

                if (position.left) {
                    x = position.left;
                } else if (position.right) {
                    x = gcanvas.width - watermark.width - position.right;
                }
                if (position.top) {
                    y = position.top;
                } else if (position.bottom) {
                    y = gcanvas.height - watermark.height - position.bottom;
                }

                /*if (position.indexOf("top") != -1)
                 y = 10;
                 else
                 y = gcanvas.height - watermark.height - 10;

                 if (position.indexOf("left") != -1)
                 x = 10;
                 else
                 x = gcanvas.width - watermark.width - 10;*/


                gctx.drawImage(watermark, x, y, markSize[0], markSize[1]);
                img.onload = null;
                var dataUrl = '';
                try {
                    dataUrl = gcanvas.toDataURL()
                } catch (e) {
                    console.warn("Uncaught SecurityError: Failed to execute 'toDataURL' on 'HTMLCanvasElement': Tainted canvases may not be exported.");
                }
                //img.src = dataUrl;
                return dataUrl;
            },
            applyWatermarks = function () {
                //setTimeout(function () {
                var img = doc.getElementById(id);
                if (img.tagName.toUpperCase() == "IMG") {
                    if (!img.complete) {
                        img.onload = function () {
                            return applyWatermark(this);
                        };
                    } else {
                        return applyWatermark(img);
                    }
                }
                //}, 10);
                /*setTimeout(function () {
                 var els = doc.getElementById(id),
                 len = els.length;
                 while (len--) {
                 var img = els[len];
                 if (img.tagName.toUpperCase() != "IMG")
                 continue;

                 if (!img.complete) {
                 img.onload = function () {
                 applyWatermark(this);
                 };
                 } else {
                 applyWatermark(img);
                 }
                 }
                 }, 10);*/
            };


        return {
            init: function (config) {
                return configure(config);
            }
        };
    })(w);
    w.wmark = wm;
})(window);
$.fn.watermark = function (option) {
    var _this = this;
    _this.each(function () {
        var $this = $(this);
        var watermarkImg = option.markUrl;
        var $dealImg = $this.children('img');
        $dealImg.attr('id', $this.attr('id') + 'Img');
        $dealImg.attr('src', option.imgUrl);
        $this.css("margin","auto");
        var theWidth, theHeight;
        $dealImg.on('load', function () {
            theWidth = this.width, theHeight = this.height;
            $this.css({position: 'relative', width: theWidth, height: theHeight}).show();
        });
        var $markImg = $('<img id="wm_img'+option.imgIndex+'" src="' + watermarkImg + '" style="position: absolute; top: 10px; left: 10px; opacity: ' + option.opacity / 100 + '; cursor: move;">');
        $this.append($markImg);
        $("#ww"+option.imgIndex).val($markImg.width());
        $("#wh"+option.imgIndex).val($markImg.height());
        var scaleStep = parseInt((option.maxWidth - option.minWidth) / 10);
        $markImg.on('mousewheel', function (e) {
            e.preventDefault();
            e.stopPropagation();
            var width = $markImg.width();
            if (e.originalEvent.wheelDelta > 0) {//向上
                $markImg.width(width + scaleStep >= option.maxWidth ? option.maxWidth : width + scaleStep);
            } else {//向下
                $markImg.width(width - scaleStep <= option.minWidth ? option.minWidth : width - scaleStep);
            }
            $("#ww"+option.imgIndex).val($markImg.width());
            $("#wh"+option.imgIndex).val($markImg.height());
        });
        $markImg.on('DOMMouseScroll', function (e) {
            e.preventDefault();
            e.stopPropagation();
            var width = $markImg.width();
            if (e.originalEvent.detail < 0) {//向上
                $markImg.width(width + scaleStep >= option.maxWidth ? option.maxWidth : width + scaleStep);
            } else {//向下
                $markImg.width(width - scaleStep <= option.minWidth ? option.minWidth : width - scaleStep);
            }
            $("#ww"+option.imgIndex).val($markImg.width());
            $("#wh"+option.imgIndex).val($markImg.height());
        });
        var lastX, lastY, draging;
        $markImg.on('mousedown', function (e) {
            e.preventDefault();
            e.stopPropagation();
            draging = true;
            lastX = e.clientX;
            lastY = e.clientY;
        });
        $(document).on('mousemove', function (e) {
            e.preventDefault();
            e.stopPropagation();
            if (draging) {
                var diffX = e.clientX - lastX;
                var diffY = e.clientY - lastY;
                var left = parseFloat($markImg.css('left'));
                var top = parseFloat($markImg.css('top'));
                left = left + diffX;
                top = top + diffY;
                if (left <= 0) {
                    left = 0
                } else if (left >= theWidth - $markImg.width()) {
                    left = theWidth - $markImg.width()
                }
                if (top <= 0) {
                    top = 0
                } else if (top >= theHeight - $markImg.height()) {
                    top = theHeight - $markImg.height()
                }
                $("#px"+option.imgIndex).val(left);
                $("#py"+option.imgIndex).val(top);
                $markImg.css({left: left, top: top});
                lastX = e.clientX;
                lastY = e.clientY;
            }
        });
        $(document).on('mouseup', function (e) {
            e.preventDefault();
            e.stopPropagation();
            draging = false;
        });
        $this.off('mark').on('mark', function (e) {
            var left = parseFloat($markImg.css('left'));
            var top = parseFloat($markImg.css('top'));
            var width = $markImg.width();
            var height = $markImg.height();
            var opacity = parseFloat($markImg.css('opacity'));
            e.data64 = wmark.init({
                "position": {left: left, top: top},
                "opacity": option.opacity,
                "id": $dealImg.attr('id'),
                "path": watermarkImg,
                'markSize': width + ',' + height
            });
            e.watermark = {
                x: left,
                y: top,
                width: width,
                height: height,
                opacity:opacity
            };
            option.onMark && option.onMark(e);
        });
    });
    return {
        mark: function () {
            _this.trigger('mark');
        }
    }
};