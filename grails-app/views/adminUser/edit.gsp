<%--
  Created by IntelliJ IDEA.
  User: Nico
  Date: 20/04/14
  Time: 12:44
--%>

<%@ page import="org.gnk.admin.right" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Gestion Utilisateur</title>
</head>

<body>

<div role="main" class="administration">
<g:if test="${flash.error}">
    <div class="alert alert-error" style="display: block">${flash.error}</div>
</g:if>
<g:if test="${flash.success}">
    <div class="message alert-success" style="display: block">${flash.success}</div>
</g:if>

<g:hasRights lvlright="${right.USEROPEN.value()}">
    <h3>Profil</h3>

    <div class="row-fluid">
        <div class="span6">
            <div class="indentProfil">
                <div class="row profil-margin">
                    <g:form method="post" controller="adminUser" action="modifyUser" id="${user.id}">
                        <label for="lastname"><g:message code="default.profil.lastname"/> :</label>
                        <g:hasRights lvlright="${right.USERMODIFY.value()}">
                            <input type="text" name="lastnamemodif" id="lastname" class="form-control"
                                   placeholder='${user.lastname}'/>
                            <span class="input-group-btn">
                                <button class="btn btn-default btn-submit " type="submit"><g:message
                                        code="default.action.modify"/></button>
                            </span>
                        </g:hasRights>
                        <g:hasNotRights lvlright="${right.USERMODIFY.value()}">
                            <span class="normal-txt">${user.lastname}</span>
                        </g:hasNotRights>
                    </g:form>
                </div>

                <div class="row profil-margin">
                    <g:form method="post" controller="adminUser" action="modifyUser" id="${user.id}">
                        <label for="firstname"><g:message code="default.profil.firstname"/> :</label>
                        <g:hasRights lvlright="${right.USERMODIFY.value()}">
                            <input type="text" name="firstnamemodif" id="firstname" class="form-control"
                                   placeholder="${user.firstname}">
                            <span class="input-group-btn">
                                <button class="btn btn-default btn-submit" type="submit"><g:message
                                        code="default.action.modify"/></button>
                            </span>
                        </g:hasRights>
                        <g:hasNotRights lvlright="${right.USERMODIFY.value()}">
                            <span class="normal-txt">${user.firstname}</span>
                        </g:hasNotRights>
                    </g:form>
                </div>

                <div class="row profil-margin">
                    <g:form method="post" controller="adminUser" action="modifyUser" id="${user.id}">
                        <label for="email"><g:message code="default.profil.email"/> :</label>
                        <g:hasRights lvlright="${right.USERMODIFY.value()}">
                            <input type="text" name="usernamemodif" id="email" class="form-control"
                                   placeholder="${user.username}"/>
                            <span class="input-group-btn">
                                <button class="btn btn-default btn-submit" type="submit"><g:message
                                        code="default.action.modify"/></button>
                            </span>
                        </g:hasRights>
                        <g:hasNotRights lvlright="${right.USERMODIFY.value()}">
                            <span class="normal-txt">${user.username}</span>
                        </g:hasNotRights>
                    </g:form>
                </div>
            </div>
        </div>

        <g:hasRights lvlright="${right.USERMODIFY.value()}">
            <div class="span6 ">
                <div class="indentPassword">
                    <div class="row profil-margin">

                        <div class="row profil-margin">
                            <g:form method="post" controller="adminUser" action="modifyUser" id="${user.id}">
                                <label for="cpassword"><g:message
                                        code="default.action.changedPassword"/>  :</label> <input
                                    type="password" id="cpassword" name="passwordChanged"
                                    placeholder="<g:message code="default.minsize.password"/>"/><br/>
                                <label for="copassword"><g:message
                                        code="default.action.acceptPassword"/> :</label> <input
                                    type="password" id="copassword" name="passwordChangedConfirm"/><br/>

                                <div class="input-group">
                                    <span class="input-group-btn center">
                                        <button class="btn btn-default btn-large" type="submit"><g:message
                                                code="default.action.modify"/></button>
                                    </span>
                                </div>
                            </g:form>
                        </div>
                    </div>
                </div>
            </div>
        </g:hasRights>
    </div>
    <g:link class="btn btn-warning" controller="adminUser" action="statistic" id="${user.id}">
        <g:message code="default.user.statistique"/>
    </g:link>
    <g:hasRights lvlright="${right.RIGHTSHOW.value()}">
        <h3><g:message code="default.profil.right"/>:</h3>
        <input type="hidden" value=${disabled} id="disabledValue"/>
        <g:form controller="adminUser" class="form-group" action="changeperm" id="${user.id}" method="post">
            <table class="table">
                <thead>
                <tr>
                    <th></th>
                    <th><g:message code="default.title.my.profil"/></th>
                    <th><g:message code="default.title.user"/></th>
                    <th><g:message code="default.title.my.intrigue"/></th>
                    <th><g:message code="default.title.intrigue"/></th>
                    <th><g:message code="default.title.my.gn"/></th>
                    <th><g:message code="default.title.gn"/></th>
                    <th><g:message code="default.title.referentiel"/></th>
                    <th><g:message code="default.title.manageRight"/></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><g:message code="default.action.open"/></td>
                    <td><g:checkBox id="c0" name="checkbox0" value="${lb.get(0)}"></g:checkBox></td>
                    <td><g:checkBox id="c1" name="checkbox1" value="${lb.get(1)}"></g:checkBox></td>
                    <td><g:checkBox id="c2" name="checkbox2" value="${lb.get(2)}"></g:checkBox></td>
                    <td><g:checkBox id="c3" name="checkbox3" value="${lb.get(3)}"></g:checkBox></td>
                    <td><g:checkBox id="c4" name="checkbox4" value="${lb.get(4)}"></g:checkBox></td>
                    <td><g:checkBox id="c5" name="checkbox5" value="${lb.get(5)}"></g:checkBox></td>
                    <td><g:checkBox id="c18" name="checkbox18" value="${lb.get(18)}"></g:checkBox></td>
                    <td><g:checkBox id="c21" name="checkbox21" value="${lb.get(21)}"></g:checkBox></td>
                </tr>
                <tr>
                    <td><g:message code="default.action.modify"/></td>
                    <td><g:checkBox id="c6" name="checkbox6" value="${lb.get(6)}"></g:checkBox></td>
                    <td><g:checkBox id="c7" name="checkbox7" value="${lb.get(7)}"></g:checkBox></td>
                    <td><g:checkBox id="c8" name="checkbox8" value="${lb.get(8)}"></g:checkBox></td>
                    <td><g:checkBox id="c9" name="checkbox9" value="${lb.get(9)}"></g:checkBox></td>
                    <td><g:checkBox id="c10" name="checkbox10" value="${lb.get(10)}"></g:checkBox></td>
                    <td><g:checkBox id="c11" name="checkbox11" value="${lb.get(11)}"></g:checkBox></td>
                    <td><g:checkBox id="c19" name="checkbox19" value="${lb.get(19)}"></g:checkBox></td>
                    <td><g:checkBox id="c22" name="checkbox22" value="${lb.get(22)}"></g:checkBox></td>
                </tr>
                <tr>
                    <td><g:message code="default.action.delete"/></td>
                    <td><g:checkBox id="c12" name="checkbox12" value="${lb.get(12)}"></g:checkBox></td>
                    <td><g:checkBox id="c13" name="checkbox13" value="${lb.get(13)}"></g:checkBox></td>
                    <td><g:checkBox id="c14" name="checkbox14" value="${lb.get(14)}"></g:checkBox></td>
                    <td><g:checkBox id="c15" name="checkbox15" value="${lb.get(15)}"></g:checkBox></td>
                    <td><g:checkBox id="c16" name="checkbox16" value="${lb.get(16)}"></g:checkBox></td>
                    <td><g:checkBox id="c17" name="checkbox17" value="${lb.get(17)}"></g:checkBox></td>
                    <td><g:checkBox id="c20" name="checkbox20" value="${lb.get(20)}"></g:checkBox></td>
                    <td><g:checkBox id="c23" name="checkbox23" value="${lb.get(23)}"></g:checkBox></td>
                </tr>
                </tbody>
            </table>
            <g:hasRights lvlright="${right.RIGHTMODIF.value()}">
                <button type="submit" class="btn btn-default">Valider</button>
            </g:hasRights>
        </g:form>
        </div>
    </g:hasRights>
</g:hasRights>
<g:link type="button" class="btn btn-primary btn-large right" action="list"><g:message
        code="default.action.back"/></g:link>
<script type="text/javascript">

    $(function () {
        var isDisabled = $("#disabledValue").val();
        for (var i = 0; isDisabled == "1" && i < 24; i++) {

            $("#c" + i).attr("disabled", "disabled");
        }
    });
</script>
</body>
</html>