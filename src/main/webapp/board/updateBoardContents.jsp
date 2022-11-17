<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>SummernoteUpdate</title>

        <!-- include libraries(jQuery, bootstrap) -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <!-- include summernote css/js -->
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-en-US.js"></script>

        <style>
            @font-face {
                font-family: 'J송명';
                src:
                    url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/JSongMyung-Regular-KO.woff2') format('woff2');
                font-weight: normal;
                font-style: normal;
            }

            @font-face {
                font-family: '교보손글씨';
                src:
                    url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2112@1.0/KyoboHandwriting2020A.woff') format('woff');
                font-weight: normal;
                font-style: normal;
            }

            @font-face {
                font-family: '빙그레싸만코체';
                src:
                    url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/BinggraeSamanco-Bold.woff') format('woff');
                font-weight: normal;
                font-style: normal;
            }

            @font-face {
                font-family: '주아체';
                src:
                    url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
                font-weight: normal;
                font-style: normal;
            }

            @font-face {
                font-family: '한림고딕체';
                src:
                    url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2204@1.0/HallymGothic-Regular.woff2') format('woff2');
                font-weight: 400;
                font-style: normal;
            }

            @font-face {
                font-family: '둥근모꼴체';
                src:
                    url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff') format('woff');
                font-weight: normal;
                font-style: normal;
            }

            * {
                box-sizing: border-box;
            }

            body {
                background-color: #03001e;
            }

            .container {
                margin: auto;
                width: 70vw;
            }

            .header {
                margin-bottom: 2%;
                font-family: '둥근모꼴체';
                color: #03001e;
                overflow: hidden;
            }

            .headerTitle {
                margin-right: 1%;
                color: white;
                font-size: large;
            }

            .category {
                margin-bottom: 1%;
                overflow: hidden;
            }

            .category>div {
                float: left;
            }

            .b_category {
                margin-top: 4px;
            }

            .btns {
                text-align: right;
            }

            button {
                color: #03001e;
            }
        </style>

        <script>
            $(document).ready(function () {

                // var fontList = ['굴림', '맑은고딕', '돋움', '바탕', 'J송명', '교보손글씨', '빙그레싸만코체', '주아체', '한림고딕체', '둥근모꼴체', 'NotoSansKR', 'Arial', 'Courier New', 'Verdana', 'Times New Roamn'];
                $('#summernote').summernote({
                    lang: 'ko-KR',
                    height: 400,
                    placeholder: "내용을 입력해주세요.",
                    fontNames: ['굴림', '맑은고딕', '돋움', '바탕', 'J송명', '교보손글씨', '빙그레싸만코체', '주아체', '한림고딕체', '둥근모꼴체', 'Arial', 'Courier New', 'Verdana', 'Times New Roamn'],
                    // addDefaultFonts: false,
                    fontNamesIgnoreCheck: ['굴림', '맑은고딕', '돋움', '바탕', 'J송명', '교보손글씨', '빙그레싸만코체', '주아체', '한림고딕체', '둥근모꼴체', 'Arial', 'Courier New', 'Verdana', 'Times New Roamn'],
                    callbacks: {
                        onImageUpload: function (image) {
                            console.log("works")
                            data = new FormData();
                            data.append("image", image[0]);

                            $.ajax({
                                data: data,
                                type: "post",
                                url: "/imageupload.board",
                                cache: false,
                                contentType: false,
                                processData: false,
                                success: function (url) {
                                    console.log(url)
                                    var image = $('<img>').attr('src', url);
                                    $("#summernote").summernote("insertNode", image[0]);
                                },
                                error: function (a, b, c) {
                                    console.log(a);
                                    console.log(b);
                                    console.log(c);
                                }
                            });
                        }
                    }
                });



                $("option[value=${dto.b_category}]").attr("selected", true);
                


                $('#updateBoardContents').on('click', function () {
                    if (saveContent()) {
                        location.href = "/selectBoardContents.board?b_seq=${dto.b_seq}";
                    }

                });

                function saveContent() {

                    //값 가져오기
                    var summernoteContent = $('#summernote').summernote('code');        //썸머노트(설명)
                    var b_seq = $("#b_seq").val();
                    var b_category = $("#b_category").val();
                    var b_title = $("#b_title").val();

                    if (b_title == "") {
                        alert('제목을 입력해주세요.');
                        return false;
                    }
                    if ($('#summernote').summernote('isEmpty')) {
                        alert("내용을 입력해주세요.");
                        return false;

                    }

                    $.ajax({
                        url: "/updateBoardContents.board",
                        type: "post",
                        async: false,
                        data: {
                            "b_seq": b_seq,
                            "b_category": b_category,
                            "b_title": b_title,
                            "b_content": summernoteContent
                        }
                    });
                    return true;
                };

            });
        </script>
    </head>
    <body>
        <div class="container">
            <div class="updateBoardContents">
                <input type="hidden" id="b_seq" name="b_seq" value="${dto.b_seq }">
                <div class="row header">
                    <div class="category">
                        <div class="headerTitle">카테고리</div>
                        <div class="b_category">
                            <select id="b_category" name="b_category" value="${dto.b_category}">
                                <option value="영화">영화</option>
                                <option value="드라마">드라마</option>
                                <option value="실시간">실시간</option>
                                <option value="후기">후기</option>
                            </select>
                        </div>
                    </div>
                    <div class="title">
                        <div class="headerTitle">제목</div>
                    
                        <div><input type="text" id="b_title" name="b_title" placeholder="제목을 입력해주세요." maxlength="80"
                            style="border:none; width:100%;" value="${dto.b_title }"> 
                            <script>
                                $('#b_title').keyup(function () {
                                    let content = $(this).val();
    
                                    // 글자수 세기
                                    if (content.length == 0 || content == '') {
                                        $('.textCount').text('0자');
                                    } else {
                                        $('.textCount').text(content.length + '자');
                                    }
    
                                    // 글자수 제한
                                    if (content.length > 80) {
                                        // 80자 부터는 타이핑 되지 않도록
                                        $(this).val($(this).val().substring(0, 80));
                                        // 80자 넘으면 알림창 뜨도록
                                        alert('글자수는 80자까지 입력 가능합니다.');
                                    };
                                });
                            </script>
                        </div>
                    </div>
                </div>
                <div class="row body">
                    <div id="summernote" name="b_content">${dto.b_content }</div>
                </div>
                <div class="row footer">
                    <div class="btns">
                        <button type="button" id="updateBoardContents"
                            name="updateBoardContents">수정하기</button>&nbsp
                            <button type="button" id="toList" name="toList"
                            onclick="location.href='/boardList.board?cpage=${boardPage}'">목록으로</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <body>


    </html>