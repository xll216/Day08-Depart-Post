<%--
  Created by 蓝鸥科技有限公司  www.lanou3g.com.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>test</title>
    <script type="text/javascript">
        function createXMLHttpRequest() {
            try {
                return new XMLHttpRequest();
            } catch (e) {
                try {
                    return new ActiveXObject("Msxml2.HTTP");
                } catch (e) {
                    try {
                        return new ActiveXObject("Microsoft.HTTP");
                    } catch (e) {
                        throw e;
                    }
                }
            }
        }

        /*根据部门联动职务*/
        function showPost(obj) {
            // 获取选中部门
            var departId = obj.value;

            //1,获得XMLHttpRequest对象
            var xmlHttp = createXMLHttpRequest();
            //2,打开连接
            var url = "${pageContext.request.contextPath}/findPost.action";

            xmlHttp.open("POST", url, true);
            //3,设置请求头
            xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            //4,发出请求时,给出请求体
            xmlHttp.send("departId=" + departId);
            //5,给xmlHttp对象的onreadystatechange事件注册监听
            xmlHttp.onreadystatechange = function () {
                if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                    // 获取返回的 json 数据
                    var jsonData = eval("(" + xmlHttp.responseText + ")");

                    // 显示到 select 的 option 中
                    var selectE = document.getElementById("post");

                    selectE.innerHTML = "<option value=''>----请--选--择----</option>";
                    for (var i = 0; i < jsonData.length; i++) {
                        var postObj = jsonData[i];
                        selectE.innerHTML += "<option value='" + postObj.id + "'>" + postObj.name + "</option>";
                    }
                }
            };
        }
    </script>

</head>
<body>

部门：
<select id="depart" onchange="showPost(this)">
    <option value="-1">---请选择---</option>
    <s:iterator value="departments" var="depart">
        <option value="${depart.id}">${depart.name}</option>
    </s:iterator>

</select>
职务：
<select id="post">
    <option value="-1">---请选择---</option>
</select>

</body>
</html>
