<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp</title>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
@font-face {
   font-family: 'DungGeunMo';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}

.dongfont {
   font-family: 'DungGeunMo';
}

* {
   box-sizing: border-box;
   margin: auto;
   color: black;
}

body {
   background-color: #03001e;
}

.container {
   margin: auto;
   display: flex;
   overflow: hidden;
   background-color: #03001e;
}

.joinForm {
   background-color: white;
   float: left;
   margin: auto;
   display: inline-block;
   float: left;
   width: 460px;
   text-align: center;
   border-radius: 7px;
}

input {
   width: 400px;
   height: 30px;
}

#email {
   width: 200px;
}

.selectOption {
   height: 30px;
   width: 175px;
   text-align: center;
}

.requiredField {
   color: red;
}

#result, #duplResult {
   margin: 0;
}

.id, .logo, .nickname, .pw, .pwcheck, .name, .phone, .email, .postcode,
   .address1, .address2, .margin_top, #result, #duplResultID,
   #duplResultNickname {
   margin: 15px 0;
}

.logo {
   font-size: 23px;
   font-weight: bold;
   margin: 40px 0;
}

.footer {
   margin-top: 10px;
   text-align: center;
}

#duplCheckID, #duplCheckNickname {
   width: 100px;
}

.btns {
   width: 100%;
   margin-top: 10px;
   margin-bottom: 9px;
   text-align: center;
}

.btns button {
   height: 30px;
   width: 92px;
}

.footer {
   margin: auto;
}
</style>
</head>

<body>
   <form action="/signup.member" method="post" id="frm">
      <div class="container signupForm col-12" style="min-width: 350px;">
         <div class="joinForm col-12">
            <div class="logo dongfont">회원가입</div>
            <div class="id col-12">
               <span class="dongfont">아이디<span class="requiredField">*<span></span>
                     <div class="margin_top col-12">
                        <input type="text" name="id" id="id" maxlength="16"
                           placeholder="6~16자의 영문 소문자, 숫자와 특수기호(_)">
                        <div id="duplResultID"></div>
                     </div>
            </div>
            <div class="nickname col-12">
               <span class="dongfont">닉네임<span class="requiredField">*<span></span>
                     <div class="margin_top col-12">
                        <input type="text" name="nickname" id="nickname" maxlength="9"
                           placeholder="2~8자 영문 대 소문자,한글">
                        <div id="duplResultNickname"></div>
                     </div>
            </div>
            <div class="pw col-12">
               <span class="dongfont">패스워드<span class="requiredField">*<span></span>
                     <div class="margin_top col-12">
                        <input type="password" name="pw" id="pw" maxlength="16"
                           placeholder="8~16자 영문 대 소문자,숫자,특수문자(~!@#$%)">
                     </div>
            </div>
            <div class="pwcheck col-12">
               <span class="dongfont">패스워드 확인</span>
               <div class="margin_top col-12">
                  <input type="password" id="checkpw" maxlength="16">
                  <div id="result"></div>
               </div>
            </div>
            <div class="name col-12">
               <span class="dongfont">이름<span class="requiredField">*<span></span>
                     <div class="margin_top col-12">
                        <input type="text" name="name" id="name" placeholder="2~5자 한글"
                           maxlength="5">
                     </div>
            </div>
            <div class="phone col-12">
               <span class="dongfont">전화번호<span class="requiredField">*<span></span>
                     <div class="margin_top col-12">
                        <input type="text" name="phone" id="phone" placeholder="숫자만 입력"
                           maxlength="11">
                     </div>
            </div>
            <div class="email col-12">
               <span class="dongfont">이메일<span class="requiredField">*<span></span>
                     <div class="margin_top col-12">
                        <input type="text" name="email" id="email"
                           placeholder="영어 대 소문자, 숫자" maxlength="20"> @ <select
                           id="emailAddress" name="emailAddress" class="selectOption">
                           <option value="gmail.com">gmail.com</option>
                           <option value="naver.com">naver.com</option>
                           <option value="hanmail.net">hanmail.net</option>
                           <option value="nate.com">nate.com</option>
                        </select>
                     </div>
            </div>
            <div class="postcode col-12">
               <div class="col-12">
                  <span class="dongfont">우편번호</span>&nbsp&nbsp<input type="button"
                     onclick="postcode()" value="우편번호 찾기" id="btnsearch"
                     style="width: 100px;">
               </div>
               <div class="margin_top col-12">
                  <input type="text" name="postcode" id="postcode"
                     placeholder="우편번호" maxlength="7">
               </div>
            </div>
            <div class="address1 col-12">
               <span class="dongfont">주소</span>
               <div class="margin_top col-12">
                  <input type="text" name="address1" id="address1" placeholder="주소"
                     maxlength="65">
               </div>
            </div>
            <div class="address2 col-12">
               <span class="dongfont">상세주소</span>
               <div class="margin_top col-12">
                  <input type="text" name="address2" id="address2"
                     placeholder="상세주소" maxlength="65">
               </div>
            </div>
            <div class="footer col-12">
               <div class="btns">
                  <a href=/main><button id="signup" class="dongfont">회원가입</button></a>&nbsp&nbsp<a
                     href="/member/signin.jsp"><button type="button"
                        class="dongfont">뒤로 가기</button></a>&nbsp
                  <button type="reset" id="resetBtn" class="dongfont">다시 입력</button>
               </div>
            </div>
         </div>
      </div>
      </div>
   </form>

   <script>
      //다시입력 버튼을 눌렀을때
      $("#resetBtn").on("click", function() {
         location.reload();
         $("#id").focus();
      });
      // 우편번호
      $("#btnsearch")
            .on(
                  "click",
                  function() {
                     new daum.Postcode(
                           {
                              oncomplete : function(data) {
                                 document.getElementById('postcode').value = data.zonecode;
                                 document.getElementById("address1").value = data.jibunAddress;
                              }
                           }).open();
                     postcodeCheck = true;
                     address1Check = true;
                  })
      //비번 체크            
      $("#pw,#checkpw").on("input", function() {
         if (!($("#pw").val() == $("#checkpw").val())) {
            $("#result").text("패스워드가 일치하지 않습니다.");
            $("#result").css("color", "red");
            $("#result").css("font-family", "'DungGeunMo'");
            pwCheck = false;
         } else {
            $("#result").text("패스워드가 일치합니다.");
            $("#result").css("color", "green");
            $("#result").css("font-family", "'DungGeunMo'");
            pwCheck = true;
         }
      })
      //아이디 중복검사
      $("#id").on("input", function() { // 한 글자 쓸 때마다 ajax가 나간다(쏴라)
         idCheck = false;
         let id = $("#id").val();
         $.ajax({
            url : "/idDuplCheck.member",
            data : {
               "id" : id
            }
         }).done(function(resp) {
            if (resp == "true") { // 아이디가 이미 존재하므로 사용할 수 없는 경우
               $("#duplResultID").text("중복된 ID 입니다.");
               $("#duplResultID").css("color", "red");
            } else { // 아이디가 존재하지 않으므로 사용할 수 있는 경우
               $("#duplResultID").text("중복되지 않은 ID 입니다.");
               $("#duplResultID").css("color", "green");
               idCheck = true;
            }
         })
      })
      //닉네임 중복검사
      $("#nickname").on("input", function() {
         nicknameCheck = false;
         let nickname = $("#nickname").val();
         $.ajax({
            url : "/nicknameDuplCheck.member",
            data : {
               "nickname" : nickname
            }
         }).done(function(resp) {
            if (resp == "true") { // 닉네임이 이미 존재하므로 사용할 수 없는 경우
               $("#duplResultNickname").text("중복된 닉네임입니다.");
               $("#duplResultNickname").css("color", "red");
            } else { // 닉네임이 존재하지 않으므로 사용할 수 있는 경우
               $("#duplResultNickname").text("중복되지 않은 닉네임입니다.");
               $("#duplResultNickname").css("color", "green");
               nicknameCheck = true;
            }
         })
      })

      $("#postcode").on("input", function() {
         alert("우편번호 찾기 버튼을 클릭해주세요.");
          $(this).val("");

      })
      $("#address1").on("input", function() {
         alert("우편번호 찾기 버튼을 클릭해주세요.");
          $(this).val("");

      })
      
      //회원가입 버튼을 눌렀을때
      $("#signup").on(
            "click",
            function() {
               if ($("#id").val() == "" || $("#pw").val() == ""
                     || $("#name").val() == ""
                     || $("#nickname").val() == ""
                     || $("#phone").val() == ""
                     || $("#email").val() == "") {
                  alert("아이디, 패스워드, 닉네임, 이름, 전화번호, 이메일은 필수입력값입니다.");
                  return false;
               }

               if (!idCheck) {
                  alert("아이디 중복체크를 먼저 수행해주세요.");
                  return false;
               }
               if (!nicknameCheck) {
                  alert("닉네임 중복체크를 먼저 수행해주세요.");
                  return false;
               }
               if (!pwCheck) {
                  alert("패스워드가 일치하지 않습니다.");
                  return false;
               }
               let idRegex = /^[a-z0-9_]{6,20}$/; //6~20자의 영문 소문자, 숫자와 특수기호(_) 가능
               let nicknameRegex = /^[가-힣a-zA-Z]{2,8}$/; //2~8자 한글,영문 대 소문자 가능
               let pwRegex = /^[A-Za-z0-9~!@#$%]{8,20}$/; //8~20자 영문 대 소문자, 숫자, 특수문자(~!@#$%) 가능
               let nameRegex = /^[가-힣]{2,5}$/; // 한글 2~5자
               let phoneRegex = /^01\d\d{3,4}\d{4}$/; //010으로 시작하고 숫자만 입력
               let emailRegex = /^[a-zA-Z0-9]{1,20}$/; //숫자,영어 대 소문자 가능
               if ($("#id").val() != "") {
                  if (!idRegex.test($("#id").val())) {
                     alert("아이디 형식을 확인해주세요.");
                     return false;
                  }
               }
               if ($("#nickname").val() != "") {
                  if (!nicknameRegex.test($("#nickname").val())) {
                     alert("닉네임 형식을 확인해주세요.");
                     return false;
                  }
               }
               if ($("#pw").val() != "") {
                  if (!pwRegex.test($("#pw").val())) {
                     alert("패스워드 형식을 확인해주세요.");
                     return false;
                  }
               }
               if ($("#name").val() != "") {
                  if (!nameRegex.test($("#name").val())) {
                     alert("이름 형식을 확인해주세요.");
                     return false;
                  }
               }
               if ($("#phone").val() != "") {
                  if (!phoneRegex.test($("#phone").val())) {
                     alert("전화번호 형식을 확인해주세요.");
                     return false;
                  }
               }
               location.href = "/signup.member";
            })
   </script>
</body>
</html>