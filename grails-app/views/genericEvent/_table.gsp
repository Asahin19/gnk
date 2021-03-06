<%@ page import="org.gnk.tag.Tag; org.gnk.admin.right" %>

%{--<legend>${message(code: 'adminRef.tag.list')}</legend>--}%
<legend>Liste des intrigues génériques existantes</legend>

<table id="listTable" class="table table-bordered">
    <thead>
    <tr>
        <th>Titre</th>
        <th>Age minimum</th>
        <th>Age maximum</th>

        <g:hasRights lvlright="${right.REFMODIFY.value()}">
            <g:hasRights lvlright="${right.REFDELETE.value()}">
                <th>
                    %{--<g:message code="default.delete"/>--}%
                    Suprimmer
                </th>
            </g:hasRights>
        </g:hasRights>

    </tr>
    </thead>
    <tbody>
    <g:each in="${genericEventInstanceList}" status="i" var="genericEventInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            %{--<td>${fieldValue(bean: genericEventInstance, field: "title")}</td>--}%
            <td>
                <g:hasRights lvlright="${right.REFMODIFY.value()}">
                    <a href="${createLink(action: "edit", id: "${genericEventInstance?.id}")}">
                        ${fieldValue(bean: genericEventInstance, field: "title")}</a>
                </g:hasRights>
            </td>

            <td>${fieldValue(bean: genericEventInstance, field: "ageMin")}</td>
            <td>${fieldValue(bean: genericEventInstance, field: "ageMax")}</td>
            <td>
        <g:form>
            <fieldset class="buttons">
                <g:hiddenField name="id" value="${genericEventInstance?.id}"/>
                <g:hasRights lvlright="${right.REFDELETE.value()}">
                    <g:actionSubmit class="btn btn-danger" action="delete"
                                    value="${message(code: 'default.delete')}"
                                    onclick="return confirm('Delete this plot ?');"/>
                </g:hasRights>
            </fieldset>
        </g:form>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>

%{--<input type="hidden" name="idTagurl" id="idTagurl" data-url="<g:createLink controller="genericEvent" action="delete"/>"/>--}%
%{--<input type="hidden" name="idTagediturl" id="idTagediturl" data-url="<g:createLink controller="genericEvent" action="edit"/>"/>--}%
%{--<input type="hidden" name="idTagInformationurl" id="idTagInformationurl" data-url="<g:createLink controller="genericEvent" action="show"/>"/>--}%